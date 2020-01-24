from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect, HttpResponseRedirect
from django.db.models import F
from alcal.models import Carrera, Estudiante, Docente, Curso, Nota, Materia, Seguimiento, Persona, Inasistencia, Faltas
from .forms import NameForm, Cursos, NuevoEstudiante, NuevoPadre, NuevoDocente, NuevaNota, SelectorDeAlumno, \
    NotaParcial, NuevoSeguimiento, FechaInasistencias, InasistenciaForm
from alcal.CONSTANTS import *
from datetime import date
from datetime import datetime, timedelta


def actualizar_falta(f, e, m, t, ed):
    print('Fecha: {} - Estudainte: {}'.format(f, e))
    if not m:
        m = 0
    if not t:
        t = 0
    if not ed:
        ed = 0
    c = '{}{}{}'.format(cod_letra[int(m)], cod_letra[int(t)], cod_letra[int(ed)])
    estud = Estudiante.objects.get(legajo=e)
    cant = codigos[c.upper()]

    if Faltas.objects.filter(fecha=f, estudiante=e):
        Faltas.objects.filter(fecha=f, estudiante=estud).update(cantidad=cant)
        print('actualizada')
    else:
        Faltas.objects.create(estudiante=estud, cantidad=cant, fecha=f)
        print('creada')
    print("Falta guardada")


@login_required(login_url='/admin/login')
def index(request):
    now = "......."
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)


@login_required(login_url='/admin/login')
def portada(request):
    carreras = Carrera.objects.order_by('anios')
    usuario = str(request.user)
    cant_estudiantes = Estudiante.objects.count()
    cant_femenino = 1#len(Estudiante.objects.filter(genero='Femenino'))
    cant_masculino = 2 #len(Estudiante.objects.filter(genero='Masculino'))
    return render(request, 'alcal/blue/index.html',
                  {
                      'carreras': carreras,
                      'usuario': usuario,
                      'cant_estudiantes': cant_estudiantes,
                      'cant_femenino': cant_femenino,
                      'cant_masculino': cant_masculino,
                  }
                  )


@login_required(login_url='/admin/login')
def perfil(request):
    estudiantes = Estudiante.objects.all()
    docentes = Docente.objects.all()
    pa = Estudiante.objects.filter(legajo=1).values('url_foto')
    primer_alumno = pa[0]['url_foto']
    return render(request, 'alcal/blue/profile.html',
                  {
                      'estudiantes': estudiantes,
                      'docentes': docentes,
                      'primer_alumno': primer_alumno
                  }
                  )


@login_required(login_url='/admin/login')
def buscar_curso(request):

    curso_elegido = 1
    if request.method == "POST":
        pass
    else:
        form = NameForm(request.POST)

    print("*******")
    return render(request, 'alcal/blue/buscar_curso.html',
                  {
                      'form': form,
                      'curso_elegido': curso_elegido
                  }
                  )


@login_required(login_url='/admin/login')
def cursos(request):
    anio_elegido = 1
    division_elegida = "A"
    form = Cursos(request.POST)
    estudiantes = Estudiante.objects.order_by('apellido')

    if request.method == "POST":
        anio_elegido = request.POST['cursonombre'][0]
        division_elegida = request.POST['cursonombre'][1]

    return render(request, 'alcal/blue/cursos.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida
                  })


@login_required(login_url='/admin/login')
def inasistencias_por_estudiante(request):
    valor = None
    lista = ['PT',
             'ST',
             'TT',
             'CF',
             'ND',
             'NF',
             'CD']
    if request.method == "POST":
        print("Post")
        form = SelectorDeAlumno(request.POST)
        if form.is_valid():
            boletin = []
            valor = form.cleaned_data['estudiante'].id
            valor_curso = form.cleaned_data['curso'].id
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            nota = Nota.objects.filter(estudiante=Estudiante.objects.get(id=valor))
            materias = Materia.objects.filter(curso=valor_curso)
            seg = None
            try:
                id_pers = Persona.objects.get(id=valor).estudiante.legajo
                print(id_pers)
                seg = Seguimiento.objects.order_by('fecha').filter(estudiante__legajo=id_pers)
                print(seg)
            except:
                seg = "???"
            for i in range(len(materias)):
                id_materia = materias[i].id
                boletin.append([])
                boletin[i].append('{}'.format(materias[i].nombre))
                for j in range(7):
                    try:
                        boletin[i].append(nota.filter(materia=id_materia).filter(instancia=lista[j]).last().numero)
                    except:
                        boletin[i].append("-")
            context = {'var': Estudiante.objects.get(id=valor),
                       'seguimiento': seg,
                       'nota': nota,
                       'form': form,
                       'curso': curso,
                       'materias': materias,
                       'boletin': boletin,
                       }
            print(seg)
            return render(request, 'alcal/blue/inasistencias_por_estudiante.html', context)
    else:
        print("Else")
        form = SelectorDeAlumno()
    return render(request, 'alcal/blue/inasistencias_por_estudiante.html', {'form': form})


@login_required(login_url='/admin/login')
def inasistencias_por_curso(request):
    anio_elegido = 1
    division_elegida = "A"
    lista = []
    f = datetime.strftime(datetime.today(), "%d/%m/%Y")
    fecha = datetime.strptime(f, "%d/%m/%Y")
    form = Cursos(request.POST)
    form2 = FechaInasistencias(request.POST, initial={'fecha': fecha})
    form3 = InasistenciaForm(request.POST)
    creado = True
    estudiantes = ''

    return render(request, 'alcal/blue/inasistencias_por_curso.html',
                  {
                      # 'estudiantes': estudiantes,
                      # 'cursos': cursos,
                      'form': form,
                      'form2': form2,
                      'form3': form3,
                      # 'anio_elegido': int(anio_elegido),
                      # 'division_elegida': division_elegida,
                      'creado': creado,
                      # 'faltas': lista,
                  })


@login_required(login_url='/admin/login')
def inasistencias_por_curso_guardar(request):
    anio_elegido = '1'
    division_elegida = "A"
    lista = []
    f = datetime.strftime(datetime.today(), "%d/%m/%Y")
    fecha = datetime.strptime(f, "%d/%m/%Y")
    form = Cursos(request.POST)
    form2 = FechaInasistencias(request.POST)
    form3 = InasistenciaForm(request.POST)
    creado = True
    estudiantes = ''
    if request.method == 'POST':
        if 'name' in request.POST:
            valor = [0, 0, 0]
            # print(request.POST)
            pk = request.POST['pk']
            pk_list = pk.split(',')
            id_alu = int(pk_list[0])
            f_nueva = pk_list[1]
            fecha = datetime.strptime(f_nueva, "%d-%m-%Y")
            turno = request.POST['name']
            indice_turno = turnos_ina.index(turno)
            valor[indice_turno] = request.POST['value']
            curso = Estudiante.objects.get(legajo=id_alu).curso
            if Inasistencia.objects.filter(estudiante_id=id_alu, fecha=fecha):
                if turno=='maniana':
                    Inasistencia.objects.filter(estudiante_id=id_alu, fecha=fecha).update(maniana=valor[indice_turno])
                if turno == 'tarde':
                    Inasistencia.objects.filter(estudiante_id=id_alu, fecha=fecha).update(tarde=valor[indice_turno])
                if turno == 'ed_fisica':
                    Inasistencia.objects.filter(estudiante_id=id_alu, fecha=fecha).update(ed_fisica=valor[indice_turno])

                maniana = Inasistencia.objects.get(estudiante_id=id_alu, fecha=fecha).maniana
                tarde = Inasistencia.objects.get(estudiante_id=id_alu, fecha=fecha).tarde
                ed_fisica = Inasistencia.objects.get(estudiante_id=id_alu, fecha=fecha).ed_fisica
                actualizar_falta(fecha, id_alu, maniana, tarde, ed_fisica)
            else:
                if not valor[0]:
                    valor[0] = 0
                if not valor[1]:
                    valor[1] = 0
                if not valor[2]:
                    valor[2] = 0
                nueva_ina = Inasistencia(
                    fecha=fecha,
                    estudiante=Estudiante.objects.get(legajo=id_alu),
                    maniana=valor[0],
                    tarde=valor[1],
                    ed_fisica=valor[2],
                    curso=curso
                )
                nueva_ina.save()
                actualizar_falta(fecha, id_alu, valor[0], valor[1], valor[2])
        else:
            if form.is_valid() and form2.is_valid():
                anio_elegido = request.POST['cursonombre'][0]
                division_elegida = request.POST['cursonombre'][1]
                f = request.POST['fecha']
                if not f:
                    f = datetime.strftime(datetime.today(), "%d/%m/%Y")
                fecha = datetime.strptime(f, "%d/%m/%Y")
                form2 = FechaInasistencias(request.POST, initial={'fecha': fecha})
                c = Curso.objects.filter(cursonombre=request.POST['cursonombre'])
                id_curso = c.values('id')[0]['id']
                inasistencias = Inasistencia.objects.filter(curso=id_curso, fecha=fecha)
                estudiantes = Estudiante.objects.filter(curso=id_curso).order_by('orden')
                for e in estudiantes:
                    faltas['legajo'] = e.legajo
                    faltas['fecha'] = fecha.date()
                    faltas['orden'] = e.orden
                    faltas['apellido'] = e.apellido
                    faltas['nombre'] = e.nombre
                    faltas['curso'] = c
                    lista.append(faltas.copy())
                inas = inasistencias.values('maniana', 'tarde', 'ed_fisica', 'estudiante_id', 'curso_id', 'fecha')
                for ina in inas:
                    for li in lista:
                        if ina['fecha'] == li['fecha'] and ina['estudiante_id'] == li['legajo']:
                            li['maniana'] = ina['maniana']
                            li['tarde'] = ina['tarde']
                            li['ed_fisica'] = ina['ed_fisica']
                if fecha > datetime.today() - timedelta(days=2):
                    creado = False
                else:
                    creado = True
            if form3.is_valid():
                maniana = request.POST.getlist('maniana')
                tarde = request.POST.getlist('tarde')
                ed_fisica = request.POST.getlist('ed_fisica')
                for alu, m, t, ed in zip(estudiantes,maniana,tarde,ed_fisica):
                    print('Estudiante: {} - Mañana: {} - Tarde: {} - Ed.Física: {} - Fecha: {} - Curso: {}'.format(alu,m,t,ed,fecha,Curso.objects.get(id=id_curso)))
                    nueva_ina = Inasistencia(
                        fecha=fecha,
                        ed_fisica=ed,
                        estudiante=alu,
                        tarde=t,
                        maniana=m,
                        curso=Curso.objects.get(id=id_curso)
                    )
                    nueva_ina.save()
    return render(request, 'alcal/blue/inasistencias_por_curso.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'form2': form2,
                      'form3': form3,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida,
                      'creado': True,
                      'faltas': lista,
                  })


@login_required(login_url='/admin/login')
def notas_por_estudiante(request):
    if request.method == "POST":
        form = NuevaNota(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect('/notas_por_estudiante')
            except:
                print("Error")
                pass
    else:
        form = NuevaNota()
    return render(request, 'alcal/blue/notas_por_estudiante.html', {'form': form})
    # return render(request, 'alcal/blue/form-editor.html', {'form': form})


@login_required(login_url='/admin/login')
def notas_por_curso(request):
    anio_elegido = 1
    division_elegida = "A"
    form = Cursos(request.POST)
    estudiantes = Estudiante.objects.order_by('apellido')

    if request.method == "POST":
        anio_elegido = request.POST['cursonombre'][0]
        division_elegida = request.POST['cursonombre'][1]

    return render(request, 'alcal/blue/notas_por_curso.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida
                  })


@login_required(login_url='/admin/login')
def comunicaciones_por_curso(request):
    anio_elegido = 1
    division_elegida = "A"
    form = Cursos(request.POST)
    estudiantes = Estudiante.objects.order_by('apellido')

    if request.method == "POST":
        anio_elegido = request.POST['cursonombre'][0]
        division_elegida = request.POST['cursonombre'][1]

    return render(request, 'alcal/blue/notas_por_curso.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida
                  })


@login_required(login_url='/admin/login')
def com_por_estudiante(request):
    valor = None
    print("INICIO")
    lista = ['PT',
             'ST',
             'TT',
             'CF',
             'ND',
             'NF',
             'CD']
    if request.method == "POST":
        print("post")
        form = SelectorDeAlumno(request.POST)
        if form.is_valid():
            boletin = []
            print("is valid")
            valor = form.cleaned_data['estudiante'].id
            valor_curso = form.cleaned_data['curso'].id
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            nota = Nota.objects.filter(estudiante=Estudiante.objects.get(id=valor))
            materias = Materia.objects.filter(curso=valor_curso)
            seg = None
            try:
                id_pers = Persona.objects.get(id=valor).estudiante.legajo
                print(id_pers)
                seg = Seguimiento.objects.order_by('fecha').filter(estudiante__legajo=id_pers)
                print(seg)
            except:
                seg = "???"
                print(seg)
            for i in range(len(materias)):
                id_materia = materias[i].id
                boletin.append([])
                boletin[i].append('{}'.format(materias[i].nombre))
                for j in range(7):
                    try:
                        boletin[i].append(nota.filter(materia=id_materia).filter(instancia=lista[j]).last().numero)
                    except:
                        boletin[i].append("-")
            context = {'var': Estudiante.objects.get(id=valor),
                       'seguimiento': seg,
                       'nota': nota,
                       'form': form,
                       'curso': curso,
                       'materias': materias,
                       'boletin': boletin,
                       }
            print(seg)
            return render(request, 'alcal/blue/com_por_estudiante.html', context)
    else:
        form = SelectorDeAlumno()
        print("else")
    return render(request, 'alcal/blue/com_por_estudiante.html', {'form': form})


@login_required(login_url='/admin/login')
def nuevo_docente(request):
    if request.method == "POST":
        form = NuevoDocente(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('/nuevo_docente')
            except:
                pass
    else:
        form = NuevoDocente()
    return render(request, 'alcal/blue/nuevo_docente.html', {'form': form})


@login_required(login_url='/admin/login')
def nuevo_seguimiento(request):
    if request.method == "POST":
        form = NuevoSeguimiento(request.POST)
        form2 = SelectorDeAlumno(request.POST)
        if form.is_valid() and form2.is_valid():
            try:
                form.save()
                return redirect('/nuevo_seguimiento')
            except:
                pass
            return render(request, 'alcal/blue/nuevo_seguimiento.html.html', {'form': form, 'form2': form2})
    else:
        form = NuevoSeguimiento(request.POST)
        form2 = SelectorDeAlumno(request.POST)

    return render(request, 'alcal/blue/nuevo_seguimiento.html', {'form': form, 'form2':form2})


@login_required(login_url='/admin/login')
def nuevo_estudiante(request):
    if request.method == "POST":
        form = NuevoEstudiante(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('/nuevo_estudiante')
            except:
                pass
    else:
        form = NuevoEstudiante()
    return render(request, 'alcal/blue/nuevo_estudiante.html', {'form': form})


@login_required(login_url='/admin/login')
def nuevo_padre(request):

    if request.method == "POST":
        form = NuevoPadre(request.POST)
        if form.is_valid():
            # print("Guardado")
            try:
                form.save()
                return redirect('/nuevo_padre')
            except:
                pass
    else:
        form = NuevoPadre()

    return render(request, 'alcal/blue/nuevo_padre.html', {'form': form})


@login_required(login_url='/admin/login')
def comunicaciones_por_estudiante(request):
    return render(request, 'alcal/blue/com_por_estudiante.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_curso(request):
    anio_elegido = 1
    division_elegida = "A"
    form = Cursos(request.POST)
    estudiantes = Estudiante.objects.order_by('apellido')

    if request.method == "POST":
        anio_elegido = request.POST['cursonombre'][0]
        division_elegida = request.POST['cursonombre'][1]

    return render(request, 'alcal/blue/comunicaciones_por_curso.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida
                  })


@login_required(login_url='/admin/login')
def reportes_comunicaciones(request):
    return render(request,'alcal/blue/reportes_comunicaciones.html')


@login_required(login_url='/admin/login')
def reportes_notas(request):
    return render(request,'alcal/blue/reportes_notas.html')


@login_required(login_url='/admin/login')
def reportes_inasistencias(request):
    return render(request,'alcal/blue/reportes_inasistencias.html')


@login_required(login_url='/admin/login')
def ficha_estudiante(request):
    valor = None
    lista = ['PT',
             'ST',
             'TT',
             'CF',
             'ND',
             'NF',
             'CD']
    if request.method == "POST":
        form = SelectorDeAlumno(request.POST)
        if form.is_valid():
            boletin = []
            valor = form.cleaned_data['estudiante'].id
            valor_curso = form.cleaned_data['curso'].id
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            nota = Nota.objects.filter(estudiante=Estudiante.objects.get(id=valor))
            materias = Materia.objects.filter(curso=valor_curso)
            seg = None
            try:
                id_pers = Persona.objects.get(id=valor).estudiante.legajo
                print(id_pers)
                seg = Seguimiento.objects.order_by('fecha').filter(estudiante__legajo=id_pers)
                print(seg)
            except:
                seg = "???"
            for i in range(len(materias)):
                id_materia = materias[i].id
                boletin.append([])
                boletin[i].append('{}'.format(materias[i].nombre))
                for j in range(7):
                    try:
                        boletin[i].append(nota.filter(materia=id_materia).filter(instancia=lista[j]).last().numero)
                    except:
                        boletin[i].append("-")
            context = {'var': Estudiante.objects.get(id=valor),
                       'seguimiento': seg,
                       'nota': nota,
                       'form': form,
                       'curso': curso,
                       'materias': materias,
                       'boletin': boletin,
                       }
            print(seg)
            return render(request, 'alcal/blue/ficha_estudiante.html', context)
    else:
        form = SelectorDeAlumno()
    return render(request, 'alcal/blue/ficha_estudiante.html', {'form': form})


@login_required(login_url='/admin/login')
def ficha_docente(request):
    return render(request,'alcal/blue/ficha_docente.html')


@login_required(login_url='/admin/login')
def carreras(request):
    return render(request,'alcal/blue/carreras.html')


@login_required(login_url='/admin/login')
def horarios(request):
    return render(request,'alcal/blue/horarios.html')


def get_name(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = NameForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            # ...
            # redirect to a new URL:
            return HttpResponseRedirect('/thanks/')

    # if a GET (or any other method) we'll create a blank form
    else:
        form = NameForm()

    return render(request, 'name.html', {'form': form})


@login_required(login_url='/admin/login')
def nuevo_pago(request):
    return render(request,'alcal/blue/nuevo_pago.html')


@login_required(login_url='/admin/login')
def ver_pago(request):
    return render(request,'alcal/blue/ver_pago.html')


@login_required(login_url='/admin/login')
def ver_alumno(request):
    return render(request,'alcal/blue/ver_alumno.html')


@login_required(login_url='/admin/login')
def ver_familia(request):
    return render(request,'alcal/blue/ver_familia.html')


@login_required(login_url='/admin/login')
def reportes_seguimientos(request):
    return render(request,'alcal/blue/reportes_seguimiento.html')


@login_required(login_url='/admin/login')
def ver_seguimientos(request):
    return render(request,'alcal/blue/ver_seguimiento.html')




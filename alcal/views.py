from django.views.generic.edit import UpdateView
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404
from django.db.models import Sum, Count
from alcal.models import Carrera, Estudiante, Docente, Curso, Nota, Materia, Seguimiento, Persona, Inasistencia, Faltas
from .forms import NameForm, Cursos, NuevoEstudiante, NuevoPadre, NuevoDocente, NuevaNota, SelectorDeAlumno, \
    NotaParcial, NuevoSeguimiento, FechaInasistencias, InasistenciaForm, NuevaMateria
from alcal.CONSTANTS import *
from datetime import date
from .utils import *
from datetime import datetime, timedelta






@login_required(login_url='/admin/login')
def index(request):
    now = "......."
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)

@login_required(login_url='/admin/login')
def portada(request):
    carreras = Carrera.objects.order_by('anios')
    usuario = request.user
    cant_estudiantes = Estudiante.objects.count()
    cant_femenino = len(Estudiante.objects.filter(genero='F'))
    cant_masculino = len(Estudiante.objects.filter(genero='M'))
    # cant_femenino = femenino
    # cant_masculino = masculino
    # cant_estudiantes = femenino + masculino
    # i_anio = ina_graf(None)
    # m_anio = ina_graf('maniana')
    # t_anio = ina_graf('tarde')
    # ef_anio = ina_graf('ed_fisica')
    # maximo = max([max(i_anio), max(t_anio), max(m_anio), max(ef_anio)])
    # print('Usuario: {}'.format(usuario.groups.all()))
    materias = Materia.objects.filter(docente_titular=Docente.objects.get(usuario=usuario))
    docente = Docente.objects.get(usuario=usuario)
    print(docente)
    return render(request, 'alcal/blue/index.html', {
                    'materias': materias,
                    # 'maximo': maximo,
                    # 'i_anio': i_anio,
                    # 'm_anio': m_anio,
                    # 't_anio': t_anio,
                    # 'ef_anio': ef_anio,
                    'carreras': carreras,
                    'usuario': usuario,
                    'cant_estudiantes': cant_estudiantes,
                    'cant_femenino': cant_femenino,
                    'cant_masculino': cant_masculino,
                    'docente': docente,
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
    print(request.POST)
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
            turno = turnos_ina.index(request.POST['name'])
            tipo = request.POST['value']
            curso = Estudiante.objects.get(legajo=id_alu).curso
            i = Inasistencia()
            i.curso = curso
            i.turno = turno
            i.estudiante = Estudiante.objects.get(legajo=id_alu)
            i.fecha = fecha
            i.tipo = tipo
            i.save()
        else:
            if form.is_valid():
                anio_elegido = request.POST['cursonombre'][0]
                division_elegida = request.POST['cursonombre'][1]
                fecha = datetime.strptime(request.POST['fecha'], "%d/%m/%Y")
    c = Curso.objects.filter(cursonombre='{}{}'.format(anio_elegido, division_elegida))
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
        try:
            faltas['maniana'] = inasistencias.filter(estudiante_id=e.legajo, turno=0).last().tipo
        except:
            faltas['maniana'] = 0
        try:
            faltas['tarde'] = inasistencias.filter(estudiante_id=e.legajo, turno=1).last().tipo
        except:
            faltas['tarde'] = 0
        try:
            faltas['ed_fisica'] = inasistencias.filter(estudiante_id=e.legajo, turno=2).last().tipo
        except:
            faltas['ed_fisica'] = 0
        lista.append(faltas.copy())

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
                seg = Seguimiento.objects.order_by('fecha').filter(estudiante__legajo=id_pers)
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
            return render(request, 'alcal/blue/com_por_estudiante.html', context)
    else:
        form = SelectorDeAlumno()
        print("else")
    return render(request, 'alcal/blue/com_por_estudiante.html', {'form': form})


@login_required(login_url='/admin/login', )
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
    form = NuevoSeguimiento(request.POST)
    form2 = SelectorDeAlumno(request.POST)
    if request.method == "POST":
        if form.is_valid() and form2.is_valid():
            try:
                form.save()
                form = NuevoSeguimiento()
                form2 = SelectorDeAlumno()
            except:
                pass
    return render(request, 'alcal/blue/nuevo_seguimiento.html', {'form': form, 'form2': form2})


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
def nueva_materia(request):
    if request.method == "POST":
        form = NuevaMateria(request.POST, request.FILES)
        if form.is_valid():
            try:
                form.save()
                return redirect('/nueva_materia')
            except:
                pass
    else:
        form = NuevaMateria()
    return render(request, 'alcal/blue/nueva_materia.html', {'form': form})


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
def ficha_estudiante(request, pk):
    if not pk:
        pk = 1
    valor = None
    estu = Estudiante.objects.get(id=1)
    form2 = NuevoEstudiante(request.POST)
    lista = ['PT',
             'ST',
             'TT',
             'CF',
             'ND',
             'NF',
             'CD']
    if request.method == "POST":
        print('post')
        form = SelectorDeAlumno(request.POST)
        if form.is_valid():
            boletin = []
            valor = form.cleaned_data['estudiante'].id
            valor_curso = form.cleaned_data['curso'].id
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            nota = Nota.objects.filter(estudiante=Estudiante.objects.get(id=valor))
            materias = Materia.objects.filter(curso=valor_curso)
            inasistencias = Faltas.objects.filter(estudiante_id=Estudiante.objects.get(id=valor)).aggregate(Sum('cantidad'))
            maniana_tarde = Inasistencia.objects.filter(estudiante_id=Estudiante.objects.get(id=valor), maniana=2).aggregate(Count('maniana'))
            tarde_tarde = Inasistencia.objects.filter(estudiante_id=Estudiante.objects.get(id=valor),
                                                        tarde=2).aggregate(Count('tarde'))
            aus_ed = Inasistencia.objects.filter(estudiante_id=Estudiante.objects.get(id=valor),
                                                      ed_fisica=1).aggregate(Count('ed_fisica'))

            seg = None
            try:
                id_pers = Persona.objects.get(id=valor).estudiante.legajo
                seg = Seguimiento.objects.order_by('-fecha').filter(estudiante__legajo=id_pers)
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
            estu = Estudiante.objects.get(id=valor)
            form2 = NuevoEstudiante(instance=estu)
            context = {'inasistencias': inasistencias['cantidad__sum'],
                       'maniana_tarde': maniana_tarde['maniana__count'],
                       'tarde_tarde': tarde_tarde['tarde__count'],
                       'aus_ed': aus_ed['ed_fisica__count'],
                       'var': estu,
                       'seguimiento': seg,
                       'nota': nota,
                       'form': form,
                       'curso': curso,
                       'materias': materias,
                       'boletin': boletin,
                       'pk': pk,
                       'form2': form2,
                       }

            return render(request, 'alcal/blue/ficha_estudiante.html', context)
        if form2.is_valid():
            print('is_valid')
            e = Estudiante.objects.get(id=estu.legajo)
            curso_id = request.POST['curso']
            e.curso = Curso.objects.get(id=curso_id)
            e.nombre = request.POST['nombre']
            e.apellido = request.POST['apellido']
            e.save()
    else:
        form = SelectorDeAlumno()
    return render(request, 'alcal/blue/ficha_estudiante.html', {'form': form, 'pk': pk, 'form2': form2,})


@login_required(login_url='/admin/login')
def ficha_docente(request):
    return render(request, 'alcal/blue/ficha_docente.html')


@login_required(login_url='/admin/login')
def carreras(request):
    return render(request, 'alcal/blue/carreras.html')


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


@login_required(login_url='/admin/login')
def modificar_materia(request,pk):
    mat = get_object_or_404(Materia, pk=pk)
    if request.method == "POST":
        form = NuevaMateria(request.POST, instance=mat)
        if form.is_valid():
            mat = form.save(commit=False)
            mat.nombre = request.nombre
            mat.save()
            return render(request, 'alcal/blue/modificar_materia.html', pk=mat.pk)
    else:
        form = NuevaMateria(instance=mat)
    return render(request, 'alcal/blue/modificar_materia.html', {'form': form})


@login_required(login_url='/admin/login')
def modificar_estudiante(request, pk):
    est = get_object_or_404(Estudiante, pk=pk)
    print('Request.Post:{}'.format(request.POST))
    if request.method == "POST":
        form = NuevoEstudiante(request.POST, instance=est)
        print('Errores: {}'.format(form.errors))
        if form.is_valid():
            print('is_valid')
            # est = form.save(commit=False)
            # est.curso = request.POST['curso']
            # est.save()
            form.save()
            return redirect('estudiante_detalle', pk=pk)
        else:
            print(form.errors)
    else:
        form = NuevoEstudiante(instance=est)
    return render(request, 'alcal/blue/modificar_estudiante.html', {'form': form})


def estudiante_detalle(request, pk):
    est = get_object_or_404(Estudiante, pk=pk)
    return render(request, 'alcal/blue/estudiante_detalle.html', {'est': est})




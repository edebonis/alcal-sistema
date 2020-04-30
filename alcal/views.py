from django.views.generic.edit import UpdateView
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404
from django.db.models import Sum, Count
from alcal.models import Carrera, Estudiante, Docente, Curso, Nota, Materia, Seguimiento, Persona, Inasistencia, Faltas, Turno
from .forms import NameForm, Cursos, NuevoEstudiante, NuevoPadre, NuevoDocente, NuevaNota, SelectorDeAlumno, \
    NotaParcial, NuevoSeguimiento, FechaInasistencias, InasistenciaForm, NuevaMateria, InaPorCurso
from alcal.utilidades import *
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
    doc_femenino = len(Docente.objects.filter(genero__in=['F', 'Femenino']))
    doc_masculino = len(Docente.objects.filter(genero__in=['M', 'Masculino']))
    cant_doc = doc_femenino + doc_masculino
    curso_eco = Curso.objects.filter(division='A')
    curso_tec = Curso.objects.filter(division='B')
    cant_m_eco = len(Estudiante.objects.filter(genero='M', curso__in=curso_eco))
    cant_f_eco = len(Estudiante.objects.filter(genero='F', curso__in=curso_eco))
    cant_m_tec = len(Estudiante.objects.filter(genero='M', curso__in=curso_tec))
    cant_f_tec = len(Estudiante.objects.filter(genero='F', curso__in=curso_tec))
    cant_eco = cant_f_eco + cant_m_eco
    cant_tec = cant_f_tec + cant_m_tec
    # i_anio = ina_graf(None)
    # m_anio = ina_graf(0)
    # t_anio = ina_graf(1)
    # ef_anio = ina_graf(2)
    maximo = max([max(i_anio), max(t_anio), max(m_anio), max(ef_anio)])
    print(i_anio)

    try:
        materias = Materia.objects.filter(docente_titular=Docente.objects.get(usuario=usuario))
    except request:
        return redirect('/login')
    docente = Docente.objects.get(usuario=usuario)
    print(docente)
    return render(request, 'alcal/blue/index.html', {
        'i_anio': i_anio,
        'm_anio': m_anio,
        't_anio': t_anio,
        'ef_anio': ef_anio,
        'maximo': maximo,
        'materias': materias,
        'carreras': carreras,
        'usuario': usuario,
        'cant_estudiantes': cant_estudiantes,
        'cant_femenino': cant_femenino,
        'cant_masculino': cant_masculino,
        'cant_doc': cant_doc,
        'doc_femenino': doc_femenino,
        'doc_masculino': doc_masculino,
        'cant_m_eco': cant_m_eco,
        'cant_f_eco': cant_f_eco,
        'cant_m_tec': cant_m_tec,
        'cant_f_tec': cant_f_tec,
        'cant_tec': cant_tec,
        'cant_eco': cant_eco,
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
    form = SelectorDeAlumno(request.POST)
    context = {'form': form}
    print(request.POST)
    if request.method == "POST":
        print("Post")
        if form.is_valid():
            valor = form.cleaned_data['estudiante'].id
            valor_curso = form.cleaned_data['curso'].id
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            seg = None
            id_pers = Persona.objects.get(id=valor).estudiante.legajo
            estudiante = Estudiante.objects.get(legajo=id_pers)
            faltas = Faltas.objects.filter(estudiante=estudiante).order_by('fecha')
            inasistencias = Inasistencia.objects.filter(estudiante=estudiante).order_by('turno')
            tipos = []
            for f in faltas:
                maniana = 0
                tarde = 0
                ed = 0
                for i in inasistencias:
                    if f.fecha == i.fecha:
                        if int(i.turno) == 0:
                            maniana = str(i.tipo)
                        if int(i.turno) == 1:
                            tarde = str(i.tipo)
                        if int(i.turno) == 2:
                            ed = str(i.tipo)
                tipos.append([maniana, tarde, ed, datetime.strftime(f.fecha, '%d-%m-%Y'), f.cantidad, f.estudiante.legajo])
            context = {'form': form, 'faltas': faltas,
                       'inasistencias': inasistencias,
                       'tipos': tipos}
            return render(request, 'alcal/blue/inasistencias_por_estudiante.html', context)
        if 'name' in request.POST:
            actualizar_falta(request)
    else:
        print("Else")
        form = SelectorDeAlumno()
    return render(request, 'alcal/blue/inasistencias_por_estudiante.html', {'form': form})


@login_required(login_url='/admin/login')
def inasistencias_por_curso(request):
    print(request.POST)
    anio_elegido = '1'
    division_elegida = "A"
    cur = Curso.objects.get(cursonombre='{}{}'.format(anio_elegido, division_elegida))
    f = datetime.strftime(datetime.today(), "%d/%m/%Y")
    fecha = datetime.strptime(f, "%d/%m/%Y")
    if 'curso' in request.POST:
        cur = Curso.objects.get(pk=int(request.POST['curso']))
    if 'fecha' in request.POST:
        fecha = datetime.strptime(request.POST['fecha'], "%d/%m/%Y")

    lista = []
    form = InaPorCurso(request.POST)
    try:
        ch_maniana = Turno.objects.get(fecha=fecha, curso=cur).maniana
        ch_tarde = Turno.objects.get(fecha=fecha, curso=cur).tarde
        ch_ed = Turno.objects.get(fecha=fecha, curso=cur).ed_fisica

    except:
        ch_maniana = '0'
        ch_tarde = '0'
        ch_ed = 0

    if request.method == 'POST':
        if 'curso' in request.POST and form.is_valid():
            if not Turno.objects.filter(fecha=fecha, curso=cur):
                Turno.objects.create(fecha=fecha, curso=cur)
        if 'name' in request.POST:
            if 'header' not in request.POST['name']:
                actualizar_falta(request)
            else:
                pk = request.POST['pk']
                pk_list = pk.split(',')
                id_cur = pk_list[1]
                fecha = datetime.strptime(pk_list[0], "%d-%m-%Y")
                cur = Curso.objects.get(cursonombre=id_cur)
                id_curso = cur.pk
                anular_turno(request.POST['name'], id_curso, fecha, request.POST['value'])
    inasistencias = Inasistencia.objects.filter(curso=cur, fecha=fecha)
    estudiantes = Estudiante.objects.filter(curso=cur).order_by('orden')
    turnos_header = {'fecha': fecha.date(),
                     'ch_maniana': ch_maniana,
                     'ch_tarde': ch_tarde,
                     'ch_ed': ch_ed,
                     'curso': cur}
    for e in estudiantes:
        faltas['legajo'] = e.legajo
        faltas['fecha'] = fecha.date()
        faltas['orden'] = e.orden
        faltas['apellido'] = e.apellido
        faltas['nombre'] = e.nombre
        faltas['curso'] = cur
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
    # print(lista[0])
    return render(request, 'alcal/blue/inasistencias_por_curso.html',
                  {
                      'turnos': turnos_header,
                      'estudiantes': estudiantes,
                      'form': form,
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

                pass
    else:
        form = NuevaNota()
    return render(request, 'alcal/blue/notas_por_estudiante.html', {'form': form})


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
def ficha_estudiante(request, **pk):
    valor = None
    estu = Estudiante.objects.first()

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
            estudiante = Estudiante.objects.get(id=valor)
            foto = estudiante.url_foto.replace('open','uc')
            curso = NotaParcial.objects.filter(curso=Curso.objects.get(id=valor_curso))
            nota = Nota.objects.filter(estudiante=estudiante)
            materias = Materia.objects.filter(curso=valor_curso)
            inasistencias = Faltas.objects.filter(estudiante_id=estudiante).aggregate(Sum('cantidad'))
            print(inasistencias['cantidad__sum'])
            maniana_tarde = len(Inasistencia.objects.filter(estudiante=estudiante, turno=0, tipo=2))
            tarde_tarde = len(Inasistencia.objects.filter(estudiante=estudiante, turno=1, tipo=2))
            aus_ed = len(Inasistencia.objects.filter(estudiante=estudiante, turno=2, tipo=1))

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
                       'maniana_tarde': maniana_tarde,
                       'tarde_tarde': tarde_tarde,
                       'aus_ed': aus_ed,
                       'var': estu,
                       'seguimiento': seg,
                       'nota': nota,
                       'form': form,
                       'curso': curso,
                       'materias': materias,
                       'boletin': boletin,
                       'pk': pk,
                       'form2': form2,
                       'foto': foto,
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
    return render(request, 'alcal/blue/ficha_estudiante.html', {'form': form, 'pk': pk, 'form2': form2})


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


def actualizar_falta(request):
    pk = request.POST['pk']
    pk_list = pk.split(',')
    id_alu = int(pk_list[0])
    f_nueva = pk_list[1]
    fecha = datetime.strptime(f_nueva, "%d-%m-%Y")
    turno = turnos_ina.index(request.POST['name'])
    tipo = request.POST['value']
    if not tipo:
        tipo = 0
    curso = Estudiante.objects.get(legajo=id_alu).curso
    Inasistencia.objects.update_or_create(curso=curso, turno=turno,
                                          estudiante=Estudiante.objects.get(legajo=id_alu), fecha=fecha,
                                          defaults={'tipo': tipo})


def anular_turno(turno, curso, fecha, tipo):
    if not tipo:
        tipo = 0
    fec = datetime.strftime(fecha, '%Y-%m-%d')
    curso = Curso.objects.get(pk=curso)
    ids_estudiantes = Estudiante.objects.filter(curso=curso)
    t = turno.replace('_header', '')
    if 'maniana' in turno:
        Turno.objects.update_or_create(curso=curso, fecha=fec, defaults={'maniana': tipo})
    if 'tarde' in turno:
        Turno.objects.update_or_create(curso=curso, fecha=fec, defaults={'tarde': tipo})
    if 'ed' in turno:
        Turno.objects.update_or_create(curso=curso, fecha=fec, defaults={'ed_fisica': tipo})
    for i in ids_estudiantes:
        Inasistencia.objects.update_or_create(curso=curso, turno=turnos_ina.index(t),
                                              estudiante=i, fecha=fec,
                                              defaults={'tipo': int(tipo)})

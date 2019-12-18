import datetime
from django.template.context_processors import request
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect, HttpResponseRedirect, get_object_or_404
from django.contrib.auth.models import User
from alcal.models import Carrera, Estudiante, Docente, Curso, Nota, Materia, Seguimiento, Persona
from .forms import NameForm, CursoForm, NuevoEstudiante, NuevoPadre, NuevoDocente, NuevaNota, SelectorDeAlumno,\
    NotaParcial, NuevoSeguimiento
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView, DeleteView


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
def editable_list(request):
    anio_elegido = 1
    division_elegida = "A"
    form = CursoForm(request.POST)
    estudiantes = Estudiante.objects.order_by('apellido')

    if request.method == "POST":
        anio_elegido = request.POST['cursonombre'][0]
        division_elegida = request.POST['cursonombre'][1]


    return render(request, 'alcal/blue/tables-editable.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'anio_elegido': int(anio_elegido),
                      'division_elegida': division_elegida
                  })


@login_required(login_url='/admin/login')
def inasistencias_por_estudiante(request):
    return render(request, 'alcal/blue/inasistencias_por_estudiante.html')


@login_required(login_url='/admin/login')
def inasistencias_por_curso(request):
    return render(request,'alcal/blue/inasistencias_por_curso.html')


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
    return render(request,'alcal/blue/notas_por_curso.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_curso(request):
    return render(request,'alcal/blue/comunicaciones_por_curso.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_estudiante(request):
    return render(request,'alcal/blue/comunicaciones_por_estudiante.html')


@login_required(login_url='/admin/login')
def nuevo_docente(request):
    form = NuevoDocente(request.POST)
    return render(request, 'alcal/blue/nuevo_docente.html', {'form': form})


@login_required(login_url='/admin/login')
def nuevo_seguimiento(request):
    if request.method == "POST":
        form = NuevoSeguimiento(request.POST)
        form2 = SelectorDeAlumno(request.POST)
        if form.is_valid() and form2.is_valid():
            form2.estudiante = form.estudiante
            print("Es válido")
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
    return render(request,'alcal/blue/comunicaciones_por_estudiante.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_curso(request):
    return render(request,'alcal/blue/comunicaciones_por_curso.html')



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
                id_pers = Persona.objects.get(id=valor).estudiante.id
                seg = Seguimiento.objects.filter(id=1234)
                print(valor)
            except:
                seg = ""
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
                       'boletin': boletin}
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
def cursos(request):
    return render(request,'alcal/blue/cursos.html')


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
def nuevo_seguimientos(request):
    return render(request,'alcal/blue/nuevo_seguimiento.html')
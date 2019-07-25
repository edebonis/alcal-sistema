import datetime
from django.template.context_processors import request
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.models import User
from alcal.models import Carrera, Estudiante, Docente, Curso
from .forms import PostForm, NameForm


@login_required(login_url='/admin/login')
def index(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)


@login_required(login_url='/admin/login')
def portada(request):
    carreras = Carrera.objects.order_by('anios')
    print(carreras[0],carreras[1])
    usuario = str(request.user)
    cant_estudiantes = Estudiante.objects.count()
    cant_femenino = len(Estudiante.objects.filter(genero=2))
    cant_masculino = len(Estudiante.objects.filter(genero=1))

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
        form = PostForm(request.POST)

    print("*******")
    return render(request, 'alcal/blue/buscar_curso.html',
                  {
                      'form': form,
                      'curso_elegido': curso_elegido
                  }
                  )


@login_required(login_url='/admin/login')
def editable_list(request):
    estudiantes = Estudiante.objects.order_by('legajo')
    cursos = Curso.objects.order_by('id')
    curso_elegido = request.content_params
    if request.method == "POST":
        form = ""
    else:
        form = PostForm(request.POST)

    print(curso_elegido)
    return render(request, 'alcal/blue/tables-editable.html',
                  {
                      'estudiantes': estudiantes,
                      'cursos': cursos,
                      'form': form,
                      'curso_elegido': curso_elegido
                  })


@login_required(login_url='/admin/login')
def inasistencias_por_estudiante(request):
    return render(request,'alcal/blue/inasistencias_por_estudiante.html')


@login_required(login_url='/admin/login')
def inasistencias_por_curso(request):
    return render(request,'alcal/blue/inasistencias_por_curso.html')


@login_required(login_url='/admin/login')
def notas_por_estudiante(request):
    return render(request,'alcal/blue/notas_por_estudiante.html')


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
    return render(request,'alcal/blue/nuevo_docente.html')


@login_required(login_url='/admin/login')
def nuevo_estudiante(request):
    return render(request,'alcal/blue/nuevo_estudiante.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_estudiante(request):
    return render(request,'alcal/blue/comunicaciones_por_estudiante.html')


@login_required(login_url='/admin/login')
def comunicaciones_por_curso(request):
    return render(request,'alcal/blue/comunicaciones_por_curso.html')
    return render(request,'alcal/blue/horarios.html')



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
    return render(request,'alcal/blue/ficha_estudiante.html')


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
    pass



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
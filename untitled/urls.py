"""untitled URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url
from alcal import views


app_name = 'alcal'

urlpatterns = [

    path('admin/', admin.site.urls),
    path('index/', views.index, name='index'),
    path('portada', views.portada, name='portada'),
    path('perfil', views.perfil, name='perfil'),
    # path('editable_list', views.editable_list, name='editable_list'),
    path('', views.portada, name='portada'),
    path('inasistencias_por_estudiante', views.inasistencias_por_estudiante, name='inaxest'),
    path('inasistencias_por_curso', views.inasistencias_por_curso, name='inaxcur'),
    path('nuevo_estudiante', views.nuevo_estudiante, name='nuevoest'),
    path('nuevo_padre', views.nuevo_padre, name='nuevopad'),
    path('nuevo_docente', views.nuevo_docente, name='nuevodoc'),
    path('nuevo_seguimiento', views.nuevo_seguimiento, name='nuevoseg'),
    path('nueva_materia', views.nueva_materia, name='nuevamat'),
    path('reportes_comunicaciones', views.reportes_comunicaciones, name='repcomu'),
    path('reportes_notas', views.reportes_notas, name='repnotas'),
    path('reportes_inasistencias', views.reportes_inasistencias, name='repina'),
    path('ficha_estudiante/<int:pk>', views.ficha_estudiante, name='fichaest'),
    path('ficha_estudiante/', views.ficha_estudiante, name='fichaestu'),
    path('ficha_docente', views.ficha_docente, name='fichadoc'),
    path('carreras', views.carreras, name='carreras'),
    path('cursos', views.cursos, name='cursos'),
    path('horarios', views.horarios, name='horarios'),
    path('com_por_estudiante', views.com_por_estudiante, name='comuest'),
    path('comunicaciones_por_curso', views.comunicaciones_por_curso, name='comucur'),
    path('notas_por_estudiante', views.notas_por_estudiante, name='notest'),
    path('notas_por_curso', views.notas_por_curso, name='notcur'),
    path('chaining/', include('smart_selects.urls')),
    path('nuevo_pago', views.nuevo_pago, name='nuevopago'),
    path('ver_pago', views.ver_pago, name='verpago'),
    path('ver_alumno', views.ver_alumno, name='veralumno'),
    path('ver_familia', views.ver_familia, name='verfamilia'),
    path('reportes_seguimientos', views.reportes_seguimientos, name='reporsegui'),
    path('nuevo_seguimiento', views.nuevo_seguimiento, name='nuevosegui'),
    path('ver_seguimientos', views.ver_seguimientos, name='versegui'),
    path('modificar_materia/<int:pk>', views.modificar_materia, name='mod_mat'),
    path('modificar_estudiante/<int:pk>', views.modificar_estudiante, name='modificar_estudiante'),
    path('estudiante_detalle/<int:pk>/', views.estudiante_detalle, name='estudiante_detalle'),
    url(r'^chaining/', include('smart_selects.urls')),
    ]


admin.site.site_header = 'Alcal'
admin.site.site_title = 'Alcal'


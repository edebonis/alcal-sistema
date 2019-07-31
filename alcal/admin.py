from django.contrib import admin

from .models import Estudiante, Docente, Carrera, Nota, NotaParcial, FechaAltaBaja, Materia, Curso, Genero, \
    Inasistencia, Notificacion, Documentacion, Padre, Vinculo, Parentezco, TipoDni

admin.site.register(Estudiante)
admin.site.register(Docente)
admin.site.register(Carrera)
admin.site.register(Nota)
admin.site.register(NotaParcial)
admin.site.register(Materia)
admin.site.register(Curso)
admin.site.register(Genero)
admin.site.register(Inasistencia)
admin.site.register(Notificacion)
admin.site.register(Documentacion)
admin.site.register(FechaAltaBaja)
admin.site.register(Padre)
admin.site.register(Parentezco)
admin.site.register(Vinculo)
admin.site.register(TipoDni)

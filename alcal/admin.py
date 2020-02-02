from django.contrib import admin
from django import forms
from .models import Estudiante, Docente, Carrera, Nota, NotaParcial, FechaAltaBaja, Materia, Curso, \
    Inasistencia, Notificacion, Documentacion, Padre, Cuota, NombreCuota, Seguimiento, Pendiente, \
    MesaPendiente, Periodo, InscripcionPendiente, NotaPendiente, User


# admin.site.register(Estudiante)
admin.site.register(Docente)
admin.site.register(Carrera)
admin.site.register(Nota)
# admin.site.register(NotaParcial)
admin.site.register(Materia)
# admin.site.register(Curso)
admin.site.register(Inasistencia)
admin.site.register(Notificacion)
admin.site.register(Documentacion)
admin.site.register(FechaAltaBaja)
admin.site.register(Padre)
admin.site.register(Cuota)
admin.site.register(NombreCuota)
admin.site.register(Seguimiento)
admin.site.register(Pendiente)
# admin.site.register(MesaPendiente)
admin.site.register(Periodo)
admin.site.register(InscripcionPendiente)
admin.site.register(NotaPendiente)
# admin.site.register(User)

@admin.register(Estudiante)
class EstudianteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'responsable', 'num_dni', 'curso', 'genero')
    list_display_links = ('nombre', 'apellido', 'responsable')
    search_fields = ('nombre', '=num_dni',)

    def get_search_results(self, request, queryset, search_term):
        queryset, use_distinct = super().get_search_results(request, queryset, search_term)
        try:
            search_term_as_int = int(search_term)
        except ValueError:
            pass
        else:
            queryset |= self.model.objects.filter(num_dni=search_term_as_int)
        return queryset, use_distinct


@admin.register(Curso)
class Curso(admin.ModelAdmin):
    ordering = ['cursonombre']
    search_fields = ['anio']


@admin.register(NotaParcial)
class NotaParcial(admin.ModelAdmin):
    list_display = ('estudiante', 'materia', 'nota')
    list_editable = ('nota',)
    ordering = ['curso']
    list_filter = ['curso', 'estudiante']


@admin.register(MesaPendiente)
class MesaPendiente(admin.ModelAdmin):
    list_display = ('materia', 'fecha')
    ordering = ['fecha']
    list_filter = ['materia']


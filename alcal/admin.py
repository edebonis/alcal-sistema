from django.contrib import admin
from .models import Estudiante, Docente, Carrera, Nota, NotaParcial, FechaAltaBaja, Materia, Curso, Genero, \
    Inasistencia, Notificacion, Documentacion, Padre, Vinculo, TipoDni, Cuota, NombreCuota, Seguimiento



#admin.site.register(Estudiante)
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
#admin.site.register(Padre)
admin.site.register(Vinculo)
admin.site.register(TipoDni)
admin.site.register(Cuota)
admin.site.register(NombreCuota)
admin.site.register(Seguimiento)


@admin.register(Estudiante)
class EstudianteAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido', 'responsable', 'colored_name', 'num_dni', 'curso')
    list_display_links = ('nombre', 'apellido', 'responsable')
    search_fields = ('nombre','=num_dni',)

    def get_search_results(self, request, queryset, search_term):
        queryset, use_distinct = super().get_search_results(request, queryset, search_term)
        try:
            search_term_as_int = int(search_term)
        except ValueError:
            pass
        else:
            queryset |= self.model.objects.filter(num_dni=search_term_as_int)
        return queryset, use_distinct


@admin.register(Padre)
class PadreAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            'fields': ('nombre', 'domicilio', 'apellido', 'telefono_1')
        }),
        ('Advanced options', {
            'classes': ('collapse',),
            'fields': ('registration_required', 'template_name'),
        }),
    )



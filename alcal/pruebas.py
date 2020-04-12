from alcal.models import Inasistencia, Faltas, faltas
from alcal.models import Curso, Estudiante

def crear_ina():
    i = Inasistencia()
    e = Estudiante.objects.get(legajo='110')
    i.turno = 0
    i.curso = e.curso
    i.estudiante = e
    i.tipo = '1'
    i.fecha = '2020-4-8'
    i.save()
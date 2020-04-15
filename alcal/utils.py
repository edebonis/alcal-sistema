from alcal.models import Faltas, Inasistencia
from django.db.models import Sum, Count


def ina_graf(tipo):
    lista = ['1', '2', '3', '4', '5']
    if tipo:
        i_enero = Inasistencia.objects.filter(fecha__range=["2020-01-01", "2020-01-31"], turno=tipo).count()
        i_febrero = Inasistencia.objects.filter(fecha__range=["2020-02-01", "2020-02-29"], turno=tipo).count()
        i_marzo = Inasistencia.objects.filter(fecha__range=["2020-03-01", "2020-03-31"],  turno=tipo).count()
        i_abril = Inasistencia.objects.filter(fecha__range=["2020-04-01", "2020-04-30"],  turno=tipo).count()
        i_mayo = Inasistencia.objects.filter(fecha__range=["2020-05-01", "2020-05-31"],  turno=tipo).count()
        i_junio = Inasistencia.objects.filter(fecha__range=["2020-06-01", "2020-06-30"],  turno=tipo).count()
        i_julio = Inasistencia.objects.filter(fecha__range=["2020-07-01", "2020-07-31"],  turno=tipo).count()
        i_agosto = Inasistencia.objects.filter(fecha__range=["2020-08-01", "2020-08-31"],  turno=tipo).count()
        i_septiembre = Inasistencia.objects.filter(fecha__range=["2020-09-01", "2020-09-30"],  turno=tipo).count()
        i_octubre = Inasistencia.objects.filter(fecha__range=["2020-10-01", "2020-10-31"],  turno=tipo).count()
        i_noviembre = Inasistencia.objects.filter(fecha__range=["2020-11-01", "2020-11-30"],  turno=tipo).count()
        i_diciembre = Inasistencia.objects.filter(fecha__range=["2020-12-01", "2020-12-31"],  turno=tipo).count()
        i_anio = [i_enero, i_febrero, i_marzo, i_abril, i_mayo, i_junio, i_julio, i_agosto, i_septiembre, i_octubre,
                  i_noviembre, i_diciembre]
        print(i_anio)
        return i_anio
    else:
        f_enero = Faltas.objects.filter(fecha__range=["2020-01-01", "2020-01-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_febrero = Faltas.objects.filter(fecha__range=["2020-02-01", "2020-02-29"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_marzo = Faltas.objects.filter(fecha__range=["2020-03-01", "2020-03-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_abril = Faltas.objects.filter(fecha__range=["2020-04-01", "2020-04-30"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_mayo = Faltas.objects.filter(fecha__range=["2020-05-01", "2020-05-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_junio = Faltas.objects.filter(fecha__range=["2020-06-01", "2020-06-30"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_julio = Faltas.objects.filter(fecha__range=["2020-07-01", "2020-07-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_agosto = Faltas.objects.filter(fecha__range=["2020-08-01", "2020-08-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_septiembre = Faltas.objects.filter(fecha__range=["2020-09-01", "2020-09-30"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_octubre = Faltas.objects.filter(fecha__range=["2020-10-01", "2020-10-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_noviembre = Faltas.objects.filter(fecha__range=["2020-11-01", "2020-11-30"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_diciembre = Faltas.objects.filter(fecha__range=["2020-12-01", "2020-12-31"]).aggregate(Sum('cantidad'))['cantidad__sum']
        f_anio = [f_enero, f_febrero, f_marzo, f_abril, f_mayo, f_junio, f_julio, f_agosto, f_septiembre, f_octubre,
                      f_noviembre, f_diciembre]

        for i in range(0, len(f_anio)):
            if not f_anio[i]:
                f_anio[i] = 0
        return f_anio

import gspread
from oauth2client.service_account import ServiceAccountCredentials
from alcal.utilidades import *
from alcal.models import Docente, Curso, Materia, Carrera
import time

class LegajoDocentes:
    '''herramientas para trabajar con el legajo docente hecho en spreadsheets de google'''
    scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
    creds = ServiceAccountCredentials.from_json_keyfile_name('alcal/alcal-f5d427704a2d.json', scope)
    client = gspread.authorize(creds)
    archivo = client.open_by_url(
            'https://docs.google.com/spreadsheets/d/1JqUj0KfmXHvI9Iht9MaWebCqUbi7JAAu42PEwYg0qrw/edit')
    sheet_legajo = archivo.worksheet('Legajo')
    sheet_docente_materia = archivo.worksheet('DocenteMateria')

    def ids_activos(self):
        datos = []
        leg = self.sheet_legajo.col_values(ColDoc.NReg)
        activos = self.sheet_legajo.col_values(ColDoc.ACTIVX)
        for j in range(0, len(leg)):
            if activos[j].upper() == 'SI':
                datos.append(leg[j])
        return datos

    def docente_por_id(self, legajo):
        indice = self.sheet_legajo.col_values(ColDoc.NReg).index(str(legajo))
        alumno = self.sheet_legajo.row_values(indice+1)
        return alumno

    def foto_estudiante(self, url):
        print(url)
        url_pub = url.replace('open', 'uc')
        return url_pub

    def foto_por_id(self, legajo):
        estudiante = self.docente_por_id(legajo)
        url_foto = self.foto_estudiante(estudiante[FOTO-1])
        return url_foto

    def migrar_docentes(self):
        leg = self.ids_activos()
        for legajo in leg:
            time.sleep(1)
            datos = self.docente_por_id(legajo)
            i = Docente()
            i.legajo = datos[ColDoc.NReg-1]
            i.nombre = datos[ColDoc.NOMBRES-1]
            i.apellido = datos[ColDoc.APELLIDOS-1]
            i.telefono_1 = datos[ColDoc.TELEFONOS-1]
            i.orden = datos[ColDoc.NORD-1]
            i.genero = datos[ColDoc.MF-1]
            i.email = datos[ColDoc.EMAIL-1]
            if datos[ColDoc.ACTIVX-1] == 'SI':
                i.activx = True
            i.save()
            print(i)
        return True

    def migrar_materias(self):
        for materia in range(1,161):
            time.sleep(1)
            datos = self.sheet_docente_materia.row_values(materia)
            i = Materia()
            i.nombre = datos[ColMat.NOMBRE-1]
            i.taller = datos[ColMat.TEC-1]=='VERDADERO'
            i.carga_horaria = datos[ColMat.CARGA-1]
            if datos[ColMat.DIV-1].upper() == "A":
                i.carrera = Carrera.objects.get(id=2)
            else:
                i.carrera = Carrera.objects.get(id=1)
            cur = Curso.objects.get(anio=datos[ColMat.ANO-1], division=datos[ColMat.DIV-1])
            i.curso = cur
            print(datos[ColMat.MAILDOC-1])
            prof = Docente.objects.get(email=datos[ColMat.MAILDOC-1].split(',')[0])
            i.docente_titular = prof
            i.save()
            print(i)
        return True
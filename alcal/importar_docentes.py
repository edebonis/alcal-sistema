import gspread
from oauth2client.service_account import ServiceAccountCredentials
from alcal.CONSTANTS import *
from alcal.models import Docente, Curso
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

    print(sheet_docente_materia.col_values(4))
    print(sheet_legajo.col_values(5))


    def estudiantes_por_curso(self, curso, *largs):
        datos = []
        t_datos = []
        for i in largs:
            t_datos.append(self.sheet.col_values(i))
            datos.append([])
        activos = self.sheet.col_values(ACTIVX)
        cursos = self.sheet.col_values(CURSO)
        for j in range(0, len(activos)):
            if activos[j].upper() == 'SI' and curso == cursos[j]:
                for k in range(0, len(largs)):
                    datos[k].append(t_datos[k][j])
        return datos

    def ids_activos(self):
        datos = []
        leg = self.sheet.col_values(LEG)
        activos = self.sheet.col_values(ACTIVX)
        for j in range(0,len(leg)):
            if activos[j].upper() == 'SI':
                datos.append(leg[j])
        return datos

    def estudiante_por_id(self, legajo):
        indice = self.sheet.col_values(LEG).index(str(legajo))
        alumno = self.sheet.row_values(indice+1)
        return alumno

    def foto_estudiante(self, url):
        print(url)
        url_pub = url.replace('open', 'uc')
        return url_pub

    def foto_por_id(self, legajo):
        estudiante = self.estudiante_por_id(legajo)
        url_foto = self.foto_estudiante(estudiante[FOTO-1])
        return url_foto

    def migrar_spreadshet(self):
        leg = self.ids_activos()
        for l in leg:
            time.sleep(2)
            datos = self.estudiante_por_id(l)
            i = Estudiante()
            i.legajo = datos[LEG-1]
            i.tipo = datos[TIPO-1]
            cur = Curso.objects.get(cursonombre=datos[CURSO-1])
            i.curso = cur
            i.nombre = datos[NOMBRES-1]
            i.apellido = datos[APELLIDOS-1]
            i.archivo_de_seguimiento = datos[ARCHIVODESEGUIMIENTO-1]
            i.url_foto = datos[FOTO-1]
            i.telefono_1 = datos[TELEFONOS-1]
            i.orden = datos[ORDEN-1]
            i.genero = datos[MF-1]
            i.email = datos[EMAIL-1]
            if datos[DOMICILIO-1] != "":
                print(datos[DOMICILIO-1])
                i.domicilio_calle = " ".join(datos[DOMICILIO-1].split()[:-1])
                if type(datos[DOMICILIO-1].split()[-1] ) == type(1):
                    i.domicilio_numero = datos[DOMICILIO-1].split()[-1]
                else:
                    i.domicilio_calle = datos[DOMICILIO-1]
            if datos[ACTIVX-1] == 'SI':
                i.activx = True
            i.save()
            print(i)
        return True
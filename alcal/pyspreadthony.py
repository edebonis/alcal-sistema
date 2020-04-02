import gspread
from oauth2client.service_account import ServiceAccountCredentials
from CONSTANTS import *

# print(Activos)
# mf = []
# act = []
# for i in range(0, len(Sexos)):
#     if Activos[i].value == "SI":
#         mf.append(Sexos[i].value)
# masculino = mf.count("M")
# femenino = mf.count("F")

class LegajoEstudiantes:
    scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
    creds = ServiceAccountCredentials.from_json_keyfile_name('alcal-f5d427704a2d.json', scope)
    client = gspread.authorize(creds)
    sheet = client.open_by_url(
            'https://docs.google.com/spreadsheets/d/1qmgWI_tww0qtllUeQwRBbXAued_86rf3V25ePq_bQmY/edit').sheet1
    datos = []
    t_datos = []
    def estudiantes_por_curso(self, curso, *largs):
        for i in largs:
            self.t_datos.append(self.sheet.col_values(i))
            self.datos.append([])
        activos = self.sheet.col_values(ACTIVX)
        cursos = self.sheet.col_values(CURSO)
        for j in range(0, len(activos)):
            if activos[j].upper() == 'SI' and curso == cursos[j]:
                for k in range(0, len(largs)):
                    self.datos[k].append(self.t_datos[k][j])               

        print(self.datos)
    
    def estudiante_por_id(self,legajo):
        indice = self.sheet.col_values(LEG).index(str(legajo))
        alumno = self.sheet.row_values(indice+1)
        return alumno
    
    def foto_estudiante(self, url):
        "https://drive.google.com/open?id=1FBcA8ef963JTi1fYunMRl6fohhcTkC21"
        url_pub = "https://drive.google.com/uc{}".format(url[29:])
        return url_pub

l = LegajoEstudiantes()
#alu = l.estudiante_por_id(101)
#print(alu[FOTO-1])
url = "https://drive.google.com/open?id=1FBcA8ef963JTi1fYunMRl6fohhcTkC21"
print(l.foto_estudiante(url))

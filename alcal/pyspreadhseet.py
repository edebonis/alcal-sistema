import gspread
from oauth2client.service_account import ServiceAccountCredentials
from alcal.CONSTANTS import *




scope = ['https://spreadsheets.google.com/feeds','https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('alcal/alcal-f5d427704a2d.json', scope)
client = gspread.authorize(creds)
sheet = client.open_by_url('https://docs.google.com/spreadsheets/d/1qmgWI_tww0qtllUeQwRBbXAued_86rf3V25ePq_bQmY/edit').sheet1
Sexos = sheet.range(2, MF, 600, MF)
Activos = sheet.range(2, ACTIVX, 600, ACTIVX)
print(Activos)
mf = []
act = []
for i in range(0, len(Sexos)):
    if Activos[i].value == "SI":
        mf.append(Sexos[i].value)
masculino = mf.count("M")
femenino = mf.count("F")

# genero = ''
# for i in datos:
#     if i[ACTIVX]=='SI' and i[APELLIDOS] == 'SUAREZ':
#         print('{} {} {}'.format(i[NOMBRES], i[APELLIDOS], i[EMAIL]))

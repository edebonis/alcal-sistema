"""mañana tarde educación física"""

codigos = {
    'PAT': 0.75,
    'PPA': 0.5,
    'PPP': 0,
    'PPR': 0.25,
    'PTA': 0.75,
    'PTP': 0.25,
    'PAA': 1,
    'PAP': 0.5,
    'PRA': 1,
    'PRP': 0.5,
    'TPA': 0.75,
    'TPP': 0.25,
    'TTA': 1,
    'TTP': 0.5,
    'TAA': 1,
    'TAP': 0.75,
    'TRA': 1,
    'TRP': 0.75,
    'APA': 1,
    'APP': 0.5,
    'ATA': 1,
    'ATP': 0.75,
    'AAA': 1,
    'AAP': 1,
    'ARA': 1,
    'ARP': 1,
    'RPA': 1,
    'RPP': 0.5,
    'RTA': 1,
    'RTP': 0.75,
    'RAA': 1,
    'RAP': 1,
    'RRA': 1,
    'RRP': 1,
    'PP-': 0,
    'PT-': 0.25,
    'PA-': 0.5,
    'PR-': 0.5,
    'TP-': 0.25,
    'TT-': 0.5,
    'TA-': 0.75,
    'TR-': 0.75,
    'AP-': 0.5,
    'AT-': 0.75,
    'AA-': 1,
    'AR-': 1,
    'RP-': 0.5,
    'RT-': 0.75,
    'RA-': 1,
    'RR-': 1,
    'P--': 0,
    'T--': 0.25,
    'A--': 1,
    'R--': 0.5,
    'P-A': 0.5,
    'P-P': 0,
    'T-A': 0.75,
    'T-P': 0.25,
    'A-A': 1,
    'A-P': 1,
    'R-A': 1,
    'R-P': 0.5,
    '---': 0,
    '--A': 0.5,
    '-AP': 0.5,
    '-PP': 0,
    '--P': 0,
    '-P-': 0,
    'RRR': 1,
    'PPT': 0.25,
}

cod_letra = ['P', 'A', 'T', 'R', '-']

faltas = {'fecha': None,
          'legajo': None,
          'orden': None,
          'apellido': None,
          'nombre': None,
          'maniana': None,
          'tarde': None,
          'ed_fisica': None,
          'curso': None,
          }

turnos_ina = ['maniana', 'tarde', 'ed_fisica']
turnos_nombres = ['Mañana', 'Tarde', 'Educación Física']


class ColEst:
    columnas = ["LEG", "ACTIVX", "CURSO", "ORDEN", "APELLIDOS", "NOMBRES", "EDAD", "FNAC", "NACIONALIDAD", "LIBROFOLIO",
                "NACIONALIDAD", "TIPO", "NUMERO", "DOMICILIO", "TELEFONOS", "ANODEINGRESO","MF", "GRUPOTECNICA", "OBSADM",
                "EMAIL", "NOMBREDEADULTORESPONSABLE", "NACIONALIDADA", "PROFESION", "VINCULOCONELLAESTUDIANTE",
                "FICHADEINSCRIPCCION", "FOTDNIESTUDIANTE", "FOTDNIRESPONSABLE", "PARTIDADENACIMIENTO", "VACUNAS",
                "CERT6CERT7APARCIAL", "NN", "FOTO", "ADEUDA", "ARCHIVODESEGUIMIENTO" ]

    LEG = 1
    ACTIVX = LEG + 1
    CURSO = ACTIVX + 1
    ORDEN = CURSO + 1
    APELLIDOS = ORDEN + 1
    NOMBRES = APELLIDOS + 1
    EDAD = NOMBRES + 1
    FNAC = EDAD + 1
    NACIONALIDAD = FNAC + 1
    LIBROFOLIO = NACIONALIDAD + 1
    TIPO = LIBROFOLIO + 1
    NUMERO = TIPO + 1
    DOMICILIO = NUMERO + 1
    TELEFONOS = DOMICILIO + 1
    ANODEINGRESO = TELEFONOS + 1
    MF = ANODEINGRESO + 1
    GRUPOTECNICA = MF + 1
    OBSADM = GRUPOTECNICA + 1
    EMAIL = OBSADM + 1
    NOMBREDEADULTORESPONSABLE = EMAIL + 1
    NACIONALIDADA = NOMBREDEADULTORESPONSABLE + 1
    PROFESION = NACIONALIDADA + 1
    VINCULOCONELLAESTUDIANTE = PROFESION + 1
    FICHADEINSCRIPCCION = VINCULOCONELLAESTUDIANTE + 1
    FOTDNIESTUDIANTE = FICHADEINSCRIPCCION + 1
    FOTDNIRESPONSABLE = FOTDNIESTUDIANTE + 1
    PARTIDADENACIMIENTO = FOTDNIRESPONSABLE + 1
    VACUNAS = PARTIDADENACIMIENTO + 1
    CERT6CERT7APARCIAL = VACUNAS + 1
    NN = CERT6CERT7APARCIAL + 1
    FOTO = NN + 1
    ADEUDA = FOTO + 1
    ARCHIVODESEGUIMIENTO = ADEUDA + 1


class ColDoc:
    NReg = 1
    ACTIVX = 2
    Anos = 3
    MESES = 4
    APELLIDOS = 5
    NOMBRES = 6
    DOCUMENTO = 7
    FNAC = 8
    NACIONALIDAD = 9
    TELEFONOS = 10
    DOMICILIO = 11
    CELULAR = 12
    MF = 13
    TECECO = 14
    NORD = 15
    EMAIL = 16
    FALTA = 17
    NMOSTRAR = 18


class ColMat:
    ID = 1
    ANO = 2
    DIV = 3
    NOMBRE = 4
    DOCENTE = 5
    MAILDOC = 6
    TEC = 7
    IDPLAN = 8
    CARGA = 9
    IDCARPETA = 10
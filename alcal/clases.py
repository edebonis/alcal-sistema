class Persona:
    nombre = ''
    colegio = ''
    def __init__(self, n, c): # CONSTRUCTOR
        self.nombre = n
        self.colegio = c
        print("objeto de la clase Persona CREADO")
    def mostrar_nombre(self):
        print(self.nombre)
    def mostrar_colegio(self):
        print(self.colegio)
    def mostrar_informacion(self):
        print(self.nombre)
        print(self.colegio)
    def __str__(self):
        return "El nombre del objeto de la clase persona es: " + self.nombre

class Alumno(Persona):
    curso = ''
    def __init__(self):
        print("Alumno creado")
    def dar_presente(self):
        print(self.nombre +  " Presente")

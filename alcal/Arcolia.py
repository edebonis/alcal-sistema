class Hogwartense:
    def __init__(self, nombre, apellido, personalidad, poderes):
        self.nombre = nombre
        self.apellido = apellido
        self.personalidad = personalidad
        self.poderes = poderes
    
    def Imprimir(self):
        print(self.nombre, self.apellido,"Es integrante de Hogwarts")

class Profesor(Hogwartense):
        def __init__(self, nombre, apellido, personalidad, poderes, materia, calificar):
            Hogwartense.__init__(self, nombre, apellido, personalidad, poderes)
            self.materia = materia
        def ser_profesor(self):
            print(self.nombre, self.apellido, "Es profesor de", self.materia)

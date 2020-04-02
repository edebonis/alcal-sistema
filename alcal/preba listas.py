lista = [[],[],[]]
a = ["A","B","C","D","E"]

for j in range(0,len(a)):
    for i in range(0,3):
        lista[i].append("{} - {} .. {}".format(a[j],i,j))
print(lista)

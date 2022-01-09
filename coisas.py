import random;

def default():

    carol = [13, 2, 3]
    fabio = [11, 12]
    gabi = [7]
    all = [carol, fabio, gabi]

    return all

def do():

    lista = default()
    carol = lista[0]
    fabio = lista[1]
    gabi = lista[2]

    while (len(carol) != 4 or len(fabio) != 5 or len(gabi) != 5):

        lista = default()
        carol = lista[0]
        fabio = lista[1]
        gabi = lista[2]

        for i in range (1, 15):
            if (i not in carol+fabio+gabi):
                index = random.randint(0, 2)
                lista[index].append(i)

    names = ["carol", "fabio", "gabi"]
    for name, student in zip(names,lista): print(name, " ", student)

if __name__ == "__main__":
    do()
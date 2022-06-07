import glob
# sprawdza czy nie ma juz zadnych kamieni
def koniec(a):
    i = 0
    while i < n:
        if a[i] > 0:
            return 0 #sa
        i += 1
    return 1 #nie ma

# zwraca 1 gdy uklad a jest wygrywajacy, 0 wpp
def wygra(a):
    if koniec(a) == 1: #jesli w a nie ma kamykow
        return 0 #przegrana
    i = 0
    while i < n:
        if i == 0:
            d = a[0]
        else:
            d = a[i] - a[i - 1]
        while d >= 1:
            a[i] -= d
            if wygra(a) == 0: #sprawdzamy czy powyzszym ruchu takie ulozenie przegrywa jesli tak
                a[i] += d
                return 1 #wygrana
            a[i] += d
            d -= 1
        i += 1
    return 0 #przegrana


#program glowny
#pobiera dane oraz wpisuje wynik do pliku
MAXN = 1000 # max liczba kupek kamieni
a = [0 for _ in range(MAXN)]

linie=[]


u=len(glob.glob("in/*.txt"))

i=1
pom=1
while i!=(u+1):
    p=str(i)
    wejscie=open("in/in"+p+".txt","r")
    linie=wejscie.readlines()

    n =int(linie[0])

    a = linie[1].split()
    for x in range(0, len(a)):
        z = int(a[x])
        a[x] = z
    a.append(0)


    wyjscie=open("out/out"+p+".txt","w")
    if wygra(a) == 1:
        wyjscie.write("TAK")
    else:
        wyjscie.write("NIE")

    i+=1

wyjscie.close()
wejscie.close()

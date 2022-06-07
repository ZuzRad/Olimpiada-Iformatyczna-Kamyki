import os, glob
plik = open('raport.html', 'w')



#pliki_out = os.listdir("out/")
#pliki_in = os.listdir("in/")
pliki_out_sciezka=glob.glob("out/*.txt")
pliki_in_sciezka=glob.glob("in/*.txt")

#dane_out = plik_out.readlines()
#plik_out.close()

#dane_in = plik_in.readlines()
#plik_in.close()

u=len(glob.glob("in/*.txt"))
i=0
dane=""
while i!=u:
    wyjscie=open(f'{os.path.abspath(pliki_out_sciezka[i])}','r')
    wyjscie_dane=wyjscie.readline()
    wyjscie.close()

    wejscie = open(f'{os.path.abspath(pliki_in_sciezka[i])}', 'r')
    wejscie_dane = wejscie.readlines()
    wejscie.close()

    dane=dane+f"""
    <tr>
        <td>{i+1}</td> <td>{wejscie_dane[0]}</td> <td>{wejscie_dane[1]}</td> <td>{wyjscie_dane}</td>
    </tr>

    """
    i+=1

style1 = "{border: 1px solid black;text-align:center;padding: 6;background-color: #F0F8FF;border-collapse: collapse}"
style2="{border: 1px solid black;text-align:center;padding: 6;background-color: #AFEEEE;border-collapse: collapse}"
raport = f"""<html>
            <head>
            <style>
            table, td{style1}
            th {style2}
            </style>
            </head>
            <body>
            <center>
            <table>
            <thead>
      <tr>
         <th>Numer gry</th> <th>Liczba stosów kamieni</th> <th>Liczba kamieni w stosach</th> <th>Czy Jaś może wygrać?</th>
      </tr>
   </thead>
   {dane}
   </table></center></body></html>
"""


plik.write(raport)
plik.close()

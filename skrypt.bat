@echo off
setlocal enabledelayedexpansion

cd /d %~dp0
set "path=C:\Users\Zuzia\AppData\Local\Programs\Python\Python310\python.exe"

set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%


:menu
title MENU
type menu.txt

echo 1. URUCHOM PROGRAM
echo 2. INSTRUKCJA
echo 3. STWORZ RAPORT
echo 4. OTWORZ RAPORT
echo 5. STWORZ BACKUP
echo 6. WYJSCIE
echo:
set /p opcja=
if %opcja%==1 goto 1
if %opcja%==2 goto 2
if %opcja%==3 goto 3
if %opcja%==4 goto 4
if %opcja%==5 goto 5
if %opcja%==6 goto 6
echo:
echo Bledna opcja
echo Kliknij jakikolwiek klawisz aby wpisac ponownie
pause>nul
cls
goto menu

:1
cls
title PROGRAM
start kamienie.py
echo Program zostal poprawnie uruchomiony

echo ..................................................
echo Kliknij jakikolwiek klawisz aby wrocic do menu:
pause>nul
cls
goto menu

:2
cls
title INSTRUKCJA

echo                                         INSTRUKCJA
echo ..........................................................................................
echo Temat projektu: Kamyki
echo Autor: Zuzanna Radosz
echo ..........................................................................................
echo Skrypt.bat obsluguje wszystkie pliki projektu za pomocą menu glownego.
echo W menu zawarte sa ponizsze opcje:
echo ..........................................................................................
echo 1.Uruchom program: Uruchomia skrypt kamienie.py, który pobiera dane z pliku in.txt,
echo przetwarza je, a nastepnie wpisuje dane wyjsciowe do pliku out.txt.
echo 2.Instrukcja: wyswietla instrukcje
echo 3.Stworz raport: Uruchamia skrypt raport.py, który pobiera dane wejsciowe i wyjsciowe, a
echo nastepnie na ich podstawie tworzy raport.html.
echo 4.Otworz raport: Otwiera plik raport.html.
echo 5.Stworz backup: Skrypt.bat pobiera dane wejsciowe, wyjsciowe oraz raport.html,
echo a nastepnie zapisuje je w folderze backup.
echo 6.Wyjscie: Konczy dzialanie skryptu.
echo ..........................................................................................
echo Przed wlaczeniem proramu w katalogu glownym musi znajdowac sie plik tekstowy in.txt
echo Format pliku wejsciowego to:
echo u - liczba calkowita oznaczajaca ilosc gier
echo u par linijek z nastepujacymi danymi:
echo    -pierwsza linijka: n - liczba calkowita oznaczajaca ilosc kupek kamieni
echo    -druga linijka: n liczb calkowitych oddzielonych spacjami oznaczajace ilosc
echo     kamieni w kupkach
echo ...........................................................................................
echo Kliknij jakikolwiek klawisz aby wrocic do menu:
pause>nul
cls
goto menu

:3
cls
title RAPORT
start raport.py
echo Raport zostal poprawnie utworzony

echo ..................................................
echo Kliknij jakikolwiek klawisz aby wrocic do menu:
pause>nul
cls
goto menu

:4
cls
title RAPORT
echo Otwieranie raportu...
start raport.html

echo ..................................................
echo Kliknij jakikolwiek klawisz aby wrocic do menu:
pause>nul
cls
goto menu

:5
cls
title BACKUP
echo Trwa tworzenie backupu...
md backup\%date%_%hour%-%min%
IF EXIST raport.html copy raport.html backup\%date%_%hour%-%min%\raport.html
set "path=C:\Windows\System32"
xcopy /E /I in backup\%date%_%hour%-%min%\in
xcopy /E /I out backup\%date%_%hour%-%min%\out
set "path=C:\Users\Zuzia\AppData\Local\Programs\Python\Python310\python.exe"
echo ..................................................
echo Kliknij jakikolwiek klawisz aby wrocic do menu:
pause>nul
cls
goto menu

:6
cls
exit
@echo on



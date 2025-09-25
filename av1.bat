@echo off
VSPipe.exe -c y4m "%~f1" - | SvtAv1EncApp.exe --crf 28 --preset 4   --progress 2 -b "%~p1%~n1.ivf" -i -
:end
pause

@echo off
VSPipe.exe -c y4m "%~f1" - | SvtAv1EncApp.exe --crf %2 --preset 4 --film-grain-denoise 1 --film-grain 14  --progress 2 -b "%~p1%~n1.fg14.ivf" -i -  2>&1 | powershell -ExecutionPolicy Bypass -NoProfile -Command  "$input | Tee-Object -FilePath '%~p1%~n1.av1fg14.log'  | Out-String -Stream"

:end
pause

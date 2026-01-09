@echo off
VSPipe.exe -c y4m "%~f1" - | SvtAv1EncApp.exe --crf %2 --preset 4 --enable-variance-boost 1 --tf-strength 1 --sharpness 1 --film-grain 14 --luminance-qp-bias 25 --tile-columns 1 --progress 2 -b "%~p1%~n1.jet.ivf" -i -  2>&1 | powershell -ExecutionPolicy Bypass -NoProfile -Command  "$input | Tee-Object -FilePath '%~p1%~n1.jet.log'  | Out-String -Stream"

:end
pause

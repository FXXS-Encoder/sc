@echo off

goto case%3
:case
  set POOLS=""
goto done

:case0
  set POOLS="+,-,-，,-"
goto done

:case1
  set POOLS="-,+,-,-"
goto done

:case2
  set POOLS="-,-,+,-"
goto done

:case3
  set POOLS="-,-,-,+"
goto done

:done
echo on
VSPipe.exe -c y4m "%~f1" - |x265_mod_avx512_msvc.exe --asm=avx512  -D 10 --crf %2 --preset placebo --level-idc 5.1 --ctu 32 --rd 4 --subme 7 --ref 6  --me 3 --qg-size 8 --weightb --no-rect --no-amp --rskip 0 --aud --range limited --repeat-headers --tu-intra-depth 4 --tu-inter-depth 4 --no-open-gop --no-sao --no-early-skip --min-keyint=1 --rc-lookahead 100 --no-cutree --bframes 16 --vbv-bufsize 160000 --vbv-maxrate 160000 --colorprim bt709 --transfer bt709 --colormatrix bt709 --deblock -3:-3 --no-strong-intra-smoothing --ipratio 1.3 --pbratio 1.2 --qcomp 0.65 --hevc-aq --aq-strength 1 --psy-rd 2.00 --psy-rdoq 4.00 --hist-scenecut --cbqpoffs -2 --crqpoffs -2 --pools %POOLS% --output "%~p1%~n1.hevc" --y4m -  2>&1 | powershell -ExecutionPolicy Bypass -NoProfile -Command  "$input | Tee-Object -FilePath '%~p1%~n1.265bat.log'  | Out-String -Stream"
:end
pause

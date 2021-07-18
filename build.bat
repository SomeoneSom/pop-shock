IF EXIST cool-stuff.ndll (
    del cool-stuff.ndll
)
lime build windows -cpp
cmake .
cmake --build . --target install
ren cool-stuff.dll cool-stuff.ndll
copy cool-stuff.ndll export\release\windows\bin\cool-stuff.ndll
copy restoreInCaseOfCrash.exe export\release\windows\bin\restoreInCaseOfCrash.exe
IF NOT EXIST export\release\windows\bin\bgs (
    mkdir export\release\windows\bin\bgs
)
copy bgs\*.png export\release\windows\bin\bgs
copy plsWork.exe export\release\windows\bin\plsWork.exe
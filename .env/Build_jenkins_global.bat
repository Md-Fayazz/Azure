@echo off

call .env/conan.environment

if not exist ".build" (
    mkdir ".build"
)

cd .build
call ../remotes.bat

echo "conan install --profile default .."
conan install --profile default ..

echo "activate.bat"
call activate.bat

echo "cmake .. -G \"MinGW Makefiles\""
cmake .. -G "MinGW Makefiles"

echo "cmake --build . --target all"
cmake --build . --target all

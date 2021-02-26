rmdir /S /Q Build\MSVC
rmdir /S /Q Install\MSVC
cmake -D USE_MSVC_RUNTIME_LIBRARY_DLL=ON -D INSTALL_CMAKE_FILES=OFF -D INSTALL_LIBS=ON -D BUILD_BULLET2_DEMOS=OFF -D BUILD_CLSOCKET=OFF -D BUILD_CPU_DEMOS=OFF -D BUILD_ENET=OFF -D BUILD_EXTRAS=OFF -D BUILD_OPENGL3_DEMOS=OFF -D BUILD_PYBULLET=OFF -D BUILD_UNIT_TESTS=OFF -D CMAKE_INSTALL_PREFIX=".\Install\MSVC" -H. -BBuild/MSVC
cmake --build ./Build/MSVC --config Release
cmake --install ./Build/MSVC --config Release

:: Copy the artifacts over
mkdir ..\\Extern\\Bullet3\\Libraries\\x64\\Windows\\MSVC\\
mkdir ..\\Extern\\Bullet3\\Include
xcopy /Y /E .\Install\MSVC\lib\ ..\Extern\Bullet3\Libraries\x64\Windows\MSVC\
xcopy /Y /E .\src\ ..\Extern\Bullet3\Include
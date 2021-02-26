rmdir /S /Q Build\MinGW
rmdir /S /Q Install\MinGW
cmake -D USE_MSVC_RUNTIME_LIBRARY_DLL=ON -G "MinGW Makefiles" -D INSTALL_CMAKE_FILES=OFF -D INSTALL_LIBS=ON -D BUILD_BULLET2_DEMOS=OFF -D BUILD_CLSOCKET=OFF -D BUILD_CPU_DEMOS=OFF -D BUILD_ENET=OFF -D BUILD_EXTRAS=OFF -D BUILD_OPENGL3_DEMOS=OFF -D BUILD_PYBULLET=OFF -D BUILD_UNIT_TESTS=OFF -D CMAKE_INSTALL_PREFIX=".\Install\MinGW" -H. -BBuild/MinGW
cmake --build ./Build/MinGW --config Release
cmake --install ./Build/MinGW --config Release

:: Copy the artifacts over
mkdir ..\\Extern\\Bullet3\\Libraries\\x64\\Windows\\MinGW\\
mkdir ..\\Extern\\Bullet3\\Include
xcopy /Y /E .\Install\MinGW\lib\ ..\Extern\Bullet3\Libraries\x64\Windows\MinGW\
xcopy /Y /E .\src\ ..\Extern\Bullet3\Include
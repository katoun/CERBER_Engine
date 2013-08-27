SET VisualStudioVersion=12.0

rmdir /s /q Build
mkdir Build
cd Build

cmake -G "Visual Studio 12" ..

"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" /nologo /property:Configuration=Debug ALL_BUILD.vcxproj
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" /nologo /property:Configuration=Release ALL_BUILD.vcxproj

"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" /nologo /property:Configuration=Debug INSTALL.vcxproj
"C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe" /nologo /property:Configuration=Release INSTALL.vcxproj

cd..
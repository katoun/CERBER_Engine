SET VisualStudioVersion=11.0

cd Dependencies
rmdir /s /q Build
mkdir Build
cd Build
cmake -G "Visual Studio 11" ..

"%windir%\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" /nologo /property:Configuration=Debug ALL_BUILD.vcxproj
"%windir%\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" /nologo /property:Configuration=Release ALL_BUILD.vcxproj

cd..
cd..
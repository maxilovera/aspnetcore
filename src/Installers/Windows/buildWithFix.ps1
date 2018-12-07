$ErrorActionPreference = 'Stop'
mkdir obj -ErrorAction Ignore
Invoke-WebRequest https://dotnetcli.blob.core.windows.net/dotnet/aspnetcore/Runtime/2.2.0/aspnetcore-runtime-internal-2.2.0-win-x64.zip -o .\obj\dotnetx64.zip
Invoke-WebRequest https://dotnetcli.blob.core.windows.net/dotnet/aspnetcore/Runtime/2.2.0/aspnetcore-runtime-internal-2.2.0-win-x86.zip -o .\obj\dotnetx86.zip

.\build.ps1 -x64 .\obj\dotnetx64.zip -x86 .\obj\dotnetx86.zip -IsFinalBuild -BuildNumber $env:BUILD_NUMBER`
-SignType Real`
/p:MicrosoftNetCoreAppPackageVersion=2.2.0`
/p:MicrosoftAspNetCoreAspNetCoreModulePackageVersion=2.2.0`
/p:MicrosoftAspNetCoreAspNetCoreModuleV2PackageVersion=2.2.0

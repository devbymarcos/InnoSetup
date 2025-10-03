; Script ajustado para instalar WorkPagerApi como serviço
#define MyAppName "WorkPagerApi"
#define MyAppVersion "1.0"
#define MyAppExeName "Pager.Api.exe"

[Setup]
AppId={{8C59CF92-5DC6-4AB3-892C-FA241158DB2B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher="DBM"
DefaultDirName=C:\WorkPagerApi
SetupIconFile=C:\worksystem\DESENVOLVIMENTO\PagerAPI\pagerApi.ico
UninstallDisplayIcon={app}\pagerApi.ico
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\worksystem\INSTALADORES
OutputBaseFilename=WorkPagerApi-Setup
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Files]
Source: "C:\worksystem\DESENVOLVIMENTO\PagerAPI\pagerApi.ico"; DestDir: "{app}"
Source: "C:\worksystem\DESENVOLVIMENTO\PagerAPI\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Run]
; Tenta parar o serviço (se existir)
Filename: "sc"; Parameters: "stop WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Tenta deletar o serviço (se existir)
Filename: "sc"; Parameters: "delete WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Cria o serviço apontando para o executável
Filename: "sc"; Parameters: "create WorkPagerApi binPath= ""{app}\Pager.Api.exe"" start= auto"; Flags: runhidden

; Inicia o serviço
Filename: "sc"; Parameters: "start WorkPagerApi"; Flags: runhidden

[UninstallRun]
; Para o serviço durante a desinstalação
Filename: "sc"; Parameters: "stop WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Remove o serviço durante a desinstalação
Filename: "sc"; Parameters: "delete WorkPagerApi"; Flags: runhidden skipifdoesntexist



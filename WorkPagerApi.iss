; Script ajustado para instalar WorkPagerApi como serviço
#define MyAppName "WorkPagerApi"
#define MyAppVersion "1.0.0"
#define MyAppExeName "Pager.Api.exe"

[Setup]
AppId={{8C59CF92-5DC6-4AB3-892C-FA241158DB2B}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher="DBM"
DefaultDirName=C:\WorkPagerApi
SetupIconFile=C:\DBM\COMPILADOS\pagerApi.ico
UninstallDisplayIcon={app}\pagerApi.ico
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\DBM\INSTALADORES
OutputBaseFilename=WorkPagerApi-Setup-{#MyAppVersion}
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Files]
Source: "C:\DBM\COMPILADOS\pagerApi.ico"; DestDir: "{app}"
Source: "C:\DBM\COMPILADOS\WorkPagerApi\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Run]
; Para o serviço anterior (se existir)
Filename: "sc"; Parameters: "stop {#MyAppName}"; Flags: runhidden skipifdoesntexist
Filename: "sc"; Parameters: "delete {#MyAppName}"; Flags: runhidden skipifdoesntexist

; Cria o novo serviço
Filename: "sc"; Parameters: "create {#MyAppName} binPath= ""{app}\{#MyAppExeName}"" start= auto"; Flags: runhidden
; Inicia o serviço
Filename: "sc"; Parameters: "start {#MyAppName}"; Flags: runhidden

[UninstallRun]
; Antes de remover arquivos, pare e exclua o serviço
Filename: "sc"; Parameters: "stop {#MyAppName}"; Flags: runhidden waituntilterminated
Filename: "sc"; Parameters: "delete {#MyAppName}"; Flags: runhidden waituntilterminated

[UninstallDelete]
; Remove pastas e arquivos após o serviço ter sido removido
Type: filesandordirs; Name: "{app}"
Type: dirifempty; Name: "{app}"

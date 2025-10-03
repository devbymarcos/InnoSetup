; Script ajustado para instalar WorkPagerApi como serviço
#define MyAppName "WorkPagerApi"
#define MyAppVersion "1.0.0"
#define MyAppExeName "Pager.Api.exe"

[Setup]
; Identificador único da aplicação (não altere em updates, só se for um produto novo)
AppId={{8C59CF92-5DC6-4AB3-892C-FA241158DB2B}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher="DBM"
DefaultDirName=C:\WorkPagerApi
; Ícone do instalador
SetupIconFile=C:\DBM\COMPILADOS\pagerApi.ico
; Ícone exibido no Painel de Controle (Programas e Recursos)
UninstallDisplayIcon={app}\pagerApi.ico
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\DBM\INSTALADORES
; Instalador vai sair com versão no nome (ex: WorkPagerApi-Setup-1.0.0.exe)
OutputBaseFilename=WorkPagerApi-Setup-{#MyAppVersion}
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Files]
; Copia o ícone para a pasta de instalação
Source: "C:\DBM\COMPILADOS\pagerApi.ico"; DestDir: "{app}"
; Copia todos os arquivos publicados da aplicação
Source: "C:\DBM\COMPILADOS\WorkPagerApi\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Run]
; Para o serviço (se existir)
Filename: "sc"; Parameters: "stop WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Deleta o serviço (se existir)
Filename: "sc"; Parameters: "delete WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Cria o serviço apontando para o executável publicado
Filename: "sc"; Parameters: "create WorkPagerApi binPath= ""{app}\{#MyAppExeName}"" start= auto"; Flags: runhidden

; Inicia o serviço
Filename: "sc"; Parameters: "start WorkPagerApi"; Flags: runhidden

[UninstallRun]
; Para o serviço na desinstalação
Filename: "sc"; Parameters: "stop WorkPagerApi"; Flags: runhidden skipifdoesntexist

; Remove o serviço na desinstalação
Filename: "sc"; Parameters: "delete WorkPagerApi"; Flags: runhidden skipifdoesntexist

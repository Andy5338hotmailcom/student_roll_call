[Setup]
AppName=学生点名系统(x64)
AppVersion=3.0
AppPublisher=Andy_5338
; 启用自定义安装路径（用户可修改）
DefaultDirName={autopf}\学生点名系统(x64)
DisableDirPage=no
; 核心：禁用管理员权限
PrivilegesRequired=lowest
;64位，修改为32位时注释
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64os
; 原有配置保留
OutputBaseFilename=student_roll_call(x64)
OutputDir=./output
DisableProgramGroupPage=no
DisableReadyPage=no
DisableFinishedPage=no
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
MinVersion=6.1sp1

[Languages]
Name: "chinese"; MessagesFile: "compiler:Default.isl"

[Files]
; 打包PDF_open文件夹所有内容到安装目录的PDF_open子文件夹
Source: "student_roll_call(x64)\*"; DestDir: "{app}\student_roll_call(x64)"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; 修复路径格式（使用\而非.\）和图标路径
Name: "{userdesktop}\学生点名系统(x64)"; Filename: "{app}\student_roll_call(x64)\student_roll_call(x64).exe"; WorkingDir: "{app}\student_roll_call(x64)"
Name: "{group}\学生点名系统(x64)"; Filename: "{app}\student_roll_call(x64)\student_roll_call(x64).exe"; WorkingDir: "{app}\student_roll_call(x64)"
Name: "{group}\卸载 学生点名系统(x64)"; Filename: "{uninstallexe}"

[Run]
; 修复启动路径
Filename: "{app}\student_roll_call(x64)\student_roll_call(x64).exe"; Description: "启动学生点名系统"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: files; Name: "{userdesktop}\学生点名系统(x64).lnk"

[Messages]
; 自定义系统版本过低的提示信息
;SetupNeedsNewerOS=此安装程序需要 Windows 7 (x64) 或更高版本的操作系统才能运行。请升级你的系统后重试。

[Registry]
; 已禁用管理员权限，HKLM配置全部移除，无需保留

[Code]
{$IFDEF UNICODE}
  {$DEFINE UNICODE_SYSUTILS}
{$ENDIF}
{$INCLUDE SysUtils.inc}
function GetInstallTime(Param: string): string;
begin
  Result := GetDateTimeString('yyyy-mm-dd hh:nn:ss', #0, #0);
end;

function UninstallQuery: Boolean;
var
  //OldPath: string;
  //NewPath: string;
  TargetPath: string;
begin
  TargetPath := ';' + ExpandConstant('{app}\student_roll_call'); 
  // 原有HKLM相关代码保留注释/删除即可
  Result := True;
end;
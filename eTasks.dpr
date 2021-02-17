program eTasks;

{$R *.dres}

uses
  System.StartUpCopy,
  {$IFDEF ANDROID}
  eTasks.libraries.Android in 'Source\Libraries\eTasks.libraries.Android.pas',
  {$ENDIF }
  {$IFDEF MSWINDOWS}
  eTasks.View.Windows.login in 'Source\View\Windows\eTasks.View.Windows.login.pas',
  eTasks.View.Windows.main in 'Source\View\Windows\eTasks.View.Windows.main.pas',
  eTasks.libraries.Windows in 'Source\Libraries\eTasks.libraries.Windows.pas',
  {$ENDIF }
  FMX.Forms,
  eTasks.View.Dialogs.SheetFotos in 'Source\View\Dialogs\eTasks.View.Dialogs.SheetFotos.pas' {Sheet_fotos},
  eTasks.View.Dialogs.Termos in 'Source\View\Dialogs\eTasks.View.Dialogs.Termos.pas' {Dlg_Termos},
  eTasks.View.Dialogs.Messages in 'Source\View\Dialogs\eTasks.View.Dialogs.Messages.pas' {Dlg_Login_messages},
  eTasks.View.Dialogs.Messages.Consts in 'Source\View\Dialogs\eTasks.View.Dialogs.Messages.Consts.pas',
  eTasks.View.Dialogs.Factory in 'Source\View\Dialogs\eTasks.View.Dialogs.Factory.pas',
  eTasks.Model.LoggedUser in 'Source\Model\eTasks.Model.LoggedUser.pas',
  eTasks.Model.Interfaces in 'Source\Model\eTasks.Model.Interfaces.pas',
  eTasks.View.Dialogs.TirarFoto in 'Source\View\Dialogs\eTasks.View.Dialogs.TirarFoto.pas' {Form_Camera},
  eTasks.Model.Auth in 'Source\Model\eTasks.Model.Auth.pas',
  eTasks.Model.Consts in 'Source\Model\eTasks.Model.Consts.pas',
  eTasks.Controller.Interfaces in 'Source\Controller\eTasks.Controller.Interfaces.pas',
  eTasks.Controller.Login in 'Source\Controller\eTasks.Controller.Login.pas',
  eTasks.Model.Factory in 'Source\Model\eTasks.Model.Factory.pas',
  eTasks.libraries.Imagens64 in 'Source\Libraries\eTasks.libraries.Imagens64.pas',
  eTasks.Model.Usuarios in 'Source\Model\eTasks.Model.Usuarios.pas',
  eTasks.View.Dialogs.EditarFoto in 'Source\View\Dialogs\eTasks.View.Dialogs.EditarFoto.pas' {Form_Editar_foto},
  eTasks.View.Dialogs.loading in 'Source\View\Dialogs\eTasks.View.Dialogs.loading.pas' {Form_loading},
  eTasks.libraries in 'Source\Libraries\eTasks.libraries.pas',
  eTasks.View.Dialogs.dialogYesNo in 'Source\View\Dialogs\eTasks.View.Dialogs.dialogYesNo.pas' {DialogYesNo},
  eTasks.Controller.Usuario in 'Source\Controller\eTasks.Controller.Usuario.pas',
  eTasks.view.categorias in 'Source\View\eTasks.view.categorias.pas',
  eTasks.View.Dialogs.Calendar in 'Source\View\Dialogs\eTasks.View.Dialogs.Calendar.pas' {Dlg_Calendar},
  eTasks.View.Components.Calendario in 'Source\View\Components\eTasks.View.Components.Calendario.pas' {Calendario: TFrame},
  eTasks.View.Windows.help in 'Source\View\Windows\eTasks.View.Windows.help.pas' {Form_Windows_Ajuda};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  {$IFDEF ANDROID}
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  if not TModelLoggedUser.Verificar then
   Application.CreateForm(TForm_Android_Login, Form_Android_Login)
  else
   Application.CreateForm(TForm_Android_main, Form_Android_Main);
  {$ENDIF}
  {$IFDEF MSWINDOWS}
  if not TModelLoggedUser.Verificar then
   Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  Application.CreateForm(TForm_Windows_Ajuda, Form_Windows_Ajuda);
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login);
  Application.CreateForm(TForm_Windows_Login, Form_Windows_Login)
  else
   Application.CreateForm(TForm_Windows_Main, Form_Windows_Main);
  {$ENDIF}
  Application.Run;
end.


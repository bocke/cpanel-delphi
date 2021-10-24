library CplTest;

uses
  Windows,
  Cpl;

{$E cpl}

{$R Icon.res}

resourcestring
  Name = 'Test Applet';
  Description = 'A Test Applet created with Delphi as DLL.';
  BoxMessage = 'Hello World!';

procedure Start(const Handle: HWND);
begin
  MessageBox(Handle, PChar(BoxMessage), nil, MB_OK);
end;

function CPlApplet(hwndCpl: HWND; msg: UINT;
  lParam1: LPARAM; lParam2: LPARAM): integer; stdcall;
begin
  case msg of
    CPL_DBLCLK,
    CPL_STARTWPARMS:
      Start(hwndCpl);
    CPL_INIT,
    CPL_STOP,
    CPL_GETCOUNT,
    CPL_NEWINQUIRE:
      begin
        Result := 1;
        exit;
      end;
    CPL_INQUIRE:
      with PCPLINFO(lParam2)^ do begin
        idIcon := 1;
        idName := PResStringRec(@Name)^.Identifier;
        idInfo := PResStringRec(@Description)^.Identifier;
        lData := 0;
      end;
  end;
  Result := 0;
end;

exports
  CPlApplet;

begin
end.

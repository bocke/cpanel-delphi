library CplTest;

uses
  WinTypes,
  WinProcs,
  Cpl;

{$R Icon.res}

procedure Start(const Handle: HWND);
var
  Msg: array [0..256] of char;
begin
  LoadString(hInstance, 3, @Msg[0], 255);
  MessageBox(Handle, @Msg[0], nil, MB_OK);
end;

function CPlApplet(hWndCpl: HWnd; msg: Word;
    lParam1, lParam2: Longint): longint; export;
begin
  case msg of
    CPL_DBLCLK:
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
        idName := 1;
        idInfo := 2;
        lData := 0;
      end;
  end;
  Result := 0;
end;

exports
  CPlApplet;

begin
end.

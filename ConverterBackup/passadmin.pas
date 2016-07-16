unit passadmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Mask, DBCtrls, Buttons;

type
  TFormPassAdmin = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassAdmin: TFormPassAdmin;
  Pass: Boolean;
  PassWord: AnsiString;

implementation

{$R *.dfm}

procedure TFormPassAdmin.BitBtn2Click(Sender: TObject);
begin
  Pass := False;
  Table1.Active := True;
  if Table1.Lookup('aname', Edit1.Text, 'apass') <> Null then
  begin
    Password := Table1.Lookup('aname', Edit1.Text, 'apass');
    if AnsiCompareStr(Password, Edit2.Text) = 0 then
    begin
      Pass := True;
      showmessage('���ã���ӭʹ�ã�');
    end
    else showmessage('����������Ϣ����');
  end
  else showmessage('�Բ���û������û���');
  Table1.Active := False;
  Close;
end;

procedure TFormPassAdmin.BitBtn1Click(Sender: TObject);
begin
  Pass := False;
  Close;
end;

end.

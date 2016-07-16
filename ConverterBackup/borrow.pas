unit borrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, DB,
  Buttons, ComCtrls, SqlTimSt;

type
  TFormBorrow = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Query1: TQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Table1: TTable;
    DataSource2: TDataSource;
    Query2: TQuery;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure OnCellClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBorrow: TFormBorrow;

implementation

{$R *.dfm}

procedure TFormBorrow.BitBtn2Click(Sender: TObject);
begin
  Table1.Active := True;
  Table1.TableName := 'CLIENT';
  if Table1.Lookup('cname', Edit2.Text, 'cname') = null then
    showmessage('û������û�')
  else begin
    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Add('select book.bno,bname,btime from borrow,book ');
    Query2.SQL.Add('where book.bno=borrow.bno ');
    Query2.SQL.Add('and cname=''' + Edit2.Text + '''');
    Query2.Prepare;
    Query2.Open;
    Query2.Fields[0].DisplayLabel := '���';
    Query2.Fields[1].DisplayLabel := '����';
    Query2.Fields[2].DisplayLabel := '���ʱ��';
    //Label6.Caption := '�������Ѿ�����' + inttostr(Query1.RecordCount) + '����';
  end;
  Table1.Active := False;
end;

procedure TFormBorrow.OnCellClick(Column: TColumn);
begin
  Edit3.Text := DBGrid2.Fields[0].AsString;
end;

procedure TFormBorrow.BitBtn3Click(Sender: TObject);
begin
  Query2.Close;
  Query2.SQL.Clear;
  Query2.SQL.Add('delete from borrow ');
  Query2.SQL.Add('where bno=''' + Edit3.Text + ''' ');
  Query2.SQL.Add('and cname=''' + Edit2.Text + '''');
  Query2.ExecSQL;
  Query2.Close;
  Query2.SQL.Clear;
  Query2.SQL.Add('select book.bno,bname,btime from borrow,book ');
  Query2.SQL.Add('where book.bno=borrow.bno ');
  Query2.SQL.Add('and cname=''' + Edit2.Text + '''');
  Query2.Prepare;
  Query2.Open;
  Query2.Fields[0].DisplayLabel := '���';
  Query2.Fields[1].DisplayLabel := '����';
  Query2.Fields[2].DisplayLabel := '���ʱ��';
  //Label6.Caption := '�밴��ѯ��ťˢ��';
end;

procedure TFormBorrow.BitBtn4Click(Sender: TObject);
begin
  Table1.Active := True;
  Table1.TableName := 'CLIENT';
  if Table1.Lookup('cname', Edit1.Text, 'cname') = null then
    showmessage('û������û�')
  else begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('select book.bno,bname,btime from borrow,book ');
    Query1.SQL.Add('where book.bno=borrow.bno ');
    Query1.SQL.Add('and cname=''' + Edit1.Text + '''');
    Query1.Prepare;
    Query1.Open;
    Query1.Fields[0].DisplayLabel := '���';
    Query1.Fields[1].DisplayLabel := '����';
    Query1.Fields[2].DisplayLabel := '���ʱ��';
    //Label5.Caption := '�������Ѿ�����' + inttostr(Query1.RecordCount) + '����';
  end;
  Table1.Active := False;
end;

procedure TFormBorrow.BitBtn5Click(Sender: TObject);
var temp: string;
begin
  //Table1.Active := True;
  //Table1.TableName := 'BOOK';
  //if Table1.Lookup('bname', Edit3.Text, 'bname') = null then
    //showmessage('û���Ȿ�飡')
  //else begin
    //Table1.Active := False;
  try
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('insert into borrow values');
    Query1.SQL.Add('(''' + Edit4.Text + ''',');
    Query1.SQL.Add('''' + Edit1.Text + ''',');
    Query1.SQL.Add('''' + FormatDateTime('DD-MM��-YY',DATE) + ''')');
    Query1.ExecSQL;
  except
    temp := '����ʧ�ܣ�ԭ�����������֮һ��' + #13 + #13;
    temp := temp + '1.���Ľ��������ѵ���' + #13;
    temp := temp + '2.�����������ȫ�����ꣻ' + #13;
    temp := temp + '3.���������Ų����ڣ�' + #13;
    temp := temp + '4.���Ѿ������Ȿ�顣';
    showmessage(temp);
  end;
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.Add('select book.bno,bname,btime from borrow,book ');
    Query1.SQL.Add('where book.bno=borrow.bno ');
    Query1.SQL.Add('and cname=''' + Edit1.Text + '''');
    Query1.Prepare;
    Query1.Open;
    Query1.Fields[0].DisplayLabel := '���';
    Query1.Fields[1].DisplayLabel := '����';
    Query1.Fields[2].DisplayLabel := '���ʱ��';
    //Label5.Caption := '�밴��ѯ��ťˢ��';
  //end;
  //Table1.Active := False;
  //Query1.Post;
end;

end.

unit clientservice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables, ComCtrls,
  Buttons, DBCtrls;

type
  TFormClientService = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Query1: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Query2: TQuery;
    DataSource2: TDataSource;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn3: TBitBtn;
    Query3: TQuery;
    DataSource3: TDataSource;
    procedure OnFormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientService: TFormClientService;
  ClientName: Ansistring;

implementation

uses passclient;

{$R *.dfm}

procedure TFormClientService.OnFormShow(Sender: TObject);
begin
  ClientName := FormPassClient.Edit1.Text;
end;

procedure TFormClientService.BitBtn2Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0 :begin
    Query2.SQL.Clear;
    Query2.Close;
    Query2.SQL.Add('(select book.bno,bname,author,pub,bnum,bonum from book,bonum ');
    Query2.SQL.Add('where book.bno=bonum.bno and book.bno=''' + Edit1.Text + ''')');
    Query2.SQL.Add('union (select bno,bname,author,pub,bnum,0 from book ');
    Query2.SQL.Add('where bno not in (select bno from bonum) and bno=''' + Edit1.Text + ''')');
    Query2.SQL.Add('order by bno');
    Query2.Prepare;
    Query2.Open;
  end;
  1: begin
    Query2.SQL.Clear;
    Query2.Close;
    Query2.SQL.Add('(select book.bno,bname,author,pub,bnum,bonum from book,bonum ');
    Query2.SQL.Add('where book.bno=bonum.bno and bname like''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('union (select bno,bname,author,pub,bnum,0 from book ');
    Query2.SQL.Add('where bno not in (select bno from bonum) and bname like''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('order by bno');
    Query2.Prepare;
    Query2.Open;
  end;
  2 :begin
    Query2.SQL.Clear;
    Query2.Close;
    Query2.SQL.Add('(select book.bno,bname,author,pub,bnum,bonum from book,bonum ');
    Query2.SQL.Add('where book.bno=bonum.bno and author like ''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('union (select bno,bname,author,pub,bnum,0 from book ');
    Query2.SQL.Add('where bno not in (select bno from bonum) and author like ''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('order by bno');
    Query2.Prepare;
    Query2.Open;
  end;
  3 :begin
    Query2.SQL.Clear;
    Query2.Close;
    Query2.SQL.Add('(select book.bno,bname,author,pub,bnum,bonum from book,bonum ');
    Query2.SQL.Add('where book.bno=bonum.bno and pub like ''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('union (select bno,bname,author,pub,bnum,0 from book ');
    Query2.SQL.Add('where bno not in (select bno from bonum) and pub like ''%' + Edit1.Text + '%'')');
    Query2.SQL.Add('order by bno');
    Query2.Prepare;
    Query2.Open;
  end;
  end;
  Query2.Fields[0].DisplayLabel := '���';
  Query2.Fields[1].DisplayLabel := '����';
  Query2.Fields[2].DisplayLabel := '����';
  Query2.Fields[3].DisplayLabel := '������';
  Query2.Fields[4].DisplayLabel := '�ݲ�����';
  Query2.Fields[5].DisplayLabel := '�������';
end;

procedure TFormClientService.BitBtn1Click(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select book.bno,bname,btime,30-round(sysdate-btime) from borrow,book ');
  Query1.SQL.Add('where book.bno=borrow.bno ');
  Query1.SQL.Add('and cname=''' + ClientName + '''');
  Query1.Prepare;
  Query1.Open;
  Query1.Fields[0].DisplayLabel := '���';
  Query1.Fields[1].DisplayLabel := '����';
  Query1.Fields[1].DisplayWidth := 20;
  Query1.Fields[2].DisplayLabel := '���ʱ��';
  Query1.Fields[3].DisplayLabel := '��������';
end;

end.

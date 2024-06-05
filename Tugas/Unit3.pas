unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl2: TLabel;
    edt2: TEdit;
    edt3: TEdit;
    dbgrd1: TDBGrid;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: string;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into kategori values ("'+edt1.Text+'","'+edt2.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kategori');
  zqry1.Open;
  ShowMessage('Data Berhasil Disimpan!');
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
  with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('update kategori set name="'+edt2.Text+'" where id="'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kategori');
  end;
  ShowMessage('Data Berhasil Diupdate');
end;

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
  edt2.Text:=zqry1.fields[1].AsString;
  a:=zqry1.Fields[0].AsString;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('delete from kategori where id="'+a+'"');
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kategori');
    Open;
  end;
  ShowMessage('Data Berhasil Didelete');
end;

end.

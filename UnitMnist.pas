unit UnitMnist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    EditFile: TEdit;
    ButtonOpenFile: TButton;
    ButtonOpen: TButton;
    OpenDialog1: TOpenDialog;
    DrawGrid1: TDrawGrid;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    procedure ButtonOpenFileClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pic:array of array of Byte;
    Answer:Array of Byte;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ButtonOpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    EditFile.Text:=OpenDialog1.FileName;
    ButtonOpen.Click;
  end;
end;

procedure TForm3.DrawGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  i,j: Integer;
begin
  if Pic<>nil then
  begin
    for i := 0 to 27 do
      for j := 0 to 27 do
        DrawGrid1.Canvas.Pixels[j+Rect.Left,i+Rect.Top]:=RGB(Pic[ARow*20+ACol][i*28+j],Pic[ARow*20+ACol][i*28+j],Pic[ARow*20+ACol][i*28+j]);
  end;
end;

procedure TForm3.SpinEdit1Change(Sender: TObject);
begin
//  Image1.Picture.Bitmap:=Pic[SpinEdit1.Value];
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  F:File of byte;
  temp:byte;
  Len,i,j:Integer;
begin
  AssignFile(f,'train-labels.idx1-ubyte');
  Reset(f);
  Seek(f,4);
  Read(f,temp);
  Len:=Ord(temp) shl 24;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 16;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 8;
  Read(f,temp);
  Len:=Len+Ord(temp);
  StringGrid1.RowCount:=Len div 20;
  Application.ProcessMessages;
  SetLength(Answer,len);
  for i := 1 to Len do
  begin
    Read(f,temp);
    Answer[i-1]:=Temp;
    StringGrid1.Cells[(i-1) mod 20,(i-1) div 20]:=Temp.ToString;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var temp:TStrings;s:String;
  i:Integer;
  j: Integer;
begin
  temp:=TStringList.Create;
  for i := 1 to Length(Answer) do
  begin
    S:='';
    for j := 1 to Length(Pic[i-1]) do
      S:=S+IntToStr(Pic[i-1][j-1])+',';
//    for j := 0 to 9 do
//      if Answer[i-1]=j then s:=s+',1'
//      else s:=s+',0';
    S:=S+','+Answer[i-1].ToString;
    Temp.Add(S);
  end;
  Temp.SaveToFile('testtrainhand.csv');
end;

procedure TForm3.Button3Click(Sender: TObject);
var
  F:File of byte;
  temp:byte;
  Len,i,j:Integer;
begin
  AssignFile(f,'t10k-images.idx3-ubyte');
  Reset(f);
  Seek(f,4);
  Read(f,temp);
  Len:=Ord(temp) shl 24;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 16;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 8;
  Read(f,temp);
  Len:=Len+Ord(temp);
  DrawGrid1.DefaultColWidth:=28;
  DrawGrid1.DefaultRowHeight:=28;
  DrawGrid1.ColCount:=20;
  DrawGrid1.RowCount:=Len div 20;
  Application.ProcessMessages;
  SetLength(pic,0);
  SetLength(pic,len);
  Seek(f,16);
  for i := 1 to Len do
  begin
    SetLength(Pic[i-1],28*28);
    for j := 1 to 28*28 do
    begin
      Read(f,temp);
      Pic[i-1][j-1]:=temp;
    end;
  end;
  DrawGrid1.Repaint;
  CloseFile(f);

  AssignFile(f,'t10k-labels.idx1-ubyte');
  Reset(f);
  Seek(f,4);
  Read(f,temp);
  Len:=Ord(temp) shl 24;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 16;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 8;
  Read(f,temp);
  Len:=Len+Ord(temp);
  StringGrid1.RowCount:=Len div 20;
  Application.ProcessMessages;
  SetLength(Answer,0);
  SetLength(Answer,len);
  for i := 1 to Len do
  begin
    Read(f,temp);
    Answer[i-1]:=Temp;
    StringGrid1.Cells[(i-1) mod 20,(i-1) div 20]:=Temp.ToString;
  end;

end;

procedure TForm3.ButtonOpenClick(Sender: TObject);
var
  F:File of byte;
  temp:byte;
  Len,i,j:Integer;
begin
  AssignFile(f,EditFile.Text);
  Reset(f);
  Seek(f,4);
  Read(f,temp);
  Len:=Ord(temp) shl 24;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 16;
  Read(f,temp);
  Len:=Len+Ord(temp) shl 8;
  Read(f,temp);
  Len:=Len+Ord(temp);
  DrawGrid1.DefaultColWidth:=28;
  DrawGrid1.DefaultRowHeight:=28;
  DrawGrid1.ColCount:=20;
  DrawGrid1.RowCount:=Len div 20;
  Application.ProcessMessages;
  SetLength(pic,len);
  Seek(f,16);
  for i := 1 to Len do
  begin
    SetLength(Pic[i-1],28*28);
    for j := 1 to 28*28 do
    begin
      Read(f,temp);
      Pic[i-1][j-1]:=temp;
    end;
  end;
  DrawGrid1.Repaint;
end;

end.

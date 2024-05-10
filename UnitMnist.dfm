object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 338
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditFile: TEdit
    Left = 32
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 0
    Text = 'train-images.idx3-ubyte'
  end
  object ButtonOpenFile: TButton
    Left = 328
    Top = 24
    Width = 75
    Height = 25
    Caption = #25171#24320#25991#20214
    TabOrder = 1
    OnClick = ButtonOpenFileClick
  end
  object ButtonOpen: TButton
    Left = 432
    Top = 24
    Width = 75
    Height = 25
    Caption = #25171#24320
    TabOrder = 2
    OnClick = ButtonOpenClick
  end
  object DrawGrid1: TDrawGrid
    Left = 8
    Top = 80
    Width = 329
    Height = 209
    ColCount = 20
    DefaultColWidth = 28
    DefaultRowHeight = 28
    FixedCols = 0
    FixedRows = 0
    TabOrder = 3
    OnDrawCell = DrawGrid1DrawCell
  end
  object Button1: TButton
    Left = 432
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Answer'
    TabOrder = 4
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 343
    Top = 80
    Width = 320
    Height = 209
    ColCount = 20
    DefaultColWidth = 28
    DefaultRowHeight = 28
    FixedCols = 0
    FixedRows = 0
    TabOrder = 5
  end
  object Button2: TButton
    Left = 536
    Top = 22
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 305
    Width = 75
    Height = 25
    Caption = 'train'
    TabOrder = 7
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 312
    Top = 176
  end
end

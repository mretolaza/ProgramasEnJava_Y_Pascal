object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Reto en clase '
  ClientHeight = 202
  ClientWidth = 600
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 29
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 16
    Top = 67
    Width = 121
    Height = 33
    Caption = 'Reto 1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 407
    Top = 8
    Width = 185
    Height = 186
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 183
    Top = 67
    Width = 121
    Height = 31
    Caption = 'Reto 2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 183
    Top = 32
    Width = 121
    Height = 29
    TabOrder = 4
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 95
    Top = 120
    Width = 121
    Height = 29
    TabOrder = 5
    Text = 'Edit2'
  end
end

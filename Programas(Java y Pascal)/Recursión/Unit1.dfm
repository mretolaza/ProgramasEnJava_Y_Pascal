object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 106
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Button1: TButton
    Left = 183
    Top = 55
    Width = 98
    Height = 41
    Caption = 'Fibonacci'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 40
    Top = 32
    Width = 121
    Height = 29
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 40
    Top = 67
    Width = 121
    Height = 29
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 287
    Top = 55
    Width = 98
    Height = 41
    Caption = 'Factorial'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
end

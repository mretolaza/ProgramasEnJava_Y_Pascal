object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 
    '                                                                ' +
    '            Torres de Hanoi - Mar'#237'a Mercedes Retolaza Reyna C5A.' +
    ' '
  ClientHeight = 559
  ClientWidth = 915
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial Narrow'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 40
    Width = 137
    Height = 28
    EditLabel.Width = 138
    EditLabel.Height = 20
    EditLabel.Caption = 'Cantidad De Aros(1-10)'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 151
    Top = 40
    Width = 113
    Height = 28
    Caption = 'Iniciar Juego'
    TabOrder = 1
    OnClick = Button1Click
  end
end

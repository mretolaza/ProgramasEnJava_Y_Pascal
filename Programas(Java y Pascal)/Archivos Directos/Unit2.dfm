object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Actualizaci'#243'n de los archivos'
  ClientHeight = 355
  ClientWidth = 293
  Color = clInactiveBorder
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
  object StringGrid1: TStringGrid
    Left = 291
    Top = 24
    Width = 612
    Height = 161
    Color = clWhite
    ColCount = 6
    DefaultColWidth = 100
    RowCount = 6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 175
    Top = 272
    Width = 90
    Height = 28
    Caption = 'Buscar '
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 313
    Width = 89
    Height = 34
    Caption = 'Modificar.B'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 109
    Top = 313
    Width = 75
    Height = 34
    Caption = 'Borrar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 256
    Width = 161
    Height = 28
    EditLabel.Width = 160
    EditLabel.Height = 20
    EditLabel.Caption = 'Buscar Archivo por c'#243'digo'
    TabOrder = 4
  end
  object Button4: TButton
    Left = 190
    Top = 313
    Width = 75
    Height = 34
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Button4Click
  end
  object LabeledEdit2: TLabeledEdit
    Left = 89
    Top = 8
    Width = 121
    Height = 28
    EditLabel.Width = 62
    EditLabel.Height = 21
    EditLabel.Caption = 'C'#243'digo '
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Century Gothic'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    LabelPosition = lpLeft
    NumbersOnly = True
    ParentFont = False
    TabOrder = 6
  end
  object LabeledEdit3: TLabeledEdit
    Left = 89
    Top = 58
    Width = 121
    Height = 28
    EditLabel.Width = 63
    EditLabel.Height = 21
    EditLabel.Caption = 'Nombre'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Century Gothic'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 7
  end
  object LabeledEdit4: TLabeledEdit
    Left = 89
    Top = 100
    Width = 121
    Height = 28
    EditLabel.Width = 77
    EditLabel.Height = 21
    EditLabel.Caption = 'Direcci'#243'n '
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Century Gothic'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 8
  end
  object LabeledEdit5: TLabeledEdit
    Left = 89
    Top = 144
    Width = 121
    Height = 28
    EditLabel.Width = 45
    EditLabel.Height = 21
    EditLabel.Caption = 'Email '
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Century Gothic'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 9
  end
  object LabeledEdit6: TLabeledEdit
    Left = 89
    Top = 192
    Width = 121
    Height = 28
    EditLabel.Width = 43
    EditLabel.Height = 21
    EditLabel.Caption = 'Saldo'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'Century Gothic'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Century Gothic'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 10
  end
  object CheckBox1: TCheckBox
    Left = 175
    Top = 249
    Width = 97
    Height = 17
    Caption = 'Ver Datos'
    TabOrder = 11
    OnClick = CheckBox1Click
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Mar'#237'a Mercedes Retolaza Reyna - C5A - Archivos Directos. '
  ClientHeight = 451
  ClientWidth = 300
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object LabeledEdit1: TLabeledEdit
    Left = 80
    Top = 24
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
    Font.Name = 'Century Gothic'
    Font.Style = []
    LabelPosition = lpLeft
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
  end
  object LabeledEdit2: TLabeledEdit
    Left = 80
    Top = 74
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
    TabOrder = 1
  end
  object LabeledEdit3: TLabeledEdit
    Left = 80
    Top = 116
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
    TabOrder = 2
  end
  object LabeledEdit4: TLabeledEdit
    Left = 80
    Top = 160
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
    TabOrder = 3
  end
  object LabeledEdit5: TLabeledEdit
    Left = 80
    Top = 208
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
    TabOrder = 4
  end
  object Button1: TButton
    Left = 64
    Top = 259
    Width = 89
    Height = 36
    Caption = 'Ingresar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 305
    Top = 10
    Width = 956
    Height = 433
    Color = clWhite
    ColCount = 6
    DefaultColWidth = 158
    RowCount = 6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnSelectCell = StringGrid1SelectCell
    RowHeights = (
      24
      24
      24
      24
      24
      24)
  end
  object Button2: TButton
    Left = 8
    Top = 301
    Width = 89
    Height = 37
    Caption = 'Borrar Todo'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 104
    Top = 301
    Width = 91
    Height = 37
    Caption = 'Modificar.S.'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 40
    Top = 363
    Width = 201
    Height = 37
    Caption = 'Ordenar Por Nombre '
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 40
    Top = 406
    Width = 201
    Height = 37
    Caption = 'Ordenar Por C'#243'digo'
    TabOrder = 10
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 159
    Top = 258
    Width = 98
    Height = 37
    Caption = 'Mostrar'
    TabOrder = 11
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 201
    Top = 301
    Width = 98
    Height = 37
    Caption = 'Actualizar'
    TabOrder = 12
    OnClick = Button8Click
  end
end

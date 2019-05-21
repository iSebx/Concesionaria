object frmAgregarMarcaMod: TfrmAgregarMarcaMod
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmAgregarMarcaMod'
  ClientHeight = 234
  ClientWidth = 315
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAgregar: TPanel
    Left = 28
    Top = 39
    Width = 265
    Height = 118
    BevelOuter = bvNone
    TabOrder = 4
    object lblAgregarMarca: TLabel
      Left = 16
      Top = 13
      Width = 36
      Height = 16
      Caption = 'Marca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Vardana'
      Font.Style = []
      ParentFont = False
    end
    object lblAgregarModelo: TLabel
      Left = 16
      Top = 67
      Width = 42
      Height = 16
      Caption = 'Modelo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Vardana'
      Font.Style = []
      ParentFont = False
    end
    object edtNombreModelo: TEdit
      Left = 16
      Top = 88
      Width = 233
      Height = 21
      TabOrder = 0
    end
    object cbAgregarMarca: TComboBox
      Left = 16
      Top = 32
      Width = 233
      Height = 21
      TabOrder = 1
      Text = 'cbAgregarMarca'
    end
  end
  object pnlTitleBar: TPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 33
    Cursor = crArrow
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Agregar Marca / Modelo'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnMouseDown = pnlTitleBarMouseDown
    OnMouseMove = pnlTitleBarMouseMove
    OnMouseUp = pnlTitleBarMouseUp
    DesignSize = (
      315
      33)
    object btnClose: TImage
      Left = 284
      Top = 6
      Width = 20
      Height = 20
      Cursor = crHandPoint
      Anchors = [akRight]
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
        000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
        0970485973000000E0000000E001A25FFECA0000001974455874536F66747761
        7265007777772E696E6B73636170652E6F72679BEE3C1A0000034C4944415458
        47B597C14FD3501CC777D31310884E8290801A15C1092A4403EACD7489114738
        183D78F1A0095C39C9C93F80840439798184480401C31291892606483028226C
        6C06468C1A350357581803F6F3FDBAB6BCB6BF6E1D9B2FF924EBEFBD7EBFDFF5
        BDBEB63600B086201C08370882E87276FD7509EFC22EC1CF5897F1630DFB700C
        8E253508C8224FC475BD30DC283C612622032C22E239782EA5C9431625EE5D3B
        18BE253C6662119D783A445003B5480F0659DC68721E61274FE9C432610A3529
        2F4361E3A6B3527409DF08918C404DD4D6FB690E30E5FF30579042E8AEC45E00
        9CF3EC5E7633A6F835A10690171C754282462788775C741F4FD30DBACE830B93
        0F20DD6A49567BA4AD15767FFE00886DC1D6C89014861A17ED7E0A71310CBB2B
        41883C6A25C7C844945B34F1EF13F7393550128A47A36CD85E8BBDF518424407
        9EC9BD8986E77C6F79A819A38179B2612C00EE70493619FC37548BBD195543E8
        CD95B6B1B40481FA5A83A68C88DE36DC3A89CE046C3EF1929AB598E71533EF93
        8F8C6D677313868B8A20505743EB336F9BB47F539D3238AFFB6D5FBBBAA03F27
        07067273C910E86D931F2C864E1EB34B9CACADF4F6C2405E9E14C02C047ADBD8
        0F7CAA693A28D20911ECE9D1982709E1C700F838E58BA65809B1DCDD4D9A2BE8
        42AC6735C0DADA1AF83C1EE84F1200E1424801B23205ABABABB0B0B020E1B518
        C277F9FC8FAC2C42DE5C0D3136963284A7E46828E3DB30140A19CC15E6070749
        638599B3E5EC2EC860230A747682D7ED26CD11AFD70B43C5C5A439B2545F7B77
        DF5BB1BFA34315320BE167F4B3B9E64D15468B0A77A4AD9869A5FD305A6C6F37
        087A474634E6F8EF275B5A0CE314264E1E9B6652D61EC7C107F7213C3F0F5B6C
        BEE7DADA4841E40BDBFD167D3E08B00093CDCDE41864383F3FFEC9515EA50640
        52BD90CC5D70C08B8202529067D06E27EB3CB35515CF155F35809557320C4109
        A6C3FB1365BFC85732C4CA4B692621DCF6C3DBC12B35A5BCA7260062E5B57C3F
        21DCF643DB1F2A4F37E8FD34070A563E4CD2098197DD5F77B18CF2321454704D
        A4F8344B15E265417EFC73B5A38F9F733D649127D5C72915E235DB64264E1D9F
        9EA93AE3A03479C82209EE98269FE7B3D595BFC74B4BFE7C3C5731BE7CF5D26D
        1C4B6A1800DB3FD4DFA3CF0AD286020000000049454E44AE426082}
      Proportional = True
      Stretch = True
      OnClick = btnCloseClick
    end
  end
  object btnAceptar: TBitBtn
    Left = 168
    Top = 172
    Width = 105
    Height = 33
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 172
    Width = 105
    Height = 33
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
  object pnlModificar: TPanel
    Left = 28
    Top = 39
    Width = 265
    Height = 118
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 3
    object lblModificarMarca: TLabel
      Left = 16
      Top = 13
      Width = 36
      Height = 16
      Caption = 'Marca'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Vardana'
      Font.Style = []
      ParentFont = False
    end
    object lbModificarlModelo: TLabel
      Left = 16
      Top = 67
      Width = 42
      Height = 16
      Caption = 'Modelo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Vardana'
      Font.Style = []
      ParentFont = False
    end
    object edtModificarMarca: TDBEdit
      Left = 16
      Top = 32
      Width = 233
      Height = 21
      DataField = 'Marca'
      DataSource = DMConexion.dsListarModelos
      Enabled = False
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 15
      Top = 86
      Width = 232
      Height = 21
      DataField = 'Modelo'
      DataSource = DMConexion.dsListarModelos
      TabOrder = 1
    end
  end
end

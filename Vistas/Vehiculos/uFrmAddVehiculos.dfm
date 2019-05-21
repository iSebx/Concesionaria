object FrmAddVehiculos: TFrmAddVehiculos
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmAddVehiculos'
  ClientHeight = 351
  ClientWidth = 356
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblCapID: TLabel
    Left = 24
    Top = 48
    Width = 43
    Height = 25
    Caption = 'ID: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblID: TDBText
    Left = 73
    Top = 48
    Width = 56
    Height = 25
    AutoSize = True
    DataField = 'VehiculoID'
    DataSource = DMConexion.dsVehiculos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnAgregarModelo: TImage
    Left = 316
    Top = 100
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
      206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
      98000017709CBA513C000000097048597300000DD700000DD70142289B780000
      000774494D4507E3050D171607FD1B01A00000001974455874536F6674776172
      65007777772E696E6B73636170652E6F72679BEE3C1A000001DF494441545847
      EDD7CD2B04711CC7F1DDF22CCAC39972401E8AC8C5C5414929454A2E0E4EE4A6
      2425A5949B93C21FE0C281727371908B1389248A94288F653D5BEFEFFAFD6A9A
      9D69E637BB7B50FBA9D765E63BBFFDD4ECCEFC36E49668345A8A5A3405548322
      B59C59B8B019ABB8C35340BBE8564BFA0F1775620B2F907C4316BCF4E91E9FD8
      47AF5AD63B0C87D18F1D44A0F38C65D4F9348B0BF82FC0600646B0875758F380
      5935EA196647710A7F0518CAC1380EF10E7B525E60066790FBE6949417B8C50F
      DC92F2023A8FB8C1B5CD0926D4B867980D5C600D723B266DC6D0A6C63DC36C07
      E631871675D83D0CE90CA2501D0E1CD6C8833C454B90AD0EBB87219DA41430CE
      DF67C7927001AE2F4625E41DA29521578DC487933AC92830806DC8CF5A5B449D
      1A890F277592516018E7B29825EB685623F1F99B89255D205DC0B300E733510D
      FBD352DB806C48AC39C2029CE6274D0BC853AE0B572EE4C5657FABCAFE42DE31
      4EF357A605F2D127C3C9CABF2CD003D9333AF9807D6FF1853738CD474C0B6441
      F6FBD32E3661FF121E63094EF3D34605BCC2F5E907514205A6D08A06430508AB
      B5122A20DF4AF90B269B5313EDC8546B052AE0B4A8096B81211CC0FA2775058D
      B10F730A272B12248F677D0B644B56857A8B72B86CC942A15FDC159A76BCA804
      EA0000000049454E44AE426082}
    Proportional = True
    OnClick = btnAgregarModeloClick
  end
  object btnAgregarCliente: TImage
    Left = 316
    Top = 252
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
      206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
      98000017709CBA513C000000097048597300000DD700000DD70142289B780000
      000774494D4507E3050D171607FD1B01A00000001974455874536F6674776172
      65007777772E696E6B73636170652E6F72679BEE3C1A000001DF494441545847
      EDD7CD2B04711CC7F1DDF22CCAC39972401E8AC8C5C5414929454A2E0E4EE4A6
      2425A5949B93C21FE0C281727371908B1389248A94288F653D5BEFEFFAFD6A9A
      9D69E637BB7B50FBA9D765E63BBFFDD4ECCEFC36E49668345A8A5A3405548322
      B59C59B8B019ABB8C35340BBE8564BFA0F1775620B2F907C4316BCF4E91E9FD8
      47AF5AD63B0C87D18F1D44A0F38C65D4F9348B0BF82FC0600646B0875758F380
      5935EA196647710A7F0518CAC1380EF10E7B525E60066790FBE6949417B8C50F
      DC92F2023A8FB8C1B5CD0926D4B867980D5C600D723B266DC6D0A6C63DC36C07
      E631871675D83D0CE90CA2501D0E1CD6C8833C454B90AD0EBB87219DA41430CE
      DF67C7927001AE2F4625E41DA29521578DC487933AC92830806DC8CF5A5B449D
      1A890F277592516018E7B29825EB685623F1F99B89255D205DC0B300E733510D
      FBD352DB806C48AC39C2029CE6274D0BC853AE0B572EE4C5657FABCAFE42DE31
      4EF357A605F2D127C3C9CABF2CD003D9333AF9807D6FF1853738CD474C0B6441
      F6FBD32E3661FF121E63094EF3D34605BCC2F5E907514205A6D08A06430508AB
      B5122A20DF4AF90B269B5313EDC8546B052AE0B4A8096B81211CC0FA2775058D
      B10F730A272B12248F677D0B644B56857A8B72B86CC942A15FDC159A76BCA804
      EA0000000049454E44AE426082}
    Proportional = True
    OnClick = btnAgregarClienteClick
  end
  object lblModelo: TLabel
    Left = 176
    Top = 88
    Width = 34
    Height = 13
    Caption = 'Modelo'
  end
  object lblTipo: TLabel
    Left = 24
    Top = 136
    Width = 20
    Height = 13
    Caption = 'Tipo'
    FocusControl = edtTipo
  end
  object lblColor: TLabel
    Left = 24
    Top = 184
    Width = 25
    Height = 13
    Caption = 'Color'
    FocusControl = edtColor
  end
  object lblPrecio: TLabel
    Left = 176
    Top = 184
    Width = 29
    Height = 13
    Caption = 'Precio'
    FocusControl = edtPrecio
  end
  object lblCliente: TLabel
    Left = 24
    Top = 240
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object lblMarca: TLabel
    Left = 24
    Top = 88
    Width = 29
    Height = 13
    Caption = 'Marca'
  end
  object lblKM: TLabel
    Left = 176
    Top = 136
    Width = 49
    Height = 13
    Caption = 'Kilometros'
    FocusControl = edtKM
  end
  object pnlTitleBar: TPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 33
    Cursor = crSizeAll
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Agregar Vehiculos'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
    OnMouseDown = pnlTitleBarMouseDown
    OnMouseMove = pnlTitleBarMouseMove
    OnMouseUp = pnlTitleBarMouseUp
    object btnClose: TImage
      Left = 325
      Top = 6
      Width = 20
      Height = 20
      Cursor = crHandPoint
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
    Left = 205
    Top = 296
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
    TabOrder = 7
    OnClick = btnAceptarClick
  end
  object btnCancelar: TBitBtn
    Left = 24
    Top = 296
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
    TabOrder = 8
    OnClick = btnCancelarClick
  end
  object edtTipo: TDBEdit
    Left = 24
    Top = 152
    Width = 134
    Height = 21
    DataField = 'Tipo'
    DataSource = DMConexion.dsVehiculos
    TabOrder = 2
  end
  object edtColor: TDBEdit
    Left = 24
    Top = 200
    Width = 134
    Height = 21
    DataField = 'Color'
    DataSource = DMConexion.dsVehiculos
    TabOrder = 4
  end
  object edtPrecio: TDBEdit
    Left = 176
    Top = 200
    Width = 134
    Height = 21
    DataField = 'Precio'
    DataSource = DMConexion.dsVehiculos
    TabOrder = 5
  end
  object cbModelos: TDBLookupComboBox
    Left = 176
    Top = 104
    Width = 134
    Height = 21
    DataField = 'ModID'
    DataSource = DMConexion.dsVehiculos
    KeyField = 'ModID'
    ListField = 'Nombre'
    ListSource = deModelos
    TabOrder = 1
  end
  object cbMarcas: TDBLookupComboBox
    Left = 24
    Top = 104
    Width = 134
    Height = 21
    DataField = 'MarcaID'
    DataSource = deModelos
    KeyField = 'MarcaID'
    ListField = 'Nombre'
    ListSource = dsMarcas
    TabOrder = 0
    OnClick = cbMarcasClick
  end
  object edtKM: TDBEdit
    Left = 176
    Top = 152
    Width = 134
    Height = 21
    DataField = 'KM'
    DataSource = DMConexion.dsVehiculos
    TabOrder = 3
  end
  object cbCliente: TDBLookupComboBox
    Left = 24
    Top = 256
    Width = 286
    Height = 21
    DataField = 'PropID'
    DataSource = DMConexion.dsVehiculos
    KeyField = 'ID'
    ListField = 'Cliente'
    ListSource = dsClientes
    TabOrder = 6
  end
  object QModelos: TADOQuery
    Active = True
    Connection = DMConexion.Conexion
    CursorType = ctStatic
    DataSource = DMConexion.dsModelos
    Parameters = <>
    SQL.Strings = (
      'select * from Modelos')
    Left = 240
    Top = 104
  end
  object deModelos: TDataSource
    DataSet = QModelos
    Left = 280
    Top = 104
  end
  object QMarcas: TADOQuery
    Active = True
    Connection = DMConexion.Conexion
    CursorType = ctStatic
    DataSource = DMConexion.dsMarcas
    Parameters = <>
    SQL.Strings = (
      'select * from marcas')
    Left = 104
    Top = 104
  end
  object dsMarcas: TDataSource
    DataSet = QMarcas
    Left = 136
    Top = 104
  end
  object dsClientes: TDataSource
    DataSet = QClientes
    Left = 272
    Top = 240
  end
  object QClientes: TADOQuery
    Active = True
    Connection = DMConexion.Conexion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select p.PropID as [ID], p.Nombre+'#39' '#39'+p.Apellido as [Cliente] fr' +
        'om Propietarios as p')
    Left = 224
    Top = 240
  end
end

object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 422
  Width = 379
  object Conexion: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 152
    Top = 8
  end
  object dsClientes: TDataSource
    DataSet = tblClientes
    Left = 24
    Top = 72
  end
  object dsVehiculos: TDataSource
    DataSet = tblVehiculos
    Left = 24
    Top = 144
  end
  object tblClientes: TADOTable
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'Propietarios'
    Left = 88
    Top = 72
    object tblClientesPropID: TAutoIncField
      FieldName = 'PropID'
      ReadOnly = True
    end
    object tblClientesNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object tblClientesApellido: TStringField
      FieldName = 'Apellido'
      Size = 50
    end
    object tblClientesDNI: TStringField
      FieldName = 'DNI'
      Size = 50
    end
    object tblClientesTelefono: TStringField
      FieldName = 'Telefono'
      Size = 50
    end
    object tblClientesMail: TStringField
      FieldName = 'Mail'
      Size = 200
    end
    object tblClientesDireccion: TStringField
      FieldName = 'Direccion'
      Size = 100
    end
  end
  object tblVehiculos: TADOTable
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'Vehiculos'
    Left = 88
    Top = 144
    object tblVehiculosVehiculoID: TAutoIncField
      FieldName = 'VehiculoID'
      ReadOnly = True
    end
    object tblVehiculosModID: TIntegerField
      FieldName = 'ModID'
    end
    object tblVehiculosTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object tblVehiculosColor: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object tblVehiculosKM: TIntegerField
      FieldName = 'KM'
    end
    object tblVehiculosPropID: TIntegerField
      FieldName = 'PropID'
    end
    object tblVehiculosPrecio: TBCDField
      FieldName = 'Precio'
      Precision = 19
    end
  end
  object QListarVehiculos: TADOQuery
    Connection = Conexion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select VehiculoID [ID], ma.Nombre [Marca], m.nombre [Modelo], v.' +
        'Color [Color], v.Tipo [Tipo], v.KM [Kilometros], v.Precio [Valor' +
        '], p.Nombre+'#39' '#39'+p.Apellido [Propietario]'
      'from Vehiculos as v Inner Join modelos as m on (m.ModID=v.ModID)'
      #9#9'Inner Join Marcas as ma on (m.MarcaID=ma.MarcaID)'
      #9#9'Left Join Propietarios as p on (v.PropID=p.PropID)')
    Left = 192
    Top = 144
    object QListarVehiculosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QListarVehiculosMarca: TStringField
      FieldName = 'Marca'
      Size = 80
    end
    object QListarVehiculosModelo: TStringField
      FieldName = 'Modelo'
      Size = 150
    end
    object QListarVehiculosColor: TStringField
      FieldName = 'Color'
      Size = 50
    end
    object QListarVehiculosTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object QListarVehiculosKilometros: TIntegerField
      FieldName = 'Kilometros'
    end
    object QListarVehiculosValor: TBCDField
      FieldName = 'Valor'
      Precision = 19
    end
    object QListarVehiculosPropietario: TStringField
      FieldName = 'Propietario'
      ReadOnly = True
      Size = 101
    end
  end
  object spAgregarModelo: TADOStoredProc
    Connection = Conexion
    ProcedureName = 'Agregar_Modelo;1'
    Parameters = <>
    Left = 192
    Top = 216
  end
  object spAgregarMarcaModelo: TADOStoredProc
    Connection = Conexion
    ProcedureName = 'Agregar_MarcaModelo;1'
    Parameters = <>
    Left = 192
    Top = 280
  end
  object tblMarcas: TADOTable
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'Marcas'
    Left = 88
    Top = 280
  end
  object tblModelos: TADOTable
    Connection = Conexion
    CursorType = ctStatic
    TableName = 'Modelos'
    Left = 88
    Top = 216
  end
  object dsMarcas: TDataSource
    DataSet = tblMarcas
    Left = 24
    Top = 280
  end
  object dsModelos: TDataSource
    DataSet = tblModelos
    Left = 24
    Top = 216
  end
  object QListarModelos: TADOQuery
    Connection = Conexion
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select m.ModID [ID],  ma.Nombre [Marca], m.Nombre [Modelo]'
      
        'from Modelos as m Inner Join Marcas as ma on (m.MarcaID=ma.Marca' +
        'ID)'
      'order by m.ModID')
    Left = 88
    Top = 344
    object QListarModelosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QListarModelosMarca: TStringField
      FieldName = 'Marca'
      Size = 80
    end
    object QListarModelosModelo: TStringField
      FieldName = 'Modelo'
      Size = 150
    end
  end
  object dsListarModelos: TDataSource
    DataSet = QListarModelos
    Left = 24
    Top = 344
  end
  object spBorrarMarcaMod: TADOStoredProc
    Connection = Conexion
    ProcedureName = 'Borrar_Modelo;1'
    Parameters = <>
    Left = 304
    Top = 216
  end
  object spNombreToIDMarca: TADOStoredProc
    Connection = Conexion
    ProcedureName = 'Nombre_To_IDMarca;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@_Nombre'
        Attributes = [paNullable]
        DataType = ftString
        Size = 80
        Value = Null
      end
      item
        Name = '@_MarcaID'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 304
    Top = 344
  end
end

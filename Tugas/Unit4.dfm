object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 222
  Top = 125
  Height = 236
  Width = 361
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'D:\Documents\Documents\College\Lainnya\Pemrograman Visual\Pemrog' +
      'raman Visual 2\Tugas\libmysql.dll'
    Left = 72
    Top = 32
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'SELECT * FROM kategori')
    Params = <>
    Left = 128
    Top = 32
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 184
    Top = 32
  end
end

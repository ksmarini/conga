object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 353
  Width = 527
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Fontes\conga\DB\banco.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
end

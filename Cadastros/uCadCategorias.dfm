inherited frmCadCategorias: TfrmCadCategorias
  Caption = 'Cadastro de Categorias'
  ClientHeight = 447
  ClientWidth = 820
  ExplicitWidth = 826
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 396
    Width = 820
    ExplicitTop = 396
    ExplicitWidth = 820
    inherited btnFechar: TButton
      Left = 740
      ExplicitLeft = 740
    end
    inherited dbnNavegador: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 820
    Height = 396
    ActivePage = tabManutencao
    ExplicitWidth = 820
    ExplicitHeight = 396
    inherited tabListagem: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 812
      ExplicitHeight = 368
      inherited pnlListagem: TPanel
        Width = 812
        ExplicitWidth = 812
      end
      inherited grdListagem: TDBGrid
        Width = 812
        Height = 295
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 658
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 812
      ExplicitHeight = 368
      object edtID: TLabeledEdit
        Tag = 2
        Left = 11
        Top = 38
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 88
        Width = 510
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 50
        TabOrder = 1
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT * FROM Categorias (NOLOCK)')
    Left = 684
    Top = 40
    object qryListagemID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 50
    end
  end
  inherited dtsListagem: TDataSource
    Left = 752
    Top = 40
  end
end

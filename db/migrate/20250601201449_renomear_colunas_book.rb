class RenomearColunasBook < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :Titulo, :Title
    rename_column :books, :Autor, :Author
    rename_column :books, :Ano, :YearRelease
    rename_column :books, :Editora, :Publisher
    rename_column :books, :Quantidade, :Amount
  end
end

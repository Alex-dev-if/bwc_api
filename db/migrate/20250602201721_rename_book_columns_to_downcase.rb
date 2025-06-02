class RenameBookColumnsToDowncase < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :Title, :title
    rename_column :books, :Author, :author
    rename_column :books, :YearRelease, :year_release
    rename_column :books, :Publisher, :publisher
    rename_column :books, :Amount, :amount
  end
end

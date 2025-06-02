class RenameBookColumnIsbn < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :ISBN, :isbn
  end
end

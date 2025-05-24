class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :Titulo
      t.string :Autor
      t.integer :Ano
      t.string :Editora
      t.string :ISBN
      t.integer :Quantidade

      t.timestamps
    end
  end
end

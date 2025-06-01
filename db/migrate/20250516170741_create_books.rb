class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :Title
      t.string :Author
      t.integer :YearRelease
      t.string :Publisher
      t.string :ISBN
      t.integer :Amount

      t.timestamps
    end
  end
end

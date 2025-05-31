class CreateTableCopies < ActiveRecord::Migration[7.1]
  def change
    create_table :copies do |t|
      t.string :code
      t.string :status

      t.timestamps
    end

    add_reference :copies, :book, foreign_key: true
  end
end

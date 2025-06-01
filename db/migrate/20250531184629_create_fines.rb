class CreateFines < ActiveRecord::Migration[7.1]
  def change
    create_table :fines do |t|
      t.integer :value
      t.string :status

      t.timestamps
    end

    add_reference :fines, :user, foreign_key: true, null: false
    add_reference :fines, :landing, foreign_key: true, null: false
  end
end

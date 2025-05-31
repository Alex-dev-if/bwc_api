class CreateTableLandings < ActiveRecord::Migration[7.1]
  def change
    create_table :landings do |t|
      t.date :landing_date
      t.date :return_date

      t.timestamps
    end

    add_reference :landings, :user, foreign_key: true
    add_reference :landings, :copy, foreign_key: true
  end
end

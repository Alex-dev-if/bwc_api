class AddStatusToLandings < ActiveRecord::Migration[7.1]
  def change
    add_column :landings, :status, :string, default: "pending"
  end
end

class ChangeDefaultCopyStatus < ActiveRecord::Migration[7.1]
  def change
    change_column_default :copies, :status, from: nil, to: "available"
  end
end

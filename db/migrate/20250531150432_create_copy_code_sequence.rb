class CreateCopyCodeSequence < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE SEQUENCE copy_code_int
      START WITH #{Copy.count+1}
      INCREMENT BY 1;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE copy_code_int;
    SQL
  end  
end

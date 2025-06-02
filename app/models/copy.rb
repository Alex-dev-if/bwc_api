class Copy < ApplicationRecord
  belongs_to :book
  
  after_create :set_copy_code

  def set_copy_code
    year = created_at.strftime("%Y")
    month = created_at.strftime("%m")
    day = created_at.strftime("%d")
    copies_count = ActiveRecord::Base.connection.execute("SELECT nextval('copy_code_int')")
                                    .first['nextval']
                                    .to_s
                                    .rjust(4, '0')

    self.code = "#{year}#{month}#{day}#{copies_count}"
    save
  end
end

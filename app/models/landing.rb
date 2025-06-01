class Landing < ApplicationRecord
  belongs_to :user
  belongs_to :copy
  
  validates :user, :copy, presence: true
  
  enum status: { active: 'active', finished: 'finished', returned: 'returned' }
end

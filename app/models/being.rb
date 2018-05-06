class Being < ActiveRecord::Base
  belongs_to :user
  has_many :parts
end

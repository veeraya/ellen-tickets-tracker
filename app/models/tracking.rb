class Tracking < ActiveRecord::Base
  attr_accessible :date
  has_and_belongs_to_many :users
end

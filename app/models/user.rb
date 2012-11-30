class User < ActiveRecord::Base
  attr_accessible :email, :track_all
  has_and_belongs_to_many :trackings
  validates :email, :presence => true


end

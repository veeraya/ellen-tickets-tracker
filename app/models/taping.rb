# == Schema Information
#
# Table name: tapings
#
#  id                  :integer          not null, primary key
#  taping_date         :datetime
#  ticket_status :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Taping < ActiveRecord::Base
  attr_accessible :taping_date, :ticket_status
  has_many :ticketStatusChanges, dependent: :destroy
  validates :taping_date, presence:true, uniqueness:true
end

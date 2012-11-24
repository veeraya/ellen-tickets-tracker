# == Schema Information
#
# Table name: tapings
#
#  id                  :integer          not null, primary key
#  taping_date         :datetime
#  ticket_availability :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Taping < ActiveRecord::Base
  attr_accessible :taping_date, :ticket_availability

  validates(:taping_date)
end

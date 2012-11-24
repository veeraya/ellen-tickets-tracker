class TicketStatusChange < ActiveRecord::Base
  attr_accessible :from_status, :to_status, :taping_id
  belongs_to :taping
end

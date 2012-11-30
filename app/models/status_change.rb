class StatusChange < ActiveRecord::Base
  attr_accessible :from_status, :to_status, :ticket_id
  belongs_to :ticket
end

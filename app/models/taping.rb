class Taping < ActiveRecord::Base
  attr_accessible :taping_date, :ticket_status
  has_many :ticketStatusChanges, dependent: :destroy
  validates :taping_date, presence:true, uniqueness:true
  before_save :store_old_status
  after_commit :check_status_change


  private
    def store_old_status
      if self.ticket_status_changed?
        @old_status = ticket_status_change[0]
      else
        @old_status = self.ticket_status
      end
    end

    def check_status_change
      if self.ticket_status != @old_status
        self.ticketStatusChanges.create(from_status: @old_status, to_status: self.ticket_status)
      end
    end

end
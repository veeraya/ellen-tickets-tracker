class Ticket < ActiveRecord::Base
  attr_accessible :date, :status
  has_many :ticketStatusChanges, dependent: :destroy
  validates :date, presence:true, uniqueness:true
  before_save :store_old_status
  after_commit :check_status_change

  def test
    puts Date.today()
  end

  private
    def store_old_status
      if self.status_changed?
        @old_status = status_change[0]
      else
        @old_status = self.status
      end
    end

    def check_status_change
      if self.status != @old_status
        self.ticketStatusChanges.create(from_status: @old_status, to_status: self.status)
      end
    end

end
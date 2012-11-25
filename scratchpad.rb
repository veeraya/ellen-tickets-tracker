t = Taping.create(taping_date: Date.today, ticket_status: "available")
t = Taping.create(taping_date: "2012-11-25", ticket_status: "not available")

t.ticketStatusChanges.create()


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

class CreateTapings < ActiveRecord::Migration
  def change
    create_table :tapings do |t|
      t.date :taping_date
      t.string :ticket_status
      t.int :taping_id

      t.timestamps
    end
  end
end

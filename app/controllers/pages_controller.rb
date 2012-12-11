class PagesController < ApplicationController
  def index
    @avail_num = Ticket.where(:status => "tickets-available").length
    if @avail_num == 0
      last_avail = StatusChange.where("to_status = 'fully-booked' AND from_status = 'tickets-available'").order("created_at DESC").first.created_at
      last_avail = (DateTime.now - last_avail.to_datetime).to_f
      @last_avail_day_ago, last_avail = last_avail.divmod(1)
      @last_avail_hr_ago = (last_avail * 24).to_i
    end



  end
end

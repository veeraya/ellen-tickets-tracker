class PagesController < ApplicationController
  def index
    @avail_num = Ticket.where(:status => "tickets-available").length
    if @avail_num == 0
      last_avail = StatusChange.where("to_status = 'fully-booked' AND from_status = 'tickets-available'").order("created_at DESC").first.created_at
      last_avail = (DateTime.now - last_avail.to_datetime).to_f
      @last_avail_day_ago, last_avail = last_avail.divmod(1)
      @last_avail_hr_ago = (last_avail * 24).to_i
    end

    total_avail_day = 0
    from_avail = StatusChange.where("from_status = 'tickets-available'")
    from_avail.each do |avail_end|
      tic = avail_end.ticket  
      avail_start = tic.statusChanges.where("to_status = 'tickets-available' AND created_at < \'#{avail_end.created_at.to_date}\'").order("created_at DESC").first
      total_avail_day += avail_end.created_at.to_datetime - avail_start.created_at.to_datetime
    end
    @avg_avail_day, @avg_avail_hr = (total_avail_day/from_avail.length).divmod(1)
    @avg_avail_hr = (@avg_avail_hr*24).to_i


  end
end

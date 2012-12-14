class PagesController < ApplicationController
  def index
    @user = User.new
    
    @avail_num = Ticket.where(:status => "tickets-available").length
    if @avail_num == 0
      last_avail = StatusChange.where("to_status = 'fully-booked' AND from_status = 'tickets-available'").order("created_at DESC").first.created_at
      last_avail = (DateTime.now - last_avail.to_datetime).to_f
      @last_avail_day_ago, last_avail = last_avail.divmod(1)
      @last_avail_hr_ago = (last_avail * 24).to_i
    end

    total_avail_day = 0
    total_avail_weekday = 0
    from_avail = StatusChange.where("from_status = 'tickets-available'")
    from_avail.each do |avail_end|
      tic = avail_end.ticket  
      avail_start = tic.statusChanges.where("to_status = 'tickets-available' AND created_at < \'#{avail_end.created_at.to_date}\'").order("created_at DESC").first
      avail_day = avail_end.created_at.to_datetime - avail_start.created_at.to_datetime
      total_avail_day += avail_day

      if (avail_day > 7.0)
        total_avail_weekday += avail_day - (2 * (avail_day/7).to_i)
      elsif (avail_end.created_at.to_datetime.new_offset(-8.0/24).wday < avail_start.created_at.new_offset(-8.0/24).to_datetime.wday)
        total_avail_weekday += avail_day - 2
      end
    end

    @avg_avail_day, @avg_avail_hr = (total_avail_day/from_avail.length).divmod(1)
    @avg_avail_hr = (@avg_avail_hr*24).to_i 

    @avg_avail_weekday = '%.2f' % (total_avail_weekday/from_avail.length)

  end

end

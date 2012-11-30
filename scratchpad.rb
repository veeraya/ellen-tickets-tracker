t = Ticket.create(date: Date.today, status: "available")
t = Ticket.create(date: "2012-11-25", status: "not available")

t.ticketStatusChanges.create()

User.first.trackings.exists?(Tracking.first)

# search for user who wants everything first.

# now we have list of date changed
# check for all users with track_all = true and push  them in (User.find_by_track_all(true))
# get tracking with the same date as user date
# do @tracking.users to get an array of user. push them in and send email

User.first.trackings.where(:date => Date.today)

Account.all(:conditions => { :id => [1, 2] })

# stefan must be proud!
SELECT DISTINCT u.email 
FROM trackings t, users u, trackings_users tu
WHERE t.id = tu.tracking_id 
AND u.id = tu.user_id 
AND (t.date = '2012-12-01' OR t.date = '2012-12-10')

query = "SELECT DISTINCT u.email FROM trackings t, users u, trackings_users tu WHERE t.id = tu.tracking_id AND u.id = tu.user_id AND (t.date = '2012-12-01' OR t.date = '2012-12-10')"
result = ActiveRecord::Base.connection.execute(query)
result.each do |r|
  puts r["email"]
end

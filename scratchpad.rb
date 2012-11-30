t = Ticket.create(date: Date.today, status: "available")
t = Ticket.create(date: "2012-11-25", status: "not available")

# Populating test user database in heroku
u1 = User.create(email: "veeraya.pupat@gmail.com", track_all: true)
u2 = User.create(email: "veeraya.pupat+181920@gmail.com", track_all: false)
u3 = User.create(email: "veeraya.pupat+27@gmail.com", track_all:false)

t1 = Tracking.create(date: '2012-12-18')
t2 = Tracking.create(date: '2012-12-19')
t3 =Tracking.create(date: '2012-12-20')
t4 =Tracking.create(date: '2012-12-21')
t5 =Tracking.create(date: '2012-12-27')

u1.trackings.push(t1)
u1.trackings.push(t2)
u1.trackings.push(t3)
u2.trackings.push(t5)
# end of test database code


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



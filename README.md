The Ellen Degeneres Show Ticket Checker/Notifier
=========
*Because tickets run out really fast and I'm a HUGE Ellen fan.*

It's *almost* done  but not there yet.

###What it does:

- Check http://www.ellentv.com/tickets every 10 minutes for changes in ticket status (Heroku Scheduler runs the rake task.)
- Email users when there's a change in ticket status
- Store the list of changes in database for the purpose of visualization in the (near) future.
- Show statistics on ticket availability
- Users can choose which taping date to track

####Live version: [http://www.ellentickettracker.com](http://www.ellentickettracker.com)

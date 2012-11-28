The Ellen Degeneres Show Ticket Checker/Notifier
=========
*Because tickets run out really fast and I'm a HUGE Ellen fan.*

Currently in its bare-bone stage.

###What it does:

- Check http://www.ellentv.com/tickets every 10 minutes for changes in ticket status (Heroku Scheduler runs the rake task.)
- Email me every time there's a change in ticket status
- Store the list of changes in database for the purpose of visualization in the (near) future.

###Features wishlist

- Choose which ticket dates to subscribe to
- Allow other people to use this app to subscribe to the notification as well.
- Basic crud for all the model
- A nice front page :)

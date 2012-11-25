t = Taping.create(taping_date: Date.today, ticket_status: "available")
t = Taping.create(taping_date: DateTime.now, ticket_status: "not available")

t.ticketStatusChanges.create()
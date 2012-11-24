t = Taping.create(taping_date: DateTime.now, ticket_status: "available")
t = Taping.create(taping_date: DateTime.now, ticket_status: "not available")

t.ticketStatusChanges.create()
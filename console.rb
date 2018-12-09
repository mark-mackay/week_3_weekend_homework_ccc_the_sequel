require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new('name' => 'Jim', 'funds' => 50)
customer2 = Customer.new('name' => 'Rob', 'funds' => 20)
customer3 = Customer.new('name' => 'Charley', 'funds' => 3)
customer4 = Customer.new('name' => 'Steve', 'funds' => 10)
customer5 = Customer.new('name' => 'Morgan', 'funds' => 100)
customer6 = Customer.new('name' => 'Sharon', 'funds' => 45)
customer7 = Customer.new('name' => 'Barbera', 'funds' => 7)
customer8 = Customer.new('name' => 'Goldie', 'funds' => 19)
customer9 = Customer.new('name' => 'Robert', 'funds' => 34)
customer10 = Customer.new('name' => 'Ben', 'funds' => 1)

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()
customer7.save()
customer8.save()
customer9.save()


film1 = Film.new('title' => 'The Jerk', 'price' => 5, 'ticket_limit' => 10, 'tickets_sold' => 5, 'film_time' => '11:00')
film2 = Film.new('title' => 'Cape Fear', 'price' => 4,'ticket_limit' => 20, 'tickets_sold' => 5, 'film_time' => '12:00')
film3 = Film.new('title' => 'The Mask', 'price' => 5, 'ticket_limit' => 3, 'tickets_sold' => 2, 'film_time' => '13:00')
film4 = Film.new('title' => 'Bad Company', 'price' => 7, 'ticket_limit' => 5, 'tickets_sold' => 5, 'film_time' => '14:00')
film5 = Film.new('title' => 'Dumb & Dumber', 'price' => 5, 'ticket_limit' => 10, 'tickets_sold' => 5, 'film_time' => '15:00')
film5 = Film.new('title' => 'Ace Ventura - Pet Detective', 'price' => 5, 'ticket_limit' => 7, 'tickets_sold' => 5, 'film_time' => '16:00')
film6 = Film.new('title' => 'The man with two brains', 'price' => 5, 'ticket_limit' => 9, 'tickets_sold' => 5, 'film_time' => '19:00')
film7 = Film.new('title' => 'Meet the parents', 'price' => 5, 'ticket_limit' => 15, 'tickets_sold' => 14, 'film_time' => '21:00')

film1.save()
film2.save()
film3.save()
film4.save()
film5.save()
film6.save()
film7.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film7.id})
ticket3 = Ticket.new({'customer_id' => customer9.id, 'film_id' => film7.id})
ticket4 = Ticket.new({'customer_id' => customer7.id, 'film_id' => film7.id})
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film5.id})
ticket6 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id})
ticket7 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film4.id})
ticket8 = Ticket.new({'customer_id' => customer9.id, 'film_id' => film2.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()
ticket7.save()
ticket8.save()

binding.pry

nil

require('pg')
require_relative('../db/sql_runner')
require_relative('customer')
require_relative('ticket')

class Film

  attr_reader :id
  attr_accessor :title, :price, :ticket_limit

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
    @ticket_limit = options['ticket_limit']

  end

  def save()
    sql = "INSERT INTO films (title, price, ticket_limit) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @price, @ticket_limit]
    film_hash = SqlRunner.run( sql, values ).first
    @id = film_hash['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id
    = $1;"
    values = [@id]
    customers_hash = SqlRunner.run(sql, values)
    return customers_hash.map {|customer| Customer.new(customer)}
  end
  def ticket()
    sql = "SELECT * FROM tickets WHERE tickets.film_id = $1;"
    values = [@id]
    films_hash = SqlRunner.run(sql, values)
    return films_hash.map {|ticket| Ticket.new(ticket)}
  end


end

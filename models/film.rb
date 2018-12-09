require('pg')
require_relative('../db/sql_runner')
require_relative('customer')
require_relative('ticket')

class Film

  attr_reader :id
  attr_accessor :title, :price, :ticket_limit, :tickets_sold, :film_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @ticket_limit = options['ticket_limit'].to_i
    @tickets_sold = options['tickets_sold'].to_i
    @film_time = options['film_time']
  end

  def save()
    sql = "INSERT INTO films (title, price, ticket_limit, tickets_sold, film_time) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@title, @price, @ticket_limit, @tickets_sold, @film_time]
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
  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  def update()
    sql = "UPDATE films SET (title, price, ticket_limit, tickets_sold, film_time) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@title, @price, @ticket_limit, @tickets_sold, @film_time, @id]
    SqlRunner.run(sql, values)
  end
  def self.find(id)
      sql = "SELECT * FROM films
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      film_hash = results.first
      film = Film.new(film_hash)
      return film
  end
  def self.popular
    films = Film.all()
    pops = films[0]
    films.each do |film|
      if film.tickets_sold > pops.tickets_sold
        pops = film
      end
    end
    return pops
  end

end

require('pg')
require_relative('../db/sql_runner')
require_relative('film')
require_relative('ticket')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer_hash = SqlRunner.run( sql, values ).first
    @id = customer_hash['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers_hash = SqlRunner.run(sql, values)
    result = customers_hash.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end
  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id
    = $1;"
    values = [@id]
    films_hash = SqlRunner.run(sql, values)
    return films_hash.map {|film| Film.new(film)}
  end

  def ticket()
    sql = "SELECT * FROM tickets WHERE tickets.customer_id = $1;"
    values = [@id]
    tickets_hash = SqlRunner.run(sql, values)
    return tickets_hash.map {|ticket| Ticket.new(ticket)}
  end
  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end
  def self.find(id)
      sql = "SELECT * FROM customers
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      customer_hash = results.first
      customer = Customer.new(customer_hash)
      return customer
  end
  def buy_ticket(film_id)
    film = Film.find(film_id)
    if film.price.to_i <= @funds && film.tickets_sold < film.ticket_limit.to_i
      @funds -= film.price.to_i
      update()
      film.tickets_sold += 1
      film.update
      return Ticket.new('customer_id' => @id, 'film_id' => film_id)
    else
      return nil 
    end
  end
end

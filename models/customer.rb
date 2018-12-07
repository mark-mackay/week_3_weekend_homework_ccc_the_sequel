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



end

require('pg')
require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')

class Ticket
    attr_reader :id
    attr_accessor :customer_id, :film_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end
  
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    tickets_hash = SqlRunner.run( sql, values ).first
    @id = tickets_hash['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []
    castings = SqlRunner.run(sql, values)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end




end

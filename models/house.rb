require('pg')
require_relative('../db/sql_runner')

class House

attr_accessor :name, :logo
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save ()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM houses"
    results = SqlRunner.run(sql)
    return results.map{|result|House.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return House.new(results[0])
  end


end

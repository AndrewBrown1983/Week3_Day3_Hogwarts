require('pg')
require_relative("../db/sql_runner")


class Student

  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save ()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values =[@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM students"
    results = SqlRunner.run(sql)
    return results.map{|result|Student.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Student.new(results[0])
  end

  def house
    sql = "SELECT * FROM houses where id = $1"
    values = [@house_id]
    results = SqlRunner.run(sql, values)
    return House.new(results[0])
  end

end

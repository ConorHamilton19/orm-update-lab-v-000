require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, :grade

  def initialize(id = nil, name, grade)
    @name = name 
    @grade = grade
    @id = id 
  end 
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade TEXT
    )
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
  
    DB[:conn].execute(sql)
  end 
  
  def save
     sql = <<-SQL
    INSERT INTO students(name, grade)
    VALUES (?,?)
    SQL
    
    DB[:conn].execute(sql, name, grade)
  end 
end

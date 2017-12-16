class Student

  attr_accessor :grade, :name
  attr_reader :id

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute(
      <<-SQL
          create table if not exists students (
            id INTEGER PRIMARY KEY,
            name text,
            grade text
          )
      SQL
    )
  end

  def self.drop_table
    DB[:conn].execute(
      <<-SQL
        drop table if exists students
      SQL
    )
  end

  def save
    DB[:conn].execute(
      <<-SQL
        drop table if exists students
      SQL
    )
  end

end

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
    id = db.execute("select max(id) from pokemon")[0]
    id = id.nil? ? id + 1 : 1
    DB[:conn].prepare("insert into students (id, name, grade) values (?, ?, ?)", [id, @name, @grade])
  end

end

class Student

  attr_accessor :grade, :name
  attr_reader :id

  def self.create_table
    DB[:conn].execute(
      <<-SQL
          create table if not exists students (
            id INTEGER PRIMARY KEY,
            name text,
            grade int
          )
      SQL
    )
  end

end

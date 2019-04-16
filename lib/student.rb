class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name, :grade

  def initialize(name, grade, id = null)
    self.name = name
    self.grade = grade
    self.id = id
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?,?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
  end

  def create(name, grade)
    song = Song.new(name, grade)
    song.save
    song
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      );
    SQL

    DB[:conn].execute(sql)
  end


end

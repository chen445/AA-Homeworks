require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    rows = PlayDBConnection.instance.execute(<<-SQL,title)
    SELECT
      *
    FROM
      plays
    WHERE
      title = ?
    SQL
    raise "{title} not in database" if rows.count == 0
    return Play.new(rows[0])
  end 

  def self.find_by_playwright(name)
    rows = PlayDBConnection.instance.execute(<<-SQL,name)
      SELECT
        plays.id, plays.title, plays.year, plays.playwright_id
      FROM 
        plays
      JOIN
        playwrights ON plays.playwright_id = playwrights.id
      WHERE
        name = ?
      SQL
      rows.map{|el| Play.new(el)}
  end
end

class  Playwright
  attr_accessor :name , :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwright")
    data.map { |datum| Playwright.new(datum) }
  end
  
  def self.find_by_name(name)
    rows = PlayDBConnection.instance.execute(<<-SQL,name)
    SELECT
      *
    FROM
      playwright
    WHERE
      name = ?
    SQL
    raise "{name} not in database" if rows.count == 0
    return Playwright.new(rows[0])
  end
  
  def initialize(options)
     @id = options['id']
     @name = options['name']
     @birth_year=options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwright (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwright
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end 
  
  def get_plays
    rows = PlayDBConnection.instance.execute(<<-SQL,self.id)
      SELECT
        plays.id, plays.title, plays.year, plays.playwright_id
      FROM 
        plays
      WHERE
        playwright_id =?
      SQL
      rows.map{|el| Playwright.new(el)}
  end
end

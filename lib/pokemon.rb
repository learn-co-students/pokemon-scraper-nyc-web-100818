class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
    @hp = 60
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    result = database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    new_poke = {id: result[0], name: result[1], type: result[2]}
    Pokemon.new(new_poke)
  end

  def alter_hp(hp_new, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp_new, self.id)
  end

end

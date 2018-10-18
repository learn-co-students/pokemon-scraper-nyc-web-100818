class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    # SELECT *
    # FROM pokemon
    # WHERE pokemon.id = ?
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

end

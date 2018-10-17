class Pokemon

  attr_accessor :id, :name, :type, :db

  ALL = [];

  def initialize(pokemon={})
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(pokemon_id, database_connection)
    new_pokemon = {}
    new_pokemon[:id] = (database_connection.execute("SELECT id FROM pokemon WHERE id = #{pokemon_id};")).flatten[0]
    new_pokemon[:name] = (database_connection.execute("SELECT name FROM pokemon WHERE id = #{pokemon_id};")).flatten[0]
    new_pokemon[:type] = (database_connection.execute("SELECT type FROM pokemon WHERE id = #{pokemon_id};")).flatten[0]

    Pokemon.new(new_pokemon)
  end
end
# is initialized with keyword arguments of id, name, type and db (FAILED - 1)

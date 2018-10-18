require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(attributes)
      attributes.each {|key, value| self.send(("#{key}="), value)}
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save(name, type, database_connection)
      database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",
      name, type)
    end

    def self.find(id, database_connection)
      final = database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = id").flatten

      attributes = {id: final[0], name: final[1], type: final[2] }
      final = Pokemon.new(attributes)
      
      #binding.pry
    end

end

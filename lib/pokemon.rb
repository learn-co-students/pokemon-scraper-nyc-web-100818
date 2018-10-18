class Pokemon

    attr_accessor :id, :name, :type, :db

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
      database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = ?")
    end

end

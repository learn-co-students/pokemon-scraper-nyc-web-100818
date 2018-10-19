
require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db


  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: results[0], name: results[1], type: results[2], db: db)
  end



end

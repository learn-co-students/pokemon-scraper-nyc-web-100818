require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(params = {})
    params.each{|key,value|
      self.send(("#{key}="), value)
    }
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE ID = ?", [id])
    # how to get SQLite select to return a hash?
    Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db, hp: row[0][3])
  end
end

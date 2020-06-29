class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db                
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
    end

    def self.find(id, db)
        sql =<<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        
        SQL
    
        data = db.execute(sql, id).flatten
        id, name, type = data
        Pokemon.new(id: id, name: name, type: type, db: db)
    end
end






# initialize requires keyword argumetns. 
# dont insert string interpolation into query. Sanitize(filter) to remove all dangerous characters from an input string before passing it to the SQL engine or parameterize aka parsed (prepared) statement = pre compiling SQL statements. so that you dont lose info
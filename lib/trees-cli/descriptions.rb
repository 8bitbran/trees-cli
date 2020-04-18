class TreesCLI::Descriptions

    @@all = [] # holds all descriptions

    def self.all # returns array of all descriptions objects
        @@all
    end
    
    def self.create_from_api(id, description)
       self.create(id, description)
    end 

    def self.create(id, description)
        new(id, description).save
    end 

    attr_reader :id, :text

    def initialize(id, description)
        @id = id
        @text = ["desc"]
    end

    def save 
        @@all << self 
    end 

end
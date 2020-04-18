class TreesCLI::Strains

    @@all = [] # holds all Strains

    def self.all # returns array of all Strains objects
        @@all
    end 
    
    def self.create_from_api(hash_of_strains) # uses create method for each Strain (hash)
        hash_of_strains.each do |strain, data| 
            name = strain.key
            data.each do |data_type, value|
                case data_type
                    when ["id"]
                        id = data_type 
                    when ["race"]
                        race = data_type
                    when ["flavors"]
                        flavors = data_type
                    when ["effects"]
                        effects = data_type
                    when ["medical"]
                        medical = data_type
                end 
            end 
            self.create(name, id, race, flavors, effects, medical)
            puts "Received #{name} strain"
        end 
    end 

    def self.create(name, id, race, flavors, effects, medical) # instantiates and saves Strains
        new(name, id, race, flavors, effects, medical).save
    end 

    attr_reader :name, :id, :race, :flavors, :effects, :medical

    def initialize(name, id, race, flavors, effects, medical)
        @name = name
        @id = id
        @race = race 
        @flavors = flavors
        @effects = effects
        @medical = medical 
    end 

    def description 
        TreesCLI::Descriptions.all.find{|description| description.id == self.id}.text
    end 

    def save 
        @@all << self
    end 

end
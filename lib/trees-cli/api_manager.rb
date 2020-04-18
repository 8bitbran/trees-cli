class TreesCLI::APIManager

    # 'search/all' for all strains
    # 'data/desc/STRAIN_ID' for strain description
    BASE_URL = "strainapi.evanbusse.com/mXrx31U/strains/" 

    def self.get_strains
        response = HTTParty.get("#{BASE_URL}search/all")
        TreesCLI::Strains.create_from_hash(response)
    end 

    def self.get_descriptions
        id = 1
        until id > TreesCLI::Strains.all.length
            response = HTTParty.get("#{BASE_URL}data/desc/#{id}"
            TreesCLI::Descriptions.create_from_hash(response)
            id += 1
        end
    end

end
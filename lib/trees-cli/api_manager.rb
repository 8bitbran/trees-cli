class TreesCLI::APIManager

    # 'search/all' for all strains
    # 'data/desc/STRAIN_ID' for strain description
    BASE_URL = "strainapi.evanbusse.com/mXrx31U/strains/" 

    def self.get_strains
        response = HTTParty.get("#{BASE_URL}search/all")
        TreesCLI::Strains.create_from_api(response)
    end 

    def self.get_descriptions
        TreesCLI::Strains.each do |strain|
            id = strain.id
            response = HTTParty.get("#{BASE_URL}data/desc/#{strain.id}"
            TreeCLI::Descriptions.create_from_api(id, response)
        end
    end

end
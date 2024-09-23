class ArtistsService
  def get_all_artists
    begin
    response = HTTP.get("https://europe-west1-madesimplegroup-151616.cloudfunctions.net/artists-api-controller", headers: {
      "Authorization" => "Basic #{ENV['AUTH_TOKEN']}"
    })

    if response.status.success?
      parsed_response = JSON.parse(response.to_s)
      artists = parsed_response["json"].flatten
    else
      puts "Error: #{response.status} - #{response.to_s}"
    end
    rescue JSON::ParserError => e
    puts "Failed to parse JSON: #{e.message}"
    rescue HTTP::Error => e
    puts "HTTP Request failed: #{e.message}"
    rescue => e
    puts "An error occurred: #{e.message}"
    end
  end

  def get_artist_by_id(id)
    begin
    response = HTTP.get("https://europe-west1-madesimplegroup-151616.cloudfunctions.net/artists-api-controller?artist_id=#{id}", headers: {
      "Authorization" => "Basic #{ENV['AUTH_TOKEN']}"
    })

    if response.status.success?
      parsed_response = JSON.parse(response.to_s)
      artists = parsed_response["json"].flatten
    else
      puts "Error: #{response.status} - #{response.to_s}"
    end
    rescue JSON::ParserError => e
    puts "Failed to parse JSON: #{e.message}"
    rescue HTTP::Error => e
    puts "HTTP Request failed: #{e.message}"
    rescue => e
    puts "An error occurred: #{e.message}"
    end
  end
end
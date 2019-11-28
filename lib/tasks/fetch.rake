require 'open-uri'
require 'json'

namespace :fetch do
  desc "Seed from pandascore API"
  task pandascore: :environment do
    puts "fetching..."

    # limit call 1000/hour
    # limit page 100 results/page
    # sort by team not nill
    # call 100x
    # environ 5000 players
    # 100 players/page

    # CALL API
    # TODO store in dev
    token = 'xb1ElQtaYJXzFl91fvLgZws930XNBVVQ2IcOyZrAzaj052zREeM'
<<<<<<< HEAD
    limit = 100 #100
=======
    limit = 10
>>>>>>> cd3e5bf357fc260c57d4e009a28537d773c02d28
    min_page = 1
    max_page = 1 # 50
    # max_page = 50 # 50

    (min_page..max_page).each do |n|
      response = open("http://api.pandascore.co/lol/players?token=#{token}&per_page=#{limit}&page=#{n}&sort=team_id").read
      # response = open("http://api.pandascore.co/lol/players?token=#{token}&per_page=3&page=19").read
      # response = open("api.pandascore.co/lol/players?token=#{token}")

      data = JSON.parse response

      data.each do |player|
        next if player["current_team"].nil? || player["role"].nil? ||
          Player.where(lol_id: player["id"]).exists?

        new_player = Player.create!(
          first_name: player["first_name"],
          last_name: player["last_name"],
          lol_name: player["name"],
          lol_id: player["id"],
          country: player["hometown"],
          image_url: player["image_url"],
          # role_string: player["role"],
          pro_team_acronym: player["current_team"]["acronym"],
          pro_team_id: player["current_team"]["id"],
          pro_team_image_url: player["current_team"]["image_url"],
          pro_team_name: player["current_team"]["name"],
          current_videogame_name: player["current_videogame"]["name"]
        )

        role = role_api_to_app[player["role"]]
        new_player.send role
      end
    end

    # puts data

    # decommenter et remettre la bonne url de l'api
  end

  desc "Seed from toto API"
  task toto: :environment do
    puts "fetching..."
  end

  private

  def role_api_to_app
    {
      "top" => 'top!',
      "jun" => 'jungle!',
      "mid" => 'mid!',
      "adc" => 'adc!',
      "sup" => 'support!'
    }
  end
end

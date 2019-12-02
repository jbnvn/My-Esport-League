require 'open-uri'
require 'json'

namespace :pandascore do
  desc "Seed from pandascore API"
  task fetch_players: :environment do
    puts "checking token..."


    # PARAMS
    token = ENV['PandaScoreToken']
    limit = 50 #100 per page

    min_page = 1
    max_page = 1 # 50
    # max_page = 50 # 50

    puts "token verified..."
    puts "fetching..."

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

    puts "task completed !"
  end




  desc "Generate random dynamic stats for existing players"
  task random_stats: :environment do

    puts "generating random stats for players token..."

    Player.all.update(
      kda: rand(1.0...8.0),
      win_rate: rand(25.0...75.0),
      creep_score_per_minute: rand(8.0...12.0),
      kill_participation: rand(35.0...70.0),
      kill_share: rand(15.0...25.0),
      gold_share: rand(15.0...25.0),
      if player.role == "support"
        support_player_minimum_bid
      else
        players_minimum_bid
      end
    )

      def players_minimum_bid
        bid = (((((kda-AVERAGE_KDA)/AVERAGE_KDA)+1)*40%)+((((KS-AVERAGE_KS)/AVERAGE_KS)+1)*15%)+((((win_rate-AVERAGE_WINRATE)/AVERAGE_WINRATE)+1)*15%+((((creep_score_per_minute-AVERAGE_CSPM)/AVERAGE_CSPM)+1)*15%)+((((kill_participation-AVERAGE_KPART)/AVERAGE_KPART)+1)*15%))*STANDARD_VALUE
        minimum_bid: bid
      end

      def support_player_minimum_bid
        bid = (((((kda-AVERAGE_KDA)/AVERAGE_KDA)+1)*40%)+((((win_rate-AVERAGE_WINRATE)/AVERAGE_WINRATE)+1)*30%+((((kill_participation-AVERAGE_KPART)/AVERAGE_KPART)+1)*30%))*STANDARD_VALUE
        minimum_bid: bid
      end

    AVERAGE_KDA = 3,8
    AVERAGE_KS = 23%
    AVERAGE_WINRATE = 56%
    AVERAGE_CSPM = 7,85
    AVERAGE_KPART = 66%
    STANDARD_VALUE = 7000


    puts "task completed !"
  end

  desc "Import dynamic stats from pandascore API"
  task import_stats: :environment do
  end

  private

  def role_api_to_app
    {
      "top" => 'top!',
      "jun" => 'jun!',
      "mid" => 'mid!',
      "adc" => 'adc!',
      "sup" => 'sup!'
    }
  end
end

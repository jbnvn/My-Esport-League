require 'open-uri'
require 'json'

namespace :pandascore do
  desc "Seed from pandascore API"
  task fetch_players: :environment do
    puts "checking token..."


    # PARAMS
    token = ENV['PandaScoreToken']
    limit = 100 #100 per page

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
        next if player["current_team"].nil? || player["role"].nil? || player["image_url"].nil? ||
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

    AVERAGE_KDA = 3.8
    AVERAGE_KS = 0.23
    AVERAGE_WINRATE = 0.56
    AVERAGE_CSPM = 7.85
    AVERAGE_KPART = 0.66
    STANDARD_VALUE = 7000
    STANDARD_VALUE_SCORE = 7

    # Player.all.update(
    #   kda: rand(1.0...8.0),
    #   win_rate: rand(0.25...0.75),
    #   creep_score_per_minute: rand(8.0...12.0),
    #   kill_participation: rand(0.35...0.70),
    #   kill_share: rand(0.15...0.25),
    #   gold_share: rand(0.15...0.25)
    # )

    puts "generating minimum_bid..."
    puts "generating weekly score..."

    Player.all.each do |player|

      player.update(kda: rand(1.0...8.0))
      player.update(win_rate: rand(0.25...0.75))
      player.update(creep_score_per_minute: rand(8.0...12.0))
      player.update(kill_participation: rand(0.35...0.70))
      player.update(kill_share: rand(0.15...0.25))
      player.update(gold_share: rand(0.15...0.25))

      def players_minimum_bid(player)
        bid = (((((player.kda - AVERAGE_KDA) / AVERAGE_KDA) + 1) * 0.4) + ((((player.kill_share - AVERAGE_KS) / AVERAGE_KS) + 1) * 0.15) + ((((player.win_rate - AVERAGE_WINRATE) / AVERAGE_WINRATE) + 1) * 0.15) + ((((player.creep_score_per_minute - AVERAGE_CSPM) / AVERAGE_CSPM) + 1) * 0.15) + ((((player.kill_participation - AVERAGE_KPART) / AVERAGE_KPART) + 1) * 0.15)) * STANDARD_VALUE
        player.update(minimum_bid: bid)
      end

      def support_minimum_bid(player)
        bid = ((((player.kda - AVERAGE_KDA) / AVERAGE_KDA) + 1) * 0.4 + (((player.win_rate - AVERAGE_WINRATE) / AVERAGE_WINRATE) + 1) * 0.30 + (((kill_participation - AVERAGE_KPART) / AVERAGE_KPART) + 1) * 0.30) * STANDARD_VALUE
        player.update(minimum_bid: bid)
      end

      if player.role == 'support'
        support_minimum_bid(player)
      else
        players_minimum_bid(player)
      end


      def players_weekly_score(player)
      score = (((((player.kda - AVERAGE_KDA) / AVERAGE_KDA) + 1) * 0.4) + ((((player.kill_share - AVERAGE_KS) / AVERAGE_KS) + 1) * 0.15) + ((((player.win_rate - AVERAGE_WINRATE) / AVERAGE_WINRATE) + 1) * 0.15) + ((((player.creep_score_per_minute - AVERAGE_CSPM) / AVERAGE_CSPM) + 1) * 0.15) + ((((player.kill_participation - AVERAGE_KPART) / AVERAGE_KPART) + 1) * 0.15)) * STANDARD_VALUE_SCORE
        player.update(weekly_score: score)
      end

      def support_weekly_score(player)
        score = ((((player.kda - AVERAGE_KDA) / AVERAGE_KDA) + 1) * 0.4 + (((player.win_rate - AVERAGE_WINRATE) / AVERAGE_WINRATE) + 1) * 0.30 + (((kill_participation - AVERAGE_KPART) / AVERAGE_KPART) + 1) * 0.30) * STANDARD_VALUE_SCORE
        player.update(weekly_score: score)
      end

      if player.role == 'support'
        support_weekly_score(player)
      else
        players_weekly_score(player)
      end
    end

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

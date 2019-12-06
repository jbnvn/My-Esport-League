# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
League.destroy_all
Participation.destroy_all
Team.destroy_all
Bid.destroy_all

User.create!(email: "JulienB@gmail.com", password: "azerty", username: "Julien")
User.create!(email: "CorentinC@gmail.com", password: "azerty", username: "Coco")
User.create!(email: "KarimA@gmail.com", password: "azerty", username: "Karim")
User.create!(email: "RadomirZ@gmail.com", password: "azerty", username: "Rado")
User.create!(email: "UserA@gmail.com", password: "azerty", username: "Roberto")
User.create!(email: "UserB@gmail.com", password: "azerty", username: "Dude")

League.create!(name: "Le Wagon" , user_id: User.first.id)

Participation.create!(user_id: User.second.id, league_id: League.first.id)
Participation.create!(user_id: User.third.id, league_id: League.first.id)
Participation.create!(user_id: User.fourth.id, league_id: League.first.id)
Participation.create!(user_id: User.fifth.id, league_id: League.first.id)
Participation.create!(user_id: User.last.id, league_id: League.first.id)

team_image1 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/poro.png')
team_image2 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/starguardian.png')
team_image3 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/garensword.png')
team_image4 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/flamechomper.png')
team_image5 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/helmetbro.png')
team_image6 = URI.open(File.dirname(__FILE__) + '/../app/assets/images/minions.png')


team_1 = Team.create!(name: "Romain", league_id: League.first.id, user_id: User.first.id, victory_count: "2", draw_count: "0", defeat_count: "2")
team_2 = Team.create!(name: "Coco", league_id: League.first.id, user_id: User.second.id, victory_count: "1", draw_count: "0", defeat_count: "3")
team_3 = Team.create!(name: "Karim", league_id: League.first.id, user_id: User.third.id, victory_count: "3", draw_count: "0", defeat_count: "1")
team_4 = Team.create!(name: "Rado", league_id: League.first.id, user_id: User.fourth.id, victory_count: "2", draw_count: "1", defeat_count: "1")
team_5 = Team.create!(name: "Capucine", league_id: League.first.id, user_id: User.fifth.id, victory_count: "1", draw_count: "1", defeat_count: "2")
team_6 = Team.create!(name: "Thomas", league_id: League.first.id, user_id: User.last.id, victory_count: "2", draw_count: "0", defeat_count: "2")

team_1.photo.attach(io: team_image1, filename: 'team_avatar.png', content_type: 'image/png')
team_2.photo.attach(io: team_image2, filename: 'team_avatar.png', content_type: 'image/png')
team_3.photo.attach(io: team_image3, filename: 'team_avatar.png', content_type: 'image/png')
team_4.photo.attach(io: team_image4, filename: 'team_avatar.png', content_type: 'image/png')
team_5.photo.attach(io: team_image5, filename: 'team_avatar.png', content_type: 'image/png')
team_6.photo.attach(io: team_image6, filename: 'team_avatar.png', content_type: 'image/png')

team_1.save!
team_2.save!
team_3.save!
team_4.save!
team_5.save!
team_6.save!


Bid.create!(status: "succeeded", points: 10, player_id: Player.where(role: "top").first.id, team_id: Team.first.id)
Bid.create!(status: "succeeded", points: 11, player_id: Player.where(role: "jun").first.id, team_id: Team.first.id)
Bid.create!(status: "succeeded", points: 12, player_id: Player.where(role: "mid").first.id, team_id: Team.first.id)
Bid.create!(status: "succeeded", points: 13, player_id: Player.where(role: "adc").first.id, team_id: Team.first.id)
Bid.create!(status: "succeeded", points: 14, player_id: Player.where(role: "sup").first.id, team_id: Team.first.id)
Bid.create!(status: "succeeded", points: 15, player_id: 70, team_id: Team.first.id)

Bid.create!(status: "succeeded", points: 18, player_id: Player.where(role: "top").second.id, team_id: Team.second.id)
Bid.create!(status: "succeeded", points: 101, player_id: Player.where(role: "jun").second.id, team_id: Team.second.id)
Bid.create!(status: "succeeded", points: 104, player_id: Player.where(role: "mid").second.id, team_id: Team.second.id)
Bid.create!(status: "succeeded", points: 150, player_id: Player.where(role: "adc").second.id, team_id: Team.second.id)
Bid.create!(status: "succeeded", points: 170, player_id: Player.where(role: "sup").second.id, team_id: Team.second.id)
Bid.create!(status: "succeeded", points: 310, player_id: 71, team_id: Team.second.id)

Bid.create!(status: "succeeded", points: 190, player_id: Player.where(role: "top").third.id, team_id: Team.third.id)
Bid.create!(status: "succeeded", points: 100, player_id: Player.where(role: "jun").third.id, team_id: Team.third.id)
Bid.create!(status: "succeeded", points: 110, player_id: Player.where(role: "mid").third.id, team_id: Team.third.id)
Bid.create!(status: "succeeded", points: 210, player_id: Player.where(role: "adc").third.id, team_id: Team.third.id)
Bid.create!(status: "succeeded", points: 230, player_id: Player.where(role: "sup").third.id, team_id: Team.third.id)
Bid.create!(status: "succeeded", points: 109, player_id: 72, team_id: Team.third.id)

Bid.create!(status: "succeeded", points: 50, player_id: Player.where(role: "top").fourth.id, team_id: Team.fourth.id)
Bid.create!(status: "succeeded", points: 78, player_id: Player.where(role: "jun").fourth.id, team_id: Team.fourth.id)
Bid.create!(status: "succeeded", points: 34, player_id: Player.where(role: "mid").fourth.id, team_id: Team.fourth.id)
Bid.create!(status: "succeeded", points: 23, player_id: Player.where(role: "adc").fourth.id, team_id: Team.fourth.id)
Bid.create!(status: "succeeded", points: 38, player_id: Player.where(role: "sup").fourth.id, team_id: Team.fourth.id)
Bid.create!(status: "succeeded", points: 40, player_id: 73, team_id: Team.fourth.id)

Bid.create!(status: "succeeded", points: 119, player_id: Player.where(role: "top").fifth.id, team_id: Team.fifth.id)
Bid.create!(status: "succeeded", points: 89, player_id: Player.where(role: "jun").fifth.id, team_id: Team.fifth.id)
Bid.create!(status: "succeeded", points: 120, player_id: Player.where(role: "mid").fifth.id, team_id: Team.fifth.id)
Bid.create!(status: "succeeded", points: 10, player_id: Player.where(role: "adc").fifth.id, team_id: Team.fifth.id)
Bid.create!(status: "succeeded", points: 23, player_id: Player.where(role: "sup").fifth.id, team_id: Team.fifth.id)
Bid.create!(status: "succeeded", points: 36, player_id: 74, team_id: Team.fifth.id)

Bid.create!(status: "succeeded", points: 80, player_id: Player.where(role: "top").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 39, player_id: Player.where(role: "jun").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 87, player_id: Player.where(role: "mid").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 98, player_id: Player.where(role: "adc").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 38, player_id: Player.where(role: "sup").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 24, player_id: 75, team_id: Team.last.id)

WeeklyScore.create!(score: League.first.teams.first.players.map {|p| p.weekly_score}.sum, team_id: Team.first.id )
WeeklyScore.create!(score: League.first.teams.second.players.map {|p| p.weekly_score}.sum, team_id: Team.second.id )
WeeklyScore.create!(score: League.first.teams.third.players.map {|p| p.weekly_score}.sum, team_id: Team.third.id )
WeeklyScore.create!(score: League.first.teams.fourth.players.map {|p| p.weekly_score}.sum, team_id: Team.fourth.id )
WeeklyScore.create!(score: League.first.teams.fifth.players.map {|p| p.weekly_score}.sum, team_id: Team.fifth.id )
WeeklyScore.create!(score: League.first.teams.last.players.map {|p| p.weekly_score}.sum, team_id: Team.last.id )



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

User.create!(email: "JulienB@gmail.com", password: "azerty", username: "JulienB")
User.create!(email: "CorentinC@gmail.com", password: "azerty", username: "CorentinC")
User.create!(email: "KarimA@gmail.com", password: "azerty", username: "KarimA")
User.create!(email: "RadomirZ@gmail.com", password: "azerty", username: "RadomirZ")

League.create!(name: "Le Wagon" , user_id: User.first.id)

Participation.create!(user_id: User.second.id, league_id: League.first.id)
Participation.create!(user_id: User.third.id, league_id: League.first.id)
Participation.create!(user_id: User.last.id, league_id: League.first.id)

Team.create!(name: "Team J", league_id: League.first.id, user_id: User.first.id)
Team.create!(name: "Team C", league_id: League.first.id, user_id: User.second.id)
Team.create!(name: "Team K", league_id: League.first.id, user_id: User.third.id)
Team.create!(name: "Team R", league_id: League.first.id, user_id: User.last.id)

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

Bid.create!(status: "succeeded", points: 50, player_id: Player.where(role: "top").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 78, player_id: Player.where(role: "jun").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 34, player_id: Player.where(role: "mid").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 23, player_id: Player.where(role: "adc").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 38, player_id: Player.where(role: "sup").last.id, team_id: Team.last.id)
Bid.create!(status: "succeeded", points: 40, player_id: 73, team_id: Team.last.id)

WeeklyScore.create!(score: League.first.teams.first.players.map {|p| p.weekly_score}.sum, team_id: Team.first.id )
WeeklyScore.create!(score: League.first.teams.second.players.map {|p| p.weekly_score}.sum, team_id: Team.second.id )
WeeklyScore.create!(score: League.first.teams.third.players.map {|p| p.weekly_score}.sum, team_id: Team.third.id )
WeeklyScore.create!(score: League.first.teams.last.players.map {|p| p.weekly_score}.sum, team_id: Team.last.id )



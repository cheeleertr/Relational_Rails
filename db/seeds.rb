# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)
pokemon1 = Pokemon.create!(
  name: "Pikachu",
  pokemon_type: "Electric",
  level: 50,
  hit_points: 35,
  attack: 55,
  defense: 30,
  speed: 90,
  special: 50,
  trainer_id: 1,
  in_team: true,
)
pokemon2 = Pokemon.create!(
  name: "Charizard",
  pokemon_type: "Fire/Flying",
  level: 40,
  hit_points: 78,
  attack: 84,
  defense: 78,
  speed: 100,
  special: 85,
  trainer_id: 1,
  in_team: false,
)
pokemon3 = Pokemon.create!(
  name: "Psyduck",
  pokemon_type: "Water",
  level: 45,
  hit_points: 50,
  attack: 52,
  defense: 48,
  speed: 55,
  special: 51,
  trainer_id: 2,
  in_team: true,
)
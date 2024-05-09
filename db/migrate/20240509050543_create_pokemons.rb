class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.integer :level
      t.integer :hit_points
      t.integer :attack
      t.integer :defense
      t.integer :speed
      t.integer :special
      t.integer :trainer_id
      t.boolean :in_team

      t.timestamps
    end
  end
end

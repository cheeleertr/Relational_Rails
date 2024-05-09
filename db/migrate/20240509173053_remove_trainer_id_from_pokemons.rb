class RemoveTrainerIdFromPokemons < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :trainer_id, :integer
  end
end

class AddTrainersToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_reference :pokemons, :trainer, null: false, foreign_key: true
  end
end

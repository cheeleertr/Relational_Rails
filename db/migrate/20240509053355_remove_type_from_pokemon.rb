class RemoveTypeFromPokemon < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :type, :string
  end
end

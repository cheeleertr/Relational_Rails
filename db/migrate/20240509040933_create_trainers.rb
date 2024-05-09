class CreateTrainers < ActiveRecord::Migration[7.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :badges
      t.boolean :full_team_of_six

      t.timestamps
    end
  end
end

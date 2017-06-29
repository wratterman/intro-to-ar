class AddBreedIdToHorses < ActiveRecord::Migration[5.1]
  def change
    add_column :horses, :breed_id, :integer
  end
end

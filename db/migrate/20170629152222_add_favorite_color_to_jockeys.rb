class AddFavoriteColorToJockeys < ActiveRecord::Migration[5.1]
  def change
    add_column :jockeys, :favortie_color, :text
  end
end

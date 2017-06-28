class CreateJockey < ActiveRecord::Migration[5.1]
  def change
    create_table :jockeys do |t|
      t.text      :name
    end
  end
end

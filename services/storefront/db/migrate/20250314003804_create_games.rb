class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.datetime :release_date
      t.boolean :featured

      t.timestamps
    end
  end
end

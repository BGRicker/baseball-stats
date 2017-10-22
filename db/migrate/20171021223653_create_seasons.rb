class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :player_id
      t.integer :year
      t.string :league
      t.string :team_id
      t.integer :games
      t.integer :at_bats
      t.integer :runs
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :rbis
      t.integer :stolen_bases

      t.timestamps
    end
  end
end

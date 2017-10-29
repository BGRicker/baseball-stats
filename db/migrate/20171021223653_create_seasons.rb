class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :player_id
      t.integer :year
      t.string :league
      t.string :team_id
      t.integer :games, :default => 0
      t.integer :at_bats, :default => 0
      t.integer :runs, :default => 0
      t.integer :hits, :default => 0
      t.integer :doubles, :default => 0
      t.integer :triples, :default => 0
      t.integer :home_runs, :default => 0
      t.integer :rbis, :default => 0
      t.integer :stolen_bases, :default => 0

      t.timestamps
    end
  end
end

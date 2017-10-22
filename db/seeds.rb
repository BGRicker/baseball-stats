# run `bundle exec rake db:seed` to seed the player data from this CSV into your database

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'players.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  t = Player.new
  t.player_id = row['playerID']
  t.birth_year = row['birthYear']
  t.first_name = row['nameFirst']
  t.last_name = row['nameLast']
  t.save
  puts "#{t.player_id}, #{t.first_name} #{t.last_name} saved"
end

puts "There are now #{Player.count} rows in the player table"

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'batting.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  t = Season.new
  t.player_id = row['playerID']
  t.year = row['yearID']
  t.league = row['league']
  t.team_id = row['teamID']
  t.games = row['G']
  t.at_bats = row['AB']
  t.runs = row['nameLast']
  t.hits = row['nameLast']
  t.doubles = row['2B']
  t.triples = row['3B']
  t.home_runs = row['HR']
  t.rbis = row['RBI']
  t.stolen_bases = row['SB']
  t.save
  puts "#{t.player_id}, hit #{t.home_runs} dingers in #{t.year}, record stored"
end

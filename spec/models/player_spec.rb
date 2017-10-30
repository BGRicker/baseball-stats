require 'rails_helper'

RSpec.describe Player, type: :model do
  it "can create a valid player with all assigned attributes" do
    player = Player.new(player_id: "aaronha01", birth_year: 1934,
                        first_name: "Hank", last_name: "Aaron")
    expect(player).to be_valid
    expect(player.player_id).to eq("aaronha01")
    expect(player.birth_year).to eq(1934)
    expect(player.first_name).to eq("Hank")
    expect(player.last_name).to eq("Aaron")
    expect(player.full_name).to eq("Hank Aaron")
  end

  it "can have seasons" do
    player = Player.create(player_id: "powerke01", birth_year: 1974,
                           first_name: "Kenny", last_name: "Powers")
    season = Season.create(player_id: "powerke01", year: 2007, league: "AL",
                           team_id: "PIT", games: 60, at_bats: 10, runs: 3,
                           hits: 4, doubles: 2, triples: 1, home_runs: 1,
                           rbis: 7, stolen_bases: 1)
    season2 = Season.create(player_id: "powerke01", year: 2008, league: "AL",
                           team_id: "BOS", games: 120, at_bats: 100, runs: 30,
                           hits: 70, doubles: 19, triples: 5, home_runs: 30,
                           rbis: 50, stolen_bases: 40)
    expect(player.seasons).to eq([season,season2])
  end

  it "will know when a player has no seasons" do
    player = Player.create(player_id: "powerke01", birth_year: 1974,
                           first_name: "Kenny", last_name: "Powers")
    expect(player.has_seasons?).to eq(false)
  end

  it "will sum career statistics" do
    player = Player.create(player_id: "powerke01", birth_year: 1974,
                           first_name: "Kenny", last_name: "Powers")
    _season = Season.create(player_id: "powerke01", year: 2007, league: "AL",
                           team_id: "PIT", games: 60, at_bats: 10, runs: 3,
                           hits: 4, doubles: 2, triples: 1, home_runs: 1,
                           rbis: 7, stolen_bases: 1)
    _season2 = Season.create(player_id: "powerke01", year: 2008, league: "AL",
                           team_id: "BOS", games: 120, at_bats: 100, runs: 30,
                           hits: 70, doubles: 19, triples: 5, home_runs: 30,
                           rbis: 50, stolen_bases: 40)
    expect(player.career_stats("games")).to eq(180)
    expect(player.career_stats("at_bats")).to eq(110)
    expect(player.career_stats("home_runs")).to eq(31)
  end
end

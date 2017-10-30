require 'rails_helper'

RSpec.describe Season, type: :model do
  it "has all expected attributes" do
    player = Player.create(player_id: "powerke01", birth_year: 1974,
                           first_name: "Kenny", last_name: "Powers")
    season = Season.create(player_id: "powerke01", year: 2007, league: "AL",
                           team_id: "PIT", games: 60, at_bats: 10, runs: 3,
                           hits: 4, doubles: 2, triples: 1, home_runs: 1,
                           rbis: 7, stolen_bases: 1)
    expect(season).to be_valid
    expect(season.player_id).to eq(player.player_id)
    expect(season.year).to eq(2007)
    expect(season.league).to eq("AL")
    expect(season.team_id).to eq("PIT")
    expect(season.games).to eq(60)
    expect(season.at_bats).to eq(10)
    expect(season.runs).to eq(3)
    expect(season.hits).to eq(4)
    expect(season.doubles).to eq(2)
    expect(season.triples).to eq(1)
    expect(season.home_runs).to eq(1)
    expect(season.rbis).to eq(7)
    expect(season.stolen_bases).to eq(1)
  end

  it "can belong to a player" do
    player = Player.create(player_id: "powerke01", birth_year: 1974,
                           first_name: "Kenny", last_name: "Powers")
    season = Season.create(player_id: "powerke01", year: 2007, league: "AL",
                           team_id: "PIT", games: 60, at_bats: 10, runs: 3,
                           hits: 4, doubles: 2, triples: 1, home_runs: 1,
                           rbis: 7, stolen_bases: 1)
    expect(season.player).to eq(player)
  end

  it "gets the correct slugging percentage, singles, and batting average" do
    season = Season.create(player_id: "powerke01", year: 2007, league: "AL",
                           team_id: "PIT", games: 60, at_bats: 15, runs: 3,
                           hits: 5, doubles: 2, triples: 1, home_runs: 1,
                           rbis: 7, stolen_bases: 1)
    expect(season.singles).to eq(1)
    expect(season.slugging_percentage).to eq(0.8)
    expect(season.batting_average).to eq(0.333)
  end
end

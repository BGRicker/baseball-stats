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
  end
end

require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :player_id => "Player",
      :birth_year => 2,
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Player/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end

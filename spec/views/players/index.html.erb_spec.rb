require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :player_id => "Player",
        :birth_year => 2,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      Player.create!(
        :player_id => "Player",
        :birth_year => 2,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "Player".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end

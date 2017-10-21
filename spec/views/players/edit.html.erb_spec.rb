require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :player_id => "MyString",
      :birth_year => 1,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input[name=?]", "player[player_id]"

      assert_select "input[name=?]", "player[birth_year]"

      assert_select "input[name=?]", "player[first_name]"

      assert_select "input[name=?]", "player[last_name]"
    end
  end
end

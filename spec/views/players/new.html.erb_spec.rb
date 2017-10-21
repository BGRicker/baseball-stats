require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :player_id => "MyString",
      :birth_year => 1,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input[name=?]", "player[player_id]"

      assert_select "input[name=?]", "player[birth_year]"

      assert_select "input[name=?]", "player[first_name]"

      assert_select "input[name=?]", "player[last_name]"
    end
  end
end

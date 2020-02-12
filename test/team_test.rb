require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'

class TeamTest < Minitest::Test
  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_it_has_a_country
    assert_equal "France", @team.country
  end

  def test_team_isnt_eliminated_by_default
    assert_equal false, @team.eliminated?
  end

  def test_team_can_be_eliminate
    @team.eliminated = true
    assert_equal true, @team.eliminated?
  end

  def test_it_doesnt_have_players_by_default
    assert_equal [], @team.players
  end

  def test_it_can_add_players
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_it_has_players_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end
end

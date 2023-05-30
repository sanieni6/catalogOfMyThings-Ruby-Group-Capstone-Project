require_relative './item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super(Time.now)
    @multiplayer = multiplayer
    @last_played_at = Date._parse(last_played_at)
  end

  def can_be_archived?
    super() && older_than_two_years?
  end

  private

  def older_than_two_years?
    current = Time.now.year
    current - @last_played_at.year > 2
  end
end

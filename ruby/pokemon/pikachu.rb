# frozen_string_literal: true

class Pikachu < Pokemon
  def attack
    super
    puts "#{@name}の10まんボルト"
  end
end

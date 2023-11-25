# frozen_string_literal: true

class Pokemon
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}の攻撃"
  end

  def changeName(new_name)
    if new_name == 'aaa'
      puts '不適切な名前です'
    else
      @name = new_name
    end
  end

  def getName
    @name
  end

  protected

  attr_reader :name
end

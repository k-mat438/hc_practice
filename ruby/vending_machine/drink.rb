# frozen_string_literal: true

class Drink
  # 2.1 2.2 名前と値段をもつ
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

# frozen_string_literal: true

class Vending
  attr_reader :drink_table, :total_sales
  def initialize
    @drink_table = {}
    @total_sales = 0
    # 2.3 ペプシを５本格納
    5.times {store_drink(Drink.new(:'pepsi', 150))}
    # 4.1 モンスター、いろはすを５本格納
    5.times {store_drink(Drink.new(:'モンスター', 230))}
    5.times {store_drink(Drink.new(:'いろはす', 120))}
  end

  def stock
    @drink_table.map {|key, value| [key, value[:drinks].length]}.to_h
  end

  # 2.4 自販機の在庫（飲み物の種類と本数）
  def show_stock
    self.stock.map {|key, value| [key, value].join(':')}
  end
  # 4.2 購入可能リスト
  def able_to_buy
    x = stock.delete_if {|key, value| value == 0}
    puts '購入可能商品は,'
    x.map {|key, value| key}
  end

  # 4.3 自販機に飲み物を入れる。　drink_tableに種類がなかったら追加して、飲み物（Drinkインスタンス）を入れる
  def store_drink(drink)
    if @drink_table.has_key?(drink.name)
    else
      @drink_table[drink.name] = {:price => drink.price, :drinks => []}
    end
    @drink_table[drink.name][:drinks] << drink
  end

  # 3.1 3.2 3.3 飲み物を買えるかどうか
  def buy(drink,card)
    # 飲み物がリストにあるか
    drink_name = drink.to_sym
    if stock.has_key?(drink_name)
      # 飲み物の在庫があるかどうか
      if self.stock[drink_name] > 0 && card.deposit >= @drink_table[drink_name][:price]
        @drink_table[drink_name][:drinks].pop
        @total_sales += @drink_table[drink_name][:price]
        card.deposit = card.deposit - @drink_table[drink_name][:price]
        "残高は#{card.deposit}円です"
      else
        raise "#{drink_name}は買えません"
      end
    # 飲み物がリストにない
    else
      raise "#{stock.keys.join(', ')}から選んでください"
    end
  end

end

# frozen_string_literal: true

class Suica
  # 1.1預かり金として500円がデフォルトでチャージ
  DEFALT_PRICE = 500
  def initialize(deposit = DEFALT_PRICE)
    @deposit = deposit
  end

  def deposit
    @deposit
  end

  def deposit=(deposit)
    @deposit = deposit
  end
  # 1.2,1.3 100円以上の任意の金額をチャージ、100円未満は例外
  def charge(yen)
    if yen >= 100
      @deposit += yen
    else
      raise '100円以上を入金してください'
    end
  end
  # 1.4 現在のチャージ残高を表示
  def show_deposit
    "残金は#{@deposit}円"
  end

  # private
  # def deposit
  #   @deposit
  # end
end
card1 = Suica.new
card1.charge(100)
puts card1.show_deposit

class Drink
  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
  # 2.1 2.2 名前と値段をもつ
  def self.pepsi
    self.new(:'pepsi', 150)
  end

  def self.add_drinks(name, price)
    self.new(name, price)
  end
end

class Vending
  def initialize
    @drink_table = {}
    @total_sales = 0
    # 2.3 ペプシを５本格納
    5.times {store_drink(Drink.pepsi)}
    # 4.1 モンスター、いろはすを５本格納
    5.times {store_drink(Drink.add_drinks(:'モンスター', 230))}
    5.times {store_drink(Drink.add_drinks(:'いろはす', 120))}
  end

  def drink_table
    @drink_table
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

  # 3.4 売り上げ金額を取得
  def show_total_sales
    "現在#{@total_sales}円の売り上げです"
  end
  private
  def total_sales
    @total_sales
  end
end

vending_machine = Vending.new
puts vending_machine.stock
puts vending_machine.able_to_buy
puts vending_machine.buy('いろはす',card1)
puts vending_machine.buy('モンスター',card1)
puts vending_machine.buy('モンスター',card1)
card1.charge(670)
puts vending_machine.buy('モンスター',card1)
puts vending_machine.buy('モンスター',card1)
puts vending_machine.buy('モンスター',card1)
puts vending_machine.stock
puts vending_machine.show_stock
puts vending_machine.show_total_sales

# puts vending_machine.buy('モンスター',card1)
# puts vending_machine.total_sales = 400

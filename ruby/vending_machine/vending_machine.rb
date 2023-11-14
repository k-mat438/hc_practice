# frozen_string_literal: true

class Vending
  attr_reader :drink_table, :total_sales

  def initialize
    @drink_table = {}
    @total_sales = 0
    # 2.3 ペプシを５本格納
    5.times { store_drink(Drink.new(:pepsi, 150)) }
    # 4.1 モンスター、いろはすを５本格納
    5.times { store_drink(Drink.new(:'モンスター', 230)) }
    5.times { store_drink(Drink.new(:'いろはす', 120)) }
  end

  def stock
    @drink_table.transform_values { |value| value[:drinks].length }
  end

  # 2.4 自販機の在庫（飲み物の種類と本数）
  def show_stock
    stock.map { |key, value| [key, value].join(':') }
  end

  # 4.2 購入可能リスト
  def purchasable
    list = stock.delete_if { |_key, value| value.zero? }
    puts '購入可能商品は,'
    list.map { |key, _value| key }
  end

  # 4.3 自販機に飲み物を入れる。　drink_tableに種類がなかったら追加して、飲み物（Drinkインスタンス）を入れる
  def store_drink(drink)
    unless @drink_table.has_key?(drink.name)
      @drink_table[drink.name] = {price: drink.price, drinks: []}
    end
    @drink_table[drink.name][:drinks] << drink
  end

  # 3.1 3.2 3.3 飲み物を買えるかどうか
  def exist_drink(drink)
    raise 'ジュースが存在しません。' unless stock.key?(drink)
  end

  def exist_stock(drink)
    raise '在庫がありません。' unless stock[drink] > 0
  end

  def check_deposit(drink, card)
    raise '残高が足りません' unless card.deposit >= @drink_table[drink][:price]
  end

  def purchase(drink, card)
    drink_name = drink.to_sym
    exist_drink(drink_name)
    exist_stock(drink_name)
    check_deposit(drink_name, card)
    @drink_table[drink_name][:drinks].pop
    @total_sales += @drink_table[drink_name][:price]
    card.deposit = card.deposit - @drink_table[drink_name][:price]
    "残高は#{card.deposit}円です"
  end
end

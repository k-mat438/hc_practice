# frozen_string_literal: true

require "./suica"
require "./drink"
require "./vending_machine"

card1 = Suica.new
card1.charge(100)
# 1.4 現在のチャージ残高を表示
puts "残金は#{card1.deposit}円"


vending_machine = Vending.new
puts vending_machine.stock
puts vending_machine.purchasable
puts vending_machine.purchase('いろはす',card1)
puts vending_machine.purchase('モンスター',card1)
puts vending_machine.purchase('モンスター',card1)
card1.charge(670)
puts vending_machine.purchase('モンスター',card1)
puts vending_machine.purchase('モンスター',card1)
puts vending_machine.purchase('モンスター',card1)
puts vending_machine.stock
puts vending_machine.show_stock
# 3.4 売り上げ金額を取得
puts "現在#{vending_machine.total_sales}円の売り上げです"

# puts vending_machine.purchase('オレンジ',card1)
# puts vending_machine.purchase('モンスター',card1)
# puts vending_machine.total_sales = 400

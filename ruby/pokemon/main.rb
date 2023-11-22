# frozen_string_literal: true

require './pokemon'
require './pikachu'

poke = Pokemon.new('リザードン', 'ほのお', 'ひこう', 100)
poke.attack
pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
pika.attack
pika.changeName('aaa')
puts(pika.getName)
pika.changeName('ピカ')
puts(pika.getName)
pika.attack

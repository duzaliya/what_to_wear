require_relative "lib/clothes_collection"

collection = ClothesCollection.from_dir("#{__dir__}/data")

puts "Какая сейчас температура? (можно с минусом)"

input_temperature = STDIN.gets.to_i
puts

puts "Сегодня можно надеть:"
puts collection.pick_up_clothes(input_temperature)

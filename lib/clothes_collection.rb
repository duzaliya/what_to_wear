require_relative "wardrobe_item"

class ClothesCollection
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def self.from_dir(dir_path)
    collection =
      Dir["#{dir_path}/*.txt"].map do |file_path|
        name, type, temperature = File.readlines(file_path, chomp: true)
        temperature_conversion = temperature.delete("()").split(", ")
        # передаем все значения в конструктор
        WardrobeItem.new(
          name: name,
          type: type,
          temperature_range: Range.new(temperature_conversion[0].to_i, temperature_conversion[1].to_i))
      end
    new(collection)
  end

  def pick_up_clothes(temperature)
    @collection.select { |wardrobe_item| wardrobe_item.suits_the_weather?(temperature) }.uniq(&:type)
  end
end

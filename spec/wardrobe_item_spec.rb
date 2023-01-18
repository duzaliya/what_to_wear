require "wardrobe_item"

describe WardrobeItem do
  let(:thing) do
    described_class.new(name: "Джинсы", type: "Брюки", temperature_range: Range.new(10, 20))
  end

  describe ".new" do
    it "returns instance of #{described_class}" do
      expect(thing).to be_instance_of(described_class)
    end

    it "checks attributes for right values assignment" do
      expect(thing.name).to eq "Джинсы"
      expect(thing.type).to eq "Брюки"
      expect(thing.temperature_range).to eq 10..20
    end
  end

  describe "#suits_the_weather?(input)" do
    it "checks if the item is suitable for the weather" do
      expect(thing.suits_the_weather?(15)).to eq true
    end

    it "checks if the item is suitable for the weather at a different temperature" do
      expect(thing.suits_the_weather?(25)).to eq false
    end
  end

  describe "#to_s" do
    it "returns correctly formatted string" do
      expect(thing.to_s).to eq "Джинсы (Брюки) 10..20"
    end
  end
end

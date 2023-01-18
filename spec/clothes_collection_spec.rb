require "clothes_collection"
require "wardrobe_item"

describe ClothesCollection do

  describe ".from_dir" do
    let(:collection) { described_class.from_dir("#{__dir__}/fixtures") }

    context "when the files are in the directory" do
      it "returns instance of #{described_class}" do
        expect(collection).to be_instance_of(described_class)
      end

      it "reads files from directory" do
        expect(collection.collection.size).to eq 3
      end
    end
  end

  describe "#pick_up_clothes(temperature)" do
    let(:first_thing) do
      WardrobeItem.new(
        name: "Рубашка с коротким рукавом", type: "Рубашка", temperature_range: Range.new(20, 30))
    end
    let(:second_thing) do
      WardrobeItem.new(
        name: "Рубашка с длинным рукавом", type: "Рубашка", temperature_range: Range.new(10, 23))
    end
    let(:collection) { described_class.new([first_thing, second_thing]) }

    it "returns a matching outfit" do
      expect(collection.pick_up_clothes(20)).to eq [first_thing]
    end
  end
end

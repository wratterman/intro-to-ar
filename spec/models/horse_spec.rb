RSpec.describe Horse do
  describe "Class Methods" do
    describe ".total_winnings" do
      it "returns total winnings for all horses" do
        Horse.create(name: "Phil", age: 22, total_winnings: 3)
        Horse.create(name: "Penelope", age: 24, total_winnings: 4)

        expect(Horse.total_winnings).to eq(7)
      end

      it "returns total_winnings unique to each Jockey" do
        Horse.create(name: "Phil", age: 22, total_winnings: 3, jockey_id: 1)
        Horse.create(name: "Penelope", age: 24, total_winnings: 4, jockey_id: 1)
        Horse.create(name: "Marlene", age: 44, total_winnings: 6, jockey_id: 2)
        Horse.create(name: "Pterry", age: 48, total_winnings: 8, jockey_id: 2)

        todd = Jockey.create(name: "Todd")
        mark = Jockey.create(name: "Mark")

        expect(todd.horses.total_winnings).to eq (7)
        expect(mark.horses.total_winnings).to eq (14)
      end
    end

    describe ".average_winnings" do
      it "returns average winnings for all horses" do
        Horse.create(name: "Phil", age: 22, total_winnings: 3)
        Horse.create(name: "Penelope", age: 24, total_winnings: 4)

        expect(Horse.average_winnings).to eq(4)
      end
    end
  end

  describe "Instance Methods" do
    describe "#age_in_months" do
      it "returns age multiplied by 12" do
        horse = Horse.new(name: "Phil", age: 22, total_winnings: 3)

        expect(horse.age_in_months).to eq(264)
      end
    end
  end

  describe "Validations" do
    it "is invalid without a name" do
      horse = Horse.new(age: 22, total_winnings: 14)

      expect(horse).to_not be_valid
    end
  end

  describe "Validations" do
    it "is invalid without total_winnings" do
      horse = Horse.new(age: 22, name: "Joey")

      expect(horse).to_not be_valid
    end

    it "is invalid without a age" do
      horse = Horse.new(name: "Andrew", total_winnings: 14)

      expect(horse).to_not be_valid
    end

    it "shows jockey names are unique" do
      jockey = Jockey.create(name: "Will")
      jockey_2 = Jockey.create(name: "Will")

      expect(jockey_2).to_not be_valid
    end
  end
end

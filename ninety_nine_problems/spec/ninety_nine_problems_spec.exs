defmodule NinetyNineProblemsSpec do
  use ESpec

  describe "Ninety Nine Problems" do

    it "should retrieve the last of a list correctly" do
      expect(NinetyNineProblems.last([1])).to eq(1)
      expect(NinetyNineProblems.last([1,2,3,4,5])).to eq(5)
    end

    it "should retrieve the penultimate of a list correctly" do
      expect(NinetyNineProblems.penultimate([1,2])).to eq(1)
      expect(NinetyNineProblems.penultimate([1,2,3,4,5])).to eq(4)
    end
    
    it "should reverse a list correctly" do
      expect(NinetyNineProblems.reverse([1])).to eq([1])
      expect(NinetyNineProblems.reverse([1, 2])).to eq([2, 1])
    end

    it "should return the nth element of a list correctly" do
      expect(NinetyNineProblems.nth(0, [1])).to eq(1)
      expect(NinetyNineProblems.nth(2, [1,2,3,4,5])).to eq(3)
      expect(NinetyNineProblems.nth(4, [1,2,3,4,5])).to eq(5)
    end

    it "should determine the length of a list correctly" do
      expect(NinetyNineProblems.my_length([])).to eq(0)
      expect(NinetyNineProblems.my_length([1,2,3,4])).to eq(4)
    end

  end
    
end

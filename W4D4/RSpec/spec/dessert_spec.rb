require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert){ Dessert.new("cookie",8,chef)}

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("cookie")
    end

    it "sets a quantity" do 
      expect(dessert.quantity).to eq(8)
    end

    it "starts ingredients as an empty array"  do 
       expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new("cookie","a","Yummy")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(dessert.ingredients).to_not include("brown sugar")
      dessert.add_ingredient("brown sugar")
      expect(dessert.ingredients).to include("brown sugar")
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert.add_ingredient("brown sugar")
      dessert.add_ingredient("egg")
      expect(dessert.ingredients.length).to eq(2)
      dessert.mix!
      expect(dessert.ingredients.length).to eq(2)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert=Dessert.new("cookie",2, chef)
      dessert.eat(2)
      expect(dessert.quantity).to eq(0)
    end
      it "raises an error if the amount is greater than the quantity" do 
        dessert=Dessert.new("cookie",2, chef)
        expect{dessert.eat(3)}.to raise_error( "not enough left!")
      end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      allow(chef).to receive(:titleize).and_return("CEO")
      expect(dessert.serve).to include("CEO")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
    allow(chef).to receive(:bake).and_return("2")
    expect(dessert.make_more).to include("2")
    end
  end
end

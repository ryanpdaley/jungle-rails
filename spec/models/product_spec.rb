require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "Test product creation" do
    before do
      @testCategory = Category.create(name: 'testCategory')
    end

    it "should describe a product with all required fields" do
      @randomProduct = Product.create(
        name: 'testProduct',
        price: 1234,
        quantity: 4321,
        category: @testCategory)
      expect(@randomProduct.describe).to eq("testProduct 123400 4321 testCategory")
    end

    it "should describe a product with all required fields, except name" do
      @randomProduct = Product.create(
        name: nil,
        price: 1234,
        quantity: 4321,
        category: @testCategory)
      expect(@randomProduct.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should describe a product with all required fields, except price" do
      @randomProduct = Product.create(
        name: 'testProduct',
        price: nil,
        quantity: 4321,
        category: @testCategory)
      expect(@randomProduct.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it "should describe a product with all required fields, except quantity" do
      @randomProduct = Product.create(
        name: 'testProduct',
        price: 1234,
        quantity: nil,
        category: @testCategory)
      expect(@randomProduct.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it "should describe a product with all required fields, except category" do
      @randomProduct = Product.create(
        name: 'testProduct',
        price: 1234,
        quantity: 4321,
        category: nil)
      expect(@randomProduct.errors.full_messages[0]).to eq("Category can't be blank")
    end

  end
end


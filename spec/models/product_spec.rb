require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do
    @category = Category.create!(name: 'asdads')
    @product = @category.products.new(name: 'test' , price: 100 , quantity: 50)
  end

  describe 'Validations' do
    it 'returns true if all fieds are valid' do
      @product.save!
      expect(@product).to be_persisted
    end
    it 'returns false if name is invalid' do
      @product.name= nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'returns false if price is invalid' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'returns false if quantity is invalid' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end
    it 'returns false if category_id is invalid' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")

    end
  end

end

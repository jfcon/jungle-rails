require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.create!(first_name: 'John', last_name: 'Doe',  email: 'something@example.com', password: '123', password_confirmation:'123')
  end


  describe 'Validations' do
    it 'creates a new user if all fields are valid' do
      expect(@user).to be_persisted
      end
    end

    it 'should return false if email already exists' do
      user2 = User.new(
        first_name: 'Clone', 
        last_name: 'Clonerson', 
        email: 'SOMETHING@example.com', 
        password: '123', 
        password_confirmation:'123')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end


end

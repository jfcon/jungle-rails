require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(first_name: 'John', last_name: 'Doe',  email: 'something@example.com', password: '123456', password_confirmation:'123456')
  end


  describe 'Validations' do
    it 'creates a new user if all fields are valid' do
      @user.save
      expect(@user).to be_persisted
      end
    end

    it 'is invalid if first_name is missing' do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid if last_name is missing' do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid if email is missing' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid if password is missing' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid if password_confirmation is missing' do
      @user.password_confirmation = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")

    end

    it 'is invalid if passwords to not match' do
      @user.password_confirmation = '123457'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid when password is too short' do
      @user.password = '123'
      @user.password_confirmation = '123'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'is invalid if email already exists' do
      @user.save
      user2 = User.new(
        first_name: 'Clone', 
        last_name: 'Clonerson', 
        email: 'SOMETHING@example.com', 
        password: '123456', 
        password_confirmation:'123456')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end


end

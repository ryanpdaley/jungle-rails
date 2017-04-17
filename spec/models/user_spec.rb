require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
  end

  context 'user validations' do
    it "All valid data" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser.describe).to eq("firstName lastName password password")
    end

    it "Missing first_name" do
      @randomUser = User.create(
        first_name: nil,
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it "Missing last_name" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: nil,
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it "Missing email" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it "Missing password" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: nil,
        password_confirmation: 'password'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it "Password is too short" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'pass',
        password_confirmation: 'pass'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Password is too short (minimum is 5 characters)")
    end


    it "Missing password_confirmation" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: nil
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Password confirmation can't be blank")
    end

    it "password and password_confirmation not equal" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'Notpassword'
        )
      expect(@randomUser.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it "email must be unique (exact match)" do
      @randomUser1 = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      @randomUser2 = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser2.valid?).to eq(false)
    end

    it "email must be unique (case is different)" do
      @randomUser1 = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      @randomUser2 = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'SOME@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@randomUser2.valid?).to eq(false)
    end

  end

  describe '.authenticate_with_credentials' do
    it "Valid email and password" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(User.authenticate_with_credentials('some@email.com', 'password')).to eq(@randomUser)
    end

    it "valid email and invalid password" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(User.authenticate_with_credentials('some@email.com', 'notpassword')).to eq(nil)
    end

    it "leading spaces in email" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(User.authenticate_with_credentials('           some@email.com', 'password')).to eq(@randomUser)
    end

    it "incorrect case in email" do
      @randomUser = User.create(
        first_name: 'firstName',
        last_name: 'lastName',
        email: 'some@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(User.authenticate_with_credentials('Some@Email.com', 'password')).to eq(@randomUser)
    end
  end
end

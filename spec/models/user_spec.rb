require 'rails_helper'
  describe User do
    describe '#create' do
      it "is valid with a name, email, password" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user, email:user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "is invalid without a name" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end


      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end
  end

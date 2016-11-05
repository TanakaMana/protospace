require 'rails_helper'

describe Prototype do
  describe 'associations' do
    it 'is associated with a user' do
      user = create(:user)
      prototype = create(:prototype, user: user)
      expect(prototype.user).to eq user
    end
  end
  describe 'with likes' do
    it "likes_count" do
      user = create(:user)
      prototype = create(:prototype, user: user)
      like = create(:like, prototype: prototype, user: user)
      expect(prototype.likes_count).to eq 1
    end
  end

  describe '#create' do
    context 'valid' do
      it "is valid with title, concept, cathch_copy" do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end

    context 'invalid' do
      it "is valid without title" do
        prototype = build(:prototype, title: "")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it "is valid without cathch_copy" do
        prototype = build(:prototype, catchcopy: "")
        prototype.valid?
        expect(prototype.errors[:catchcopy]).to include("can't be blank")
      end

      it "is valid without concept" do
        prototype = build(:prototype, concept: "")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe '#like_user(user)' do
    context 'when like a user' do
      it "return true" do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype: prototype, user: user)
        expect(prototype.like_user(user)).to be_truthy
      end
    end
    context 'when not like a user' do
      it "return nil" do
        user = create(:user)
        prototype = create(:prototype)
        like = create(:like, prototype: prototype)
        expect(prototype.like_user(user)).to be_falsey
      end
    end
  end

end

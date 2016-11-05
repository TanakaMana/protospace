require 'rails_helper'

  describe PrototypeThumbnail do

    describe '#create' do

      describe "with valid attributes" do
        it "has a valid factory" do
          prototype_thumbnail = build(:prototype_thumbnail)
          expect(prototype_thumbnail).to be_valid
        end
      end

      describe "without content attribute" do
        it "returns error" do
          prototype_thumbnail = build(:prototype_thumbnail, image: nil)
          prototype_thumbnail.valid?
          expect(prototype_thumbnail.errors[:image])
        end
      end

      describe "without status attribute" do
        it "returns error" do
          prototype_thumbnail = build(:prototype_thumbnail, state: nil)
          prototype_thumbnail.valid?
          expect(prototype_thumbnail.errors[:state])
        end
      end
    end
  end

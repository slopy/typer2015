require 'rails_helper'

RSpec.describe Group, type: :model do

    describe "Group model" do

       it "should be invalid without a name" do
        # @blank_group = build(:blank_gorup)
        expect(build(:blank_gorup)).not_to be_valid
      end

    end
end

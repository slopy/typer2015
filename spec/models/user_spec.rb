require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = build(:user)
    end

    it 'gets a id assigned' do 
        @user.save!
        expect(@user.id).not_to be_blank
    end

end

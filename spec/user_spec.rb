require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    before { subjec.save }

    context 'Test the user validations' do
        it 'name should be present' do
            subject.name = nil

            expect(subject).to_not_be_valid
        end

    end
end
require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  
  describe 'which #name' do
    context 'is nill' do
      it 'is invalid' do
        user.name = ''
        expect(user).to be_invalid
      end
    end

    context 'is blank' do
      it 'is invalid' do
        user.name = '   '
        expect(user).to be_invalid
      end
    end
  end
  
  describe 'which #email' do
    context 'is nill' do
      it 'is invalid' do
        user.email = ''
        expect(user).to be_invalid
      end
    end

    context 'is blank' do
      it 'is invalid' do
        user.email = '   '
        expect(user).to be_invalid
      end
    end
  end

  describe 'which #password' do
    context 'is nill' do
      it 'is invalid' do
        user.password = '    '
        expect(user).to be_invalid
      end
    end

    context 'is blank' do
      it 'is invalid' do
        user.password = '    '
        expect(user).to be_invalid
      end
    end
  end

  describe 'which #password_confirmation' do
    context 'is nill' do
      it 'is invalid' do
        user.password_confirmation = ''
        expect(user).to be_invalid
      end
    end

    context 'is blank' do
      it 'is invalid' do
        user.password_confirmation = '    '
        expect(user).to be_invalid
      end
    end

    context 'is unmatched to #password' do
      let(:unmatched_ps_cnf) { 'wordpass' }
      it 'is invalid' do
        user.password_confirmation = unmatched_ps_cnf
        expect(user).to be_invalid
      end
    end
  end

end
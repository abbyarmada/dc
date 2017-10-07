# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
end

# frozen_string_literal: true

require 'rails_helper'

describe Blog, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:blog)).to be_valid
  end
end

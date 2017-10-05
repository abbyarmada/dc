# frozen_string_literal: true

require 'rails_helper'

describe Link, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:link)).to be_valid
  end
end

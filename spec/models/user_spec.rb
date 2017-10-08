# frozen_string_literal: true

require 'rails_helper'
include DC::SettingsHelper

describe User, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'should have set a valid default role' do
    FactoryGirl.create(:user)
    last_user = User.last
    default_role = settings('defaults.permissions.new_user.role', fatal_exception: true).to_sym
    expect(last_user.has_role?(default_role)).to eq true
  end
end

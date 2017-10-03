# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogController, type: :controller do
  it 'should be implemented' do
    expect(BlogController).to be < DC::MetaController
  end
end

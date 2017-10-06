# frozen_string_literal: true

require 'rails_helper'

describe BlogController, type: :controller do
  it 'should be an implementation of metacontroller' do
    expect(BlogController).to be < DC::MetaController
  end

  it 'should show index' do
    get :index, params: {component: 'blog'}
  end
end

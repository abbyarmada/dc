require 'rails_helper'

describe LinksController, type: :controller do
  it 'should be an implementation of metacontroller' do
    expect(LinksController).to be < DC::MetaController
  end
end

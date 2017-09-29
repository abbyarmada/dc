require 'rails_helper'
include DC

describe DC::Configuration, 'configuration' do
  it 'should not boot up without implementation file passed' do
    expect(DC.boot).to be raise_error
  end
end

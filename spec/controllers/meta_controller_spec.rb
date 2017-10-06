require 'rails_helper'

describe DC::MetaController, type: :controller do
  include DC::PathHelper

  before(:example) do
    @components = []

    Settings.components.each do |component|
      next unless component[1].enabled
      @components << component
    end
  end

end

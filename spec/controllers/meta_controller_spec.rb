require 'rails_helper'

@components = []

Settings.components.each do |component|
  next unless component[1].enabled
  @components << component
end

@components.each do |component|
  describe "#{component[0].to_s.titleize}Controller".classify.constantize, type: :controller do
    include DC::SettingsHelper
    include DC::PathHelper

      it "can render the index path for: #{component[0]}" do
        get 'blogs', params: { component: component[0] }
      end

  end
end

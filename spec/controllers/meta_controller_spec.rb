require 'rails_helper'
include SettingsHelper

@components = []

Settings.components.each do |component|
  next unless component[1].enabled
  @components << component
end

@components.each do |component|
  @controller_class = "#{node_name(component)}Controller".classify.constantize

  describe @controller_class, type: :controller do
    describe 'index actions' do
      before(:each) do
        get :index, params: { component: component[0].to_s }
        @comp_class = node_value(component).klass
      end

      it 'The entry class is properly set.' do
        component_class = @comp_class.constantize
        entry_class = controller.instance_variable_get(:@entry_class)
        expect(entry_class).to be component_class
      end

      it 'The length of entries is not null' do
        FactoryGirl.create_list(@comp_class.downcase.to_sym, 20)
        entries = controller.instance_variable_get(:@entires)
        expect(entries.length).to_not be_nil
      end

      it 'The response is 200' do
        expect(response.status).to be 200
      end
    end
  end
end

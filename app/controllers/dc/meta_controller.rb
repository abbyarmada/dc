module DC
  class MetaController < ApplicationController
    include SettingsHelper
    before_action :entry_class

    def index
      @entires = entry_class.all.order('name')
    end

    private

    def entry_class
      @entry_class ||= settings("components.#{params[:component]}.klass", fatal_exception: true).classify.constantize
    end
  end
end

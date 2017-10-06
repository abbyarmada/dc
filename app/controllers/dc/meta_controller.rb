module DC
  class MetaController < ApplicationController
    include SettingsHelper
    before_action :entry_class

    def index
      @entires = entry_class.all.order('name')
    end

    def new
      @entry = entry_class.new
      render :new, layout: false
    end

    private

    def entry_class
      @entry_class ||= settings("components.#{params[:component]}.klass", fatal_exception: true).classify.constantize
    end
  end
end

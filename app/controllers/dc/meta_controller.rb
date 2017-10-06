module DC
  class MetaController < ApplicationController
    include SettingsHelper
    before_action :entry_class
    before_action :load_entry, only: %i[show edit update destroy]

    def index
      @entires = entry_class.all.order('name')
    end

    def new
      @entry = entry_class.new
      render :new, layout: false
    end

    def edit
      render :edit, layout: false
    end

    private

    def entry_class
      @entry_class ||= settings("components.#{params[:component]}.klass", fatal_exception: true).classify.constantize
    end

    def load_entry
      @entry = entry_class.find(params[:id])
    end
  end
end

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

    def create
      @entry = entry_class.new(entry_params)
      if @entry.save
        component_name = settings("components.#{params[:component]}.name")
        response.headers['status'] = 'success'
        flash[:success] = "#{component_name} was successfully created."

        redirect_to helpers.meta_show_path(@entry)
      else
        response.headers['status'] = 'error'
        render :new, layout: false
      end
    end

    def update
      if @entry.update(entry_params)
        component_name = settings("components.#{params[:component]}.name")
        flash[:success] = "#{component_name} was successfully updated."
        response.headers['status'] = 'success'
      else
        response.headers['status'] = 'error'
        render :edit, layout: false
      end
    end

    private

    def entry_class
      @entry_class ||= settings("components.#{params[:component]}.klass", fatal_exception: true).classify.constantize
    end

    def load_entry
      @entry = entry_class.find(params[:id])
    end

    def entry_params
      allowed_attrs = set_allowed_attrs
      component = settings("components.#{params[:component]}.klass").downcase.to_sym
      params.require(component).permit(*allowed_attrs)
    end

    def set_allowed_attrs
      allowed_attrs = %i[id]
      fields = settings("views.#{params[:component]}.new", fatal_exception: true)
      fields.each do |field|
        allowed_attrs.append(node_name(field).to_sym)
      end
      allowed_attrs
    end
  end
end

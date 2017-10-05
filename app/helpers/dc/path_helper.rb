module DC
  include SettingsHelper
  # Responsible for generating 'meta' paths from the component & entry
  module PathHelper
    # calls the index path
    def meta_index_path(component = params[:component])
      send(index_path(component))
    end

    # calls the new path
    def meta_new_path(component = params[:component])
      send(new_path(component))
    end

    # calls the show
    def meta_show_path(entry, component = params[:component])
      send(show_path(component), entry)
    end

    # calls the edit
    def meta_edit_path(entry, component = params[:component])
      send(edit_path(component), entry)
    end

    # calls the delete
    def meta_delete_path(entry, component = params[:component])
      send(delete_path(component), entry)
    end

    def index_path(component = params[:component])
      path = path_getter(component)
      if path.pluralize(nil) == path
        "#{path}_path"
      else
        "#{path}_index_path"
      end
    end

    def new_path(component = params[:component])
      "new_#{path_getter(component).singularize}_path"
    end

    def show_path(component = params[:component])
      "#{path_getter(component).singularize}_path"
    end

    def edit_path(component = params[:component])
      "edit_#{path_getter(component).singularize}_path"
    end

    def delete_path(component = params[:component])
      "#{path_getter(component).singularize}_path"
    end

    private

    def path_getter(component)
      settings "components.#{component}.path", fatal_exception: true
    end
  end
end

module DC
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

    # Todo: consider making _path methods private in favor of relying on the meta helpers

    def index_path(component)
      "#{component}_index_path"
    end

    def new_path(component)
      "new_#{component}_path"
    end

    def show_path(component)
      "#{component}_path"
    end

    def edit_path(component)
      "edit_#{component}_path"
    end

    def delete_path(component)
      "#{component}_path"
    end
  end
end

class LinksController < DC::MetaController
  def index
    @entry = Link.last
    render 'meta/index'
  end
end

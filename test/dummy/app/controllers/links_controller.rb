class LinksController < DC::MetaController
  def index
    @entry = Link.last
    render 'blog/index'
  end
end

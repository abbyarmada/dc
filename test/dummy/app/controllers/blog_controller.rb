class BlogController < DC::MetaController
  def index
    @entry = Blog.last
    render 'meta/index'
  end
end

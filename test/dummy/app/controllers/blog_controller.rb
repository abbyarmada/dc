class BlogController < DC::MetaController
  def index
    @entry = Blog.last
  end
end

class PageController < ApplicationController
  include DC::ApplicationHelper
  helper DC::ApplicationHelper
  def index
    @components = settings('components')
  end
end

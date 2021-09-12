class ToptensController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order('likes_count desc').limit(10)
  end
end

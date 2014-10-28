get '/' do
  # Look in app/views/index.erb
  @posts_list = Post.all
  @tags_list = Tag.all
  @posts_list_desc = Post.order( "created_at DESC" ).limit(10)
  erb :index
end




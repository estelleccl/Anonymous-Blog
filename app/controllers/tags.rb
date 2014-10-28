get '/tags/:id' do
  @tags_list = Tag.all
  @posts_list_desc = Post.order( "created_at DESC" ).limit(10)
  tag = Tag.find(params[:id])
  @posts_list = tag.posts
  erb :index
end
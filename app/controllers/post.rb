get '/posts' do
  @posts_list = Post.all
  erb :index
end

get '/new_post' do
  erb :newpost
end

post '/new_post' do
  @post = Post.create(title: params[:title], content: params[:content], author: params[:author])
  puts params[:tags].inspect
  @tag = Tag.create(tag_name: params[:tags])
#   PostTag.create(  )
  if !@post.new_record? #Returns true if this object hasn’t been saved yet
     redirect "/"
  else
     @error_msg = @post.errors.full_messages
     erb :newpost
  end
end
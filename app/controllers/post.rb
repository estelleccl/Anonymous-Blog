get '/posts' do
  @posts_list = Post.all
  @posts_list_desc = Post.order( "created_at DESC" ).limit(10)
  erb :index
end

get '/posts/:id' do
  @post= Post.find(params[:id])
  @posts_list_desc = Post.order( "created_at DESC" ).limit(10)
  erb :'post/post'
end

post '/posts/:id' do
  @post= Post.find(params[:id])
  puts "Post id #{@post.id}"
  @post[:author] = params[:author]
  @post[:title] = params[:title]
  @post[:content] = params[:content]
  @post.save
  redirect "/posts/#{params[:id]}"
end

get '/new_post' do
  erb :newpost
end

post '/new_post' do
  @post = Post.create(title: params[:title], content: params[:content], author: params[:author])
  temp_tag = params[:tags]
  Tag.create(tag_name: params[:tags])
#   PostTag.create(  )
  if !@post.new_record? #Returns true if this object hasn’t been saved yet
     redirect "/"
  else
     @error_msg = @post.errors.full_messages
     erb :newpost
  end
end

get '/posts/:id/edit' do
  @post = Post.find params[:id] 
  if !@post.nil?
    erb :'post/edit'
  else
    @error_msg = @post.errors.full_messages
    erb :invalid
  end
end
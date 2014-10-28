get '/posts/:id' do
  @tags_list = Tag.all
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
  erb :'post/newpost'
end

post '/new_post' do
  @post = Post.create(title: params[:title], content: params[:content], author: params[:author])
  temp_tag = params[:tags].split(",")
  temp_tag.each do |tag|
    unless Tag.exists?(tag_name: tag)
      Tag.create(tag_name: tag)
    end
    @tag = Tag.where(tag_name: tag).first
    @post.tags << @tag
  end
#   PostTag.create(  )
  if !@post.new_record? #Returns true if this object hasn’t been saved yet
     redirect "/"
  else
     @error_msg = @post.errors.full_messages
     erb :'post/newpost'
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

delete '/posts/:id/edit' do
  Post.find(params[:id]).destroy
  redirect "/"
end
require File.expand_path(File.join(File.dirname(__FILE__), "../../app/helpers/application_helper"))

class PostsController < ApplicationController  
#http_basic_authenticate_with :name => 'dhh', :password => "secret", :except => [:index, :how]
# GET /posts
# GET /posts.json
  def go_baidu 
      redirect_to "www.baidu.com"
  end

  def index
     @posts = Post.all
     respond_to do |format|
       format.html
       format.json { render json: @posts }
     end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      #puts "format:#{format}"
      format.html  #new.html.erb
      format.json{render json: @post }
    end

  end

  #POST /posts
  #POST /posts.json
  def create
    # puts "paramspost:#{params[:post]}"
    @post = Post.new(params[:post]) #{"name"=>"7", "title"=>"77", "content"=>"777"}


    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: 'Post was suceessfully created.'}
        format.json {render json: @post, status: :created ,location: @post}
      else
        format.html {render action: "new"}
        format.json {render json: @post.errors,status: :unprocessable_entity}
      end
    end
  end
  # GET /posts/1
   #GET /posts/1.json

   def show 
      @post = Post.find(params[:id])
      respond_to do |format|
        format.html
        format.json {render json: @post}
        puts "html:"
        puts format.html
      end
   end

   #GET /posts/1/edit
   # self_edit=>#<PostsController:0xb6e877e8>
   def edit
     #puts "I am being edited!"
     #inspect_value(self,"self_edit")
     @post = Post.find(params[:id])
   end

   # PUT /posts/1
   # PUT /posts/1.json
   # self_update=>#<PostsController:0xa37f0a0>
   def update
     @post = Post.find(params[:id])
  
     #inspect_value(self,"self_update")
  
     respond_to do |format|
       if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successful updated.'}
          format.json { head :no_content }
       else
         format.html {render action: "edit"}
         format.json {render json: @post.errors, status: :unprocessable_entity}
       end

     end
   end
   
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy 
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      inspect_value posts_url,"posts_url"
      format.html {redirect_to posts_url}
      format.json {head :no_content}
    end
  end
end
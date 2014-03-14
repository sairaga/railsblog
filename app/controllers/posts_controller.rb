class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :need_login, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :need_author, only: [:edit, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @puser = session[:userid]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @puser = session[:userid]
    @comments = Comment.where(:post_id => @post.id)
    @addComment = Comment.new
  end

def commentAdd
    @c = Comment.new(comment_params)
    @c.user_id = session[:userref]
    @post = Post.find(@c.post_id)
    #@post.comment_count = comment_count.to_i + 1   

    if @c.save
        flash[:notice] = "Comment added."
    else  
        flash[:notice] = "Comment cannot be added"
    end 
    #if @post.save
    #    flash[:notice] = "Comment added."
    #else  
    #    flash[:notice] = "Comment cannot be added"
    #end 

    redirect_to "/posts/#{@post.id}"
  end


  # GET /posts/new
  def new
    @post = Post.new
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.users_id = session[:userref]
    #@post.comment_count = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.comments.destroy_all
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
  def need_login
  unless session[:authenticated]
      flash[:error] = "You must login first..."
      redirect_to :user_login
    end 
  end

  def need_author
  unless session[:userref] == @post.users_id
      flash[:error] = "You cannot operate on this users post..."
      redirect_to :posts
    end 
  end  


    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end  

    #def comment_count
    #  params.require(:comment_count)
    #end  

end

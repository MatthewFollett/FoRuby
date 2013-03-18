class MessagePostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy, :new]
	before_filter :can_edit?, only: [:edit, :update]

  # GET /message_posts
  # GET /message_posts.json
  def index
    @message_posts = MessagePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_posts }
    end
  end

  # GET /message_posts/1
  # GET /message_posts/1.json
  def show
    @message_post = MessagePost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_post }
    end
  end

  # GET /message_posts/new
  # GET /message_posts/new.json
  def new
    @message_post = MessagePost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_post }
    end
  end

  # GET /message_posts/1/edit
  def edit
    @message_post = MessagePost.find(params[:id])
  end

  # POST /message_posts
  # POST /message_posts.json
  def create
		params[:message_post][:message_thread_id] = params["message_thread_id"]
    @message_post = MessagePost.new(params[:message_post])
		@message_post.author_id = current_user.id

    respond_to do |format|
      if @message_post.save
        format.html { redirect_to @message_post.message_thread, notice: 'Message post was successfully created.' }
        format.json { render json: @message_post, status: :created, location: @message_post }
      else
        format.html { render action: "new" }
        format.json { render json: @message_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /message_posts/1
  # PUT /message_posts/1.json
  def update
    @message_post = MessagePost.find(params[:id])
		
    respond_to do |format|
      if @message_post.update_attributes(params[:message_post])
        format.html { redirect_to @message_post, notice: 'Message post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_posts/1
  # DELETE /message_posts/1.json
  def destroy
    @message_post = MessagePost.find(params[:id])
    @message_post.destroy

    respond_to do |format|
      format.html { redirect_to message_posts_url }
      format.json { head :no_content }
    end
  end
	
	def can_edit?
		@message_post = MessagePost.find(params[:id])
		(current_user.id == @message_post.author_id)
	end
end

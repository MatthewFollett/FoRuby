class MessageThreadsController < ApplicationController
  # GET /message_threads
  # GET /message_threads.json
  def index
    @message_threads = MessageThread.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_threads }
    end
  end

  # GET /message_threads/1
  # GET /message_threads/1.json
  def show
    @message_thread = MessageThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_thread }
    end
  end

  # GET /message_threads/new
  # GET /message_threads/new.json
  def new
    @message_thread = MessageThread.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_thread }
    end
  end

  # GET /message_threads/1/edit
  def edit
    @message_thread = MessageThread.find(params[:id])
  end

  # POST /message_threads
  # POST /message_threads.json
  def create
    @message_thread = MessageThread.new(params[:message_thread])

    respond_to do |format|
      if @message_thread.save
        format.html { redirect_to @message_thread, notice: 'Message thread was successfully created.' }
        format.json { render json: @message_thread, status: :created, location: @message_thread }
      else
        format.html { render action: "new" }
        format.json { render json: @message_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /message_threads/1
  # PUT /message_threads/1.json
  def update
    @message_thread = MessageThread.find(params[:id])

    respond_to do |format|
      if @message_thread.update_attributes(params[:message_thread])
        format.html { redirect_to @message_thread, notice: 'Message thread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_threads/1
  # DELETE /message_threads/1.json
  def destroy
    @message_thread = MessageThread.find(params[:id])
    @message_thread.destroy

    respond_to do |format|
      format.html { redirect_to message_threads_url }
      format.json { head :no_content }
    end
  end
end

class SuggestedPostsController < ApplicationController
  before_action :set_suggested_post, only: [:show, :edit, :update, :destroy]

  # GET /suggested_posts
  # GET /suggested_posts.json
  def index
    @suggested_posts = SuggestedPost.all
  end

  # GET /suggested_posts/1
  # GET /suggested_posts/1.json
  def show
  end

  # GET /suggested_posts/new
  def new
    @suggested_post = SuggestedPost.new
  end

  # GET /suggested_posts/1/edit
  def edit
  end

  # POST /suggested_posts
  # POST /suggested_posts.json
  def create
    @suggested_post = SuggestedPost.new(suggested_post_params)

    respond_to do |format|
      if @suggested_post.save
        format.html { redirect_to @suggested_post, notice: 'Suggested post was successfully created.' }
        format.json { render :show, status: :created, location: @suggested_post }
      else
        format.html { render :new }
        format.json { render json: @suggested_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_posts/1
  # PATCH/PUT /suggested_posts/1.json
  def update
    respond_to do |format|
      if @suggested_post.update(suggested_post_params)
        format.html { redirect_to @suggested_post, notice: 'Suggested post was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggested_post }
      else
        format.html { render :edit }
        format.json { render json: @suggested_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_posts/1
  # DELETE /suggested_posts/1.json
  def destroy
    @suggested_post.destroy
    respond_to do |format|
      format.html { redirect_to suggested_posts_url, notice: 'Suggested post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_post
      @suggested_post = SuggestedPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggested_post_params
      params.require(:suggested_post).permit(:form_id, :publication_id)
    end
end

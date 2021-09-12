class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index ]
  # before_action :correct_user, only: %i[ edit update destroy ]

  # GET /subjects or /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new(post_id: params[:post_id])
    @subjects = Subject.where(post_id: params[:post_id])

    # @post = Post.find(params[:post_id])
    # @post.subjects.new
    # @subjects = @post.subjects
  end

  # GET /subjects/1/edit
  def edit
    @post_id = params[:post_id]
  end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to "/posts/#{@subject.post_id}/subjects/new", notice: "Subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to "/posts/#{@subject.post_id}/subjects/new", notice: "Subject was successfully updated." }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "Subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:sub_con, :votes, :post_id)
    end

    # user authenticate
    # def correct_user
    #   @subject = current_user.subjects.find_by(id: params[:id])
    #   redirect_to posts_path, notice: "접근 권한이 없습니다." if @subject.nil?
    # end

end

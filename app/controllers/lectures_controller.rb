class LecturesController < InheritedResources::Base
  
  before_action :authenticate_user!

  def create
    @lecture= Lecture.new(lecture_params)
    @lecture.user_id=current_user.id

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def like 
    @lecture = Lecture.find(params[:id])
    @lecture.like_by current_user
    redirect_to lectures_url
  end  
  
  def dislike
    @lecture = Lecture.find(params[:id])
    @lecture.dislike_by current_user
    redirect_to lectures_url
  end

  def spam
    @lecture = Lecture.find(params[:id])
    current_user.lectures << @lecture unless current_user.lectures.include?(@lecture)
    redirect_to lectures_url
  end


  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id)
    end
end


class LecturesController < InheritedResources::Base
before_action :authenticate_user!
def upvote 
  @link = Lecture.find(params[:id])
  @link.upvote_by current_user
  redirect_to back
end  

def downvote
  @link = Lecture.find(params[:id])
  @link.downvote_by current_user
  redirect_to back
end

def new
  @comment = Comment.new(lecture_id: params[:lecture_id])
end

  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end
end


class CommentsController < InheritedResources::Base
      def create
        @lecture = Lecture.find(params[:lecture_id])
         @comment = @lecture.comments.create(params[:comment].permit(:body))
        redirect_to post_path(@lecture)
    end

    def destroy
        @lecture = Lecture.find(params[:lecture_id])
        @comment = @lecture.comments.find(params[:id])
        @comment.destroy
        redirect_to lecture_path(@lecture)
    end
end


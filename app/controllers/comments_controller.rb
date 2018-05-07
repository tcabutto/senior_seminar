class CommentsController <ApplicationController

before_action :find_commentable
    def index
        @deal = Deal.find(params[:deal_id])
    end
    def new
        @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.new comment_params
        if current_account.accountable_type == "Personnel"
            @comment.personnel_id = current_account.id
            @name = current_account.accountable.username
        elsif current_account.accountable_type == "Business"
            @comment.business_id = current_account.id
            @name = current_account.accountable.name
        end

        if ProfanityFilter::Base.profane?(@comment.body) #=> true/false
            ProfanityFilter::Base.clean(@comment.body)
            redirect_to request.referrer, notice: 'Sorry, profanity was detected in your comment. It was not posted.'
        elsif @comment.body.blank?
            redirect_to request.referrer, notice: 'Your comment cannot be blank!'
        elsif @comment.save
            redirect_to request.referrer, notice: 'Your comment was successfully posted!'
        else
            redirect_to request.referrer, notice: 'Your comment was not successfully posted!'
        end
    end

    #def edit
    #    @comment = @commentable.comments.find(params[:id])
    #end

    #def update
    #    @comment = @commentable.comments.find(params[:id])

     #   if @comment.update(comment_params)
     #       redirect_to request.referrer, notice 'Your comment was successfully updated!'
     #   else
     #       redirect_to request.referrer, notice 'Your comment did not get updated.'
     #   end
   # end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_commentable
        if params[:comment_id]
            @commentable = Comment.find_by_id(params[:comment_id])
        elsif params[:deal_id]
            @commentable = Deal.find_by_id(params[:deal_id]) 
        elsif params[:event_id]
            @commentable = Event.find_by_id(params[:event_id])
        end
    end
end
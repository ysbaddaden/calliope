class CommentsController < Commentable::Controller
  respond_to :html

  def comment_url
    case @commentable
    when Post
      blog_post_url(params[:name], @commentable, :anchor => "C#{@comment.to_param}")
    else
      super
    end
  end

  def commentable_url
    case @commentable
    when Post
      blog_post_url(params[:name], @commentable)
    else
      super
    end
  end
end

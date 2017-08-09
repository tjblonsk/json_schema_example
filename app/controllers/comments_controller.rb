class CommentsController < ApplicationController
  before_action :validate_create_payload, only: [:create]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :title, :length)
  end

  def validate_create_payload
    errors = JSON::Validator.fully_validate(Schemas::Comment.load, comment_params.to_h)

    unless errors.empty?
      errors << 'Please visit http://docs.comments.apiary.io/ for a full API reference'
      render json: { errors: errors }, status: :unprocessable_entity
    end
  end
end

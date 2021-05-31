class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags, each_serializer: TagSerializer
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: {status: :success, data: @tag}
    else
      render json: {status: :unprocessable_entity, error: @tag.errors.full_message.join(' ')}
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_name)
  end

end

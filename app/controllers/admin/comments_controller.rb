class Admin::CommentsController < Admin::BaseController
  before_action :set_commentable, only: [:create]

  def create
    params['user_id'] = User.first.id
    params['commentable'] = @commentable
    super
  end

  private

  def set_commentable
    # model_name 在routes.rb 中指定
    parent_class = params[:model_name].constantize
    parent_foreing_key = params[:model_name].foreign_key
    @commentable = parent_class.find(params[parent_foreing_key])
  end
end

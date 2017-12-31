class GuidesController < ApplicationController
  before_action :set_guide, only: [:show]
  
  def index
    @guide = Guide.if_published
  end
  
  def new
    @guide = Guide.new
  end
  
  def create
    @guide = Guide.new(guide_params)
    @guide.save
    redirect_to @guide
  end
  
  def show
  end
  
  private
  
  def guide_params 
    params.require(:guide).permit(:title, :content, :published)
  end
  
  def set_guide
    @guide = Guide.find(params[:id])
  end
end
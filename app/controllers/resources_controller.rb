class ResourcesController < ApplicationController
  before_action :signed_in_user,  only: [:create, :edit, :destroy]
  before_action :correct_user,      only: :destroy

  def index
  end

  def create
    @resource = current_user.resources.build(resource_params)
    if @resource.save
        flash[:success] = "Resource added!"
        redirect_to root_url
    else
        @feed_items = [ ]
        render 'static_pages/home'
    end
  end

  def edit
  end

  def destroy
    @resource.destroy
    redirect_to root_url
  end

private

    def resource_params
        params.require(:resource).permit(:content)
    end

    def correct_user
      @resource = current_user.resources.find_by(id: params[:id])
      redirect_to root_url if @resource.nil?
    end
end

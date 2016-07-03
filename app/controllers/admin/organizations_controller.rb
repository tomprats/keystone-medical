class Admin::OrganizationsController < AdminController
  before_action :require_admin!

  def index
    @organization = Organization.new
    @organizations = Organization.all
  end

  def edit
    @organization = Organization.find(params[:id])
    @organizations = Organization.all

    render :index
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to({ action: :index }, success: "#{@organization.name} created")
    else
      @organizations = Organization.all
      render :index, warning: @organization.errors.full_messages.join(", ")
    end
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to({ action: :index }, success: "#{@organization.name} updated")
    else
      @organizations = Organization.all
      render :index, warning: @organization.errors.full_messages.join(", ")
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to({ action: :index }, danger: "#{@organization.name} deleted")
  end

  private
  def organization_params
    params.require(:organization).permit(
      :name, :website, :description
    )
  end
end

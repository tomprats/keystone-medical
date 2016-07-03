class Admin::ProceduresController < AdminController
  def index
    @procedure = Procedure.new
    @procedures = Procedure.all
  end

  def edit
    @procedure = Procedure.find(params[:id])
    @procedures = Procedure.all

    render :index
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to({ action: :index }, success: "#{@procedure.name} created")
    else
      @procedures = Procedure.all
      render :index, warning: @procedure.errors.full_messages.join(", ")
    end
  end

  def update
    @procedure = Procedure.find(params[:id])
    if @procedure.update(procedure_params)
      redirect_to({ action: :index }, success: "#{@procedure.name} updated")
    else
      @procedures = Procedure.all
      render :index, warning: @procedure.errors.full_messages.join(", ")
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to({ action: :index }, danger: "#{@procedure.name} deleted")
  end

  private
  def procedure_params
    params[:procedure][:organization_id] = current_organization.id unless current_user.admin
    params[:procedure][:codes] = params[:procedure][:codes].split(",").collect(&:strip)
    params.require(:procedure).permit(
      :organization_id, :active,
      :rank, :name, :price, codes: []
    )
  end
end

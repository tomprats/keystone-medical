class Admin::ProceduresController < AdminController
  def index
    @procedure = Procedure.new
    @procedures = Procedure.all
  end

  def edit
    @procedure = Procedure.find(params[:id])
    @procedures = Procedure.all
    verify_record

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
    verify_record
    if @procedure.update(procedure_params)
      redirect_to({ action: :index }, success: "#{@procedure.name} updated")
    else
      @procedures = Procedure.all
      render :index, warning: @procedure.errors.full_messages.join(", ")
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    verify_record
    @procedure.destroy
    redirect_to({ action: :index }, danger: "#{@procedure.name} deleted")
  end

  private
  def procedure_params
    verify_params
    params[:procedure][:codes] = params[:procedure][:codes].split(",").collect(&:strip)
    params.require(:procedure).permit(
      :practice_id, :facility_id, :active,
      :rank, :name, :price, codes: []
    )
  end

  def verify_params
    return if current_user.admin
    ids = [params[:procedure][:practice_id], params[:procedure][:facility_id]]
    raise Error unless ids.include? current_user.organization_id
  end

  def verify_record
    return if current_user.admin
    ids = [@procedure.practice_id, @procedure.facility_id]
    raise Error unless ids.include? current_user.organization_id
  end
end

class Admin::ImportProceduresController < AdminController
  def create
    verify_params
    total = 0
    file = params[:file].read
    csv = CSV.parse(file).each do |line|
      next unless line[1] && line[1].include?("$")
      Procedure.create(procedure_params.merge(
        name: line[0].titleize.strip,
        price: line[1].delete("^0-9"),
        rank: params[:procedure][:rank] + total
      ))
      total += 1
    end
    redirect_to admin_procedures_path, success: "#{total} procedures created"
  end

  private
  def procedure_params
    params.require(:procedure).permit(
      :practice_id, :facility_id, :active, :rank
    )
  end

  def verify_params
    raise Error unless params[:file].present?
    params[:procedure][:rank] = params[:procedure][:rank].to_i
    return if current_user.admin
    ids = [params[:procedure][:practice_id], params[:procedure][:facility_id]]
    raise Error unless ids.include? current_user.organization_id
  end
end

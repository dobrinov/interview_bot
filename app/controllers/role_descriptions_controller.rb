class RoleDescriptionsController < AuthenticatedController
  def new
    @company = Company.find params[:company_id]
    @role = @company.role_descriptions.build
  end

  def create
    @company = Company.find params[:company_id]
    @role = @company.role_descriptions.build role_params

    if @role.save
      redirect_to company_path(@company), notice: 'Role created'
    else
      flash.now[:error] = 'Role not created'
      render :new
    end
  end

  def edit
    @role = RoleDescription.find params[:id]
    @company = @role.company
  end

  def update
    @role = RoleDescription.find params[:id]
    @company = @role.company

    if @role.update_attributes role_params
      flash.now[:notice] = 'Role updated.'
    else
      flash.now[:error] = 'Role not updated.'
    end

    render :edit
  end

  def destroy
    role = RoleDescription.find params[:id]
    company = role.company

    role.destroy

    redirect_to company_path(company), notice: 'Role deleted'
  end

  private

  def role_params
    params.require(:role_description).permit :name, technology_ids: []
  end
end

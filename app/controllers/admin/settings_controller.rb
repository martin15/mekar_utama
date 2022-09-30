class Admin::SettingsController < Admin::ApplicationController
  before_filter :find_setting, :only => [:edit, :update]

  def edit
  end

  def update
    if @setting.update_attributes(params[:setting])
      flash[:notice] = "Setting successfully updated"
      if params[:type] == "id"
        redirect_to admin_path
        return
      end
      redirect_to admin_edit_setting_path(@setting.name)
    else
      @category_list = Category.category_list
      flash[:error] = "Setting failed to update"
      render :action => "edit"
    end
  end

  private
    def find_setting
      if params[:type] == "id"
        @setting = Setting.find_by_id(params[:name])
      else
        @setting = Setting.find_by_name(params[:name])
      end
      if @setting.nil?
        flash[:error] = "Cannot find the Setting with name '#{params[:name]}'"
        redirect_to admin_path
      end
    end
end

class Admin::ClientsController < Admin::ApplicationController
  before_filter :find_client, :only => [:destroy, :edit, :update]

  def index
    @clients = Client.paginate(:page => params[:page], :per_page => 10,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 10
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "Client successfully created"
      redirect_to admin_clients_path
    else
      flash[:error] = "Client failed to create"
      render :action => "new"
    end
  end

  def edit; end

  def update
    if @client.update_attributes(params[:client])
      flash[:notice] = "Client successfully updated"
      redirect_to admin_clients_path
    else
      flash[:error] = "Client failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @client.destroy ? 'Client was successfully deleted.' :
                                      'Client was falied to delete.'
    redirect_to admin_clients_path
  end

  private
    def find_client
      @client = Client.find_by_id(params[:id])
      if @client.nil?
        flash[:error] = "Cannot find the Client with id '#{params[:id]}'"
        redirect_to admin_clients_path
      end
    end
end

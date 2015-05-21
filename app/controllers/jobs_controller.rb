class JobsController < ActionController::API
  def index
    render json: JobService.instance.keys
  end

  def create
    JobService.instance.create(params[:image], params[:cronline])
    render json: ''
  end

  def destroy
  end
end

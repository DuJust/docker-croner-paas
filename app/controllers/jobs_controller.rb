class JobsController < ActionController::API
  def index
    render json: JobService.instance.all.to_json
  end

  def create
    JobService.instance.create(params[:image_uri], params[:cronline])
    render json: { successful: true }
  end

  def destroy
    JobService.instance.destroy(params[:image_uri])
    render json: { successful: true }
  end
end

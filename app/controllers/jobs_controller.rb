class JobsController < ActionController::API
  rescue_from RecordInvalid, with: :handle_resource_already_exist_exception
  rescue_from RecordNotFound, with: :handle_resource_not_found_exception

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

  private

  def handle_resource_not_found_exception(error)
    render json: { successful: false, error_message: error.message }, status: :not_found
  end

  def handle_resource_already_exist_exception(error)
    render json: { successful: false, error_message: error.message }, status: :conflict
  end
end

class CronersController < ActionController::API
  def index
    render json: Croner.all
  end

  def create
    croner = Croner.new(image: params['image'], schedule: params['schedule'])
    if croner.save
      render json: { successful: true }
    else
      render json: { successful: false }
    end
  end

  def destroy
    croner = Croner.find(params['id'])
    if croner.destroy
      render json: { successful: true }
    else
      render json: { successful: false }
    end
  end
end

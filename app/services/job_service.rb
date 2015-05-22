class JobService
  include Singleton

  def all
    jobs.values
  end

  def create(image_uri, cronline, desc = '')
    raise RecordInvalid.new("Already exist image: #{image_uri}") if jobs[image_uri]
    job = Job.new(image_uri, cronline, desc)
    job.start
    jobs[image_uri] = job
  end

  def update(image_uri, status)
    raise RecordNotFound.new("Not exist image: #{image_uri}") unless jobs[image_uri]
    case status
      when 'pause'
        jobs[image_uri].pause
      when 'resume'
        jobs[image_uri].resume
      else
        raise MethodNotAllowed.new("Not allowed status: #{status}")
    end
  end

  def destroy(image_uri)
    raise RecordNotFound.new("Not exist image: #{image_uri}") unless jobs[image_uri]
    jobs[image_uri].stop
    jobs[image_uri] = nil
    jobs.compact
  end

  private

  def jobs
    @jobs ||= {}
  end
end

class JobService
  include Singleton

  def all
    jobs.values
  end

  def create(image_uri, cronline, desc = '')
    job = Job.new(image_uri, cronline, desc)
    job.start
    jobs[image_uri] = job
  end

  def destroy(image_uri)
    jobs[image_uri].stop
    jobs[image_uri] = nil
    jobs.compact
  end

  private

  def jobs
    @jobs ||= {}
  end
end

class JobService
  include Singleton

  def create(image, cronline, desc = '')
    job = Rufus::Scheduler.new
    job.cron(cronline) do
      system("docker run #{image}")
    end
    jobs[image] = cronline
  end

  def jobs
    @jobs ||= {}
  end
end

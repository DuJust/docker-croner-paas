class Job
  def initialize(image_uri, cronline, desc)
    @image_uri  = image_uri
    @cronline   = cronline
    @desc       = desc
    @scheduler  = Rufus::Scheduler.new
  end

  def start
    @scheduler.cron(@cronline) { system("docker run #{@image_uri}") }
  end

  def stop
    @scheduler.shutdown
  end

  def pause
    @scheduler.pause
  end

  def resume
    @scheduler.resume
  end

  def as_json(*)
    {
      image_uri:  @image_uri,
      cronline:   @cronline,
      desc:       @desc,
      created_at: @scheduler.started_at,
      paused:     @scheduler.paused?,
      next_time:  @scheduler.paused? ? 'nil' : @scheduler.jobs.first.try(:next_time)
    }
  end
end

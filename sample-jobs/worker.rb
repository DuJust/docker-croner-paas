require 'ffaker'

class Worker
  class << self
    def work
      puts "-----------------------------"
      puts "Ho ho ho and a bottle of rum."
      puts "I'm a #{FFaker::Job.title} and I know #{FFaker::Skill.tech_skill}."
      puts "The time is #{Time.now}"
      puts "-----------------------------"
    end
  end
end

Worker.work

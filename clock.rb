
require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  handler do |job|
    puts "Running #{job}"
    HardWorker.perform_async
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(60.seconds, 'Fetch.Entries')
 
end
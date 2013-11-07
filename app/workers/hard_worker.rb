class HardWorker
  include Sidekiq::Worker

  def perform
    puts 'Start Fetching Entires'
    
    Entry.fetch_feed_entries
    UnreadEntry.create_unread_entries
    
    puts 'Finished Fetching Entires'
  end
end
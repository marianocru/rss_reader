require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '5m' do
  Channel.all.each do |channel|
    channel.update_articles
  end
end

# name: discourse-akismet-hipchat
# about: A simple plugin to notify hipchat when the akismet plugin has new spam
# version: 0.0.1
# authors: Michael Verdi, Robin Ward
# url: https://github.com/discourse/discourse-akismet-hipchat

# install dependencies
gem 'httparty', '0.15.5'
gem 'hipchat', '1.5.4'

after_initialize do

  if ENV['NOTIFY_HIPCHAT'] && Rails.env.production?
    DiscourseEvent.on(:akismet_found_spam) do |spam_count|
      client = HipChat::Client.new(ENV['HIPCHAT_TOKEN'], :api_version => 'v2')
      room_id = ENV['HIPCHAT_ROOM_ID']
      hipchat_message = "<p> #{spam_count} new posts suspected of spam <a href='#{Discourse.base_url}/admin/plugins/akismet'>Go To Queue</a></p>"
      client[room_id].send('Forum Bot', hipchat_message, :notify => true, color: ENV['HIPCHAT_MSG_COLOR'])
    end
  end

end

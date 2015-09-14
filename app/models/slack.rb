class SlackerService
  require 'net/http'
  NAME_AND_ICON = {
      username: 'Exception Notifier',
      icon_emoji: ':bat:'
  }

  GOOD = 'good'
  WARNING = 'warning'
  DANGER = 'danger'

  def initialize(channel = ENV['SLACK_WEBHOOK_CHANNEL'])
    @uri = URI(ENV['SLACK_WEBHOOK_URL'])
    @channel = channel
  end

  def send_slack(link, application, title)
    params = {
        attachments: [
            {
                title: 'New Exception Reported',
                fallback: 'New Exception Reported',
                color: GOOD,
                fields: [
                    {
                        title: 'Link',
                        value: ENV['SITE_URL'] + "/subject/" + link,
                        short: true
                    },
                    {
                        title: 'Application',
                        value: application,
                        short: true
                    },
                    {
                        title: 'Title',
                        value: title,
                        short: false
                    }
                ]
            }
        ]
    }
    @params = generate_payload(params)
    self
  end

  def deliver
    begin
      Net::HTTP.post_form(@uri, @params)
    rescue => e
      Rails.logger.error("SlackerService: Error when sending: #{e.message}")
    end
  end

  private

  def generate_payload(params)
    {
        payload: NAME_AND_ICON
                     .merge(channel: @channel)
                     .merge(params).to_json
    }
  end
end
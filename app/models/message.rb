class Message < ActiveRecord::Base
  belongs_to :user
  before_create :send_message

  private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => '',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :To => to,
                      :From => from }
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end

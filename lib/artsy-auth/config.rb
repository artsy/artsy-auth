module ArtsyAuth
  mattr_accessor :config
end

ArtsyAuth.config = OpenStruct.new(
  artsy_url: ENV['artsy_url'] || 'http://localhost:3000',
  callback_url: ENV['callback_url'] || 'http://localhost:3000/',
  application_id: ENV['application_id'],
  application_secret: ENV['application_secret']
)

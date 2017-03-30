module ArtsyAuth
  mattr_accessor :config
end

ArtsyAuth.config = OpenStruct.new(
  artsy_url: nil,
  callback_url: '/',
  application_id: nil,
  application_secret: nil
)

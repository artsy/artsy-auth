# Artsy Authentication [![Build Status](https://travis-ci.org/artsy/artsy-auth.svg?branch=master)](https://travis-ci.org/artsy/artsy-auth)

Ruby Gem for adding Artsy's omniauth based authentication to your app.

## Installation
Add following line to your Gemfile.

```
gem 'artsy-auth'
```

## Usage
Artsy Auth is based on [`Rails::Engine`](http://api.rubyonrails.org/classes/Rails/Engine.html).

### Configure
Add `artsy_auth.rb` under `config/initializers`. We need to configure `ArtsyAuth` to use proper Artsy `application_id` and `application_secret`. Also it needs `artsy_api_url` which will be used to redirect `sign_in` and `sign_out` to proper location.
`callback_url` defines after a successful omniauth handshake, where should we get redirected to.

```ruby
# config/initializers/artsy_auth.rb
ArtsyAuth.configure do |config|
  config.artsy_api_url = 'https://stagingapi.artsy.net' # required
  config.callback_url = '/admin' # optional
  config.application_id = '321322131' # required
  config.application_secret = '123123asdasd' # required
end
```

You also need to mount session related endpoints to your app, in your `config/routes.rb`. Add following line to your current routes.
```ruby
# config/routes.rb
mount ArtsyAuth::Engine => '/'
```

In order to force authentication, you need to include 'ArtsyAuth::Authenticated' in your controller, you also need to add (override) `authorized_artsy_token?` method there which gets a token and in your app you need to define how do you authorize that token, for example:
```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # This will make sure calls to this controller have proper session data
  # if they don't it will redirect them to oauth url and once authenticated
  # on successful authentication we'll call authorized_artsy_token
  include ArtsyAuth::Authenticated

  # override application to decode token and allow only users with `tester` role
  def authorized_artsy_token?(token)
    decoded_token, _headers = JWT.decode(token, 'some-secret')
    decoded_token['roles'].include? 'tester'
  end
end
```

# Decoding the JWT

The JWT is signed using a different secret from the client secret for OAuth. For Artsy engineers: get it from the `internal_secret` on a `ClientApp` model. External engineers, send an email to ashkan@ or orta@ artsymail.com.

The JWT contains user information that you can get from an API call to get the `me` user account, you can work around not having the secret by making a request for that against the API.


# Update From Version < 0.1.7
In previous versions you would change your `ApplicationController` to inherit from `ArtsyAuth::ApplicationController`, with versions > `0.1.7` you need to `include ArtsyAuth::Authenticated` like the example above.

# Contributing

* Fork the project.
* Make your feature addition or bug fix with tests.
* Update CHANGELOG.
* Send a pull request. Bonus points for topic branches.


# frozen_string_literal: true

require 'spec_helper'

describe 'Authentication', type: :system, js: true do
  before do
    allow(OmniAuth.config).to receive(:test_mode).and_return true
    @artsy_auth = OmniAuth.config.mock_auth[:artsy]
    OmniAuth.config.mock_auth[:artsy] = OmniAuth::AuthHash.new(
      {
        'uid' => 'abc',
        'info' => { 'raw_info' => { 'email' => 'chung-yi@artsyamil.com' } },
        'credentials' => { 'token' => 'xyz' }
      }
    )
  end

  after do
    OmniAuth.config.mock_auth[:artsy] = @artsy_auth
  end

  it 'authenticates through the oauth flow' do
    expect_any_instance_of(ArtsyAuth::SessionsController).to receive(:new).and_call_original
    expect_any_instance_of(ArtsyAuth::SessionsController).to receive(:create).and_call_original

    visit '/private'

    expect(page).to have_current_path '/'
  end
end

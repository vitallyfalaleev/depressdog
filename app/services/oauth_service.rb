class OauthService
  attr_reader :auth_hash
  def initialize(auth_hash)
    @auth_hash = auth_hash
    p @auth_hash
  end
  def create_oauth_account!
    unless oauth_account = User.where(uid: @auth_hash[:uid]).first
      oauth_account = User.create!(oauth_account_params)
    end
    oauth_account
  end

  private

  def oauth_account_params
    if @auth_hash[:provider] == 'facebook'
      { uid: @auth_hash[:uid],
        provider: @auth_hash[:provider],
        image_url: @auth_hash[:info][:image],
        name: @auth_hash[:info][:name],
        password: @auth_hash[:extra][:raw_info][:id] + 'a',
        email: @auth_hash[:info][:email],
        email_confirmed: true
      }
    elsif @auth_hash[:provider] == 'linkedin'
      { uid: @auth_hash[:uid],
        provider: @auth_hash[:provider],
        image_url: @auth_hash[:info][:picture_url],
        name: @auth_hash[:info][:first_name] + " " + @auth_hash[:info][:last_name],
        password: @auth_hash[:extra][:raw_info][:id],
        email: @auth_hash[:info][:email],
        email_confirmed: true }
    end
  end
end
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create( name: auth.info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20],
                          facebook_token: auth.credentials.token,
                          facebook_expires_at: Time.at(auth.credentials.expires_at)
                        )
    end
    user
  end

  # This method simply tries to find an existing user by e-mail or create one
  # with a random password otherwise. Note that this is simply an example.
  # The application may need to take other precautions.
  # TODO: If a user auth'd first through facebook, then the next time through Google?
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      unless user
        user = User.create(name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
      end
      user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  #
  # INSTANCE METHODS
  #
  def facebook
    @facebook ||= Koala::Facebook::API.new(facebook_token)
  end
end

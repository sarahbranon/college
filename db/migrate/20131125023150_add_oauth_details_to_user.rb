class AddOauthDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_expires_at, :datetime
  end
end

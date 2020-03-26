class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :provider, :string, limit: 50, defult: '')
    add_column(:users, :uid, :string, limit: 500, defult: '')
  end
end

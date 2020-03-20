class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :provider, :string, limit: 50, null: false, defult: '')
    add_column(:users, :uid, :string, limit: 500, null: false, defult: '')
  end
end

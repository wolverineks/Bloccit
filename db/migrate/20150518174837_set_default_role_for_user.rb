class SetDefaultRoleForUser < ActiveRecord::Migration
  def change
    change_column_default(:users, :role, 'Guest')

    User.all.each do |user|
      user.role ||= 'Guest'
      user.save!
    end
  end
end

class User < ApplicationRecord
  include DC::SettingsHelper

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  def assign_default_role
    default_role = settings('defaults.permissions.new_user.role', fatal_exception: true).to_sym
    self.add_role(default_role) if self.roles.blank?
  end
end

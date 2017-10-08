class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # TODO: Move into its own concern
  include DC::SettingsHelper

  after_create :assign_default_role

  def assign_default_role
    default_role = settings('defaults.permissions.new_user.role', fatal_exception: true).to_sym
    add_role(default_role) if roles.blank?
  end
end

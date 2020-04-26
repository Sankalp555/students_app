class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin,   -> { where(admin: true)}
  belongs_to :role, optional: true

  def role?
    self.role.name rescue ''
  end

  def edit?
    return self.role.can_edit if role_id.present?
  end

  def create?
    return self.role.can_create if role_id.present?
  end

  def destroy?
    return self.role.can_destroy if role_id.present?
  end
end

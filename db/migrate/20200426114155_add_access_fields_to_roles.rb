class AddAccessFieldsToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :can_create, :boolean, default: false
    add_column :roles, :can_edit, :boolean, default: false
    add_column :roles, :can_destroy, :boolean, default: false
  end
end

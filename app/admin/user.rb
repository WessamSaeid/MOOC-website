ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    permit_params :email, :role, :password, :name, :gender, :avatar, :birth_date

    index do
        selectable_column
        id_column
        column :name
        column :email
        column :role
        column :birth_date
        column :gender
        column :sign_in_count
    
        actions
    end

    form do |f|
        f.semantic_errors 
        f.inputs :email, :password, :name, :role, :birth_date,  :gender , :avatar 
        f.actions         
    end

    filter :name
     
  
end

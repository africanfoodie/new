ActiveAdmin.register Product do

  index do 
    column :name
    column :description
    column :title
    column :stock
    column :image
    column :user
    column :category
    column "Release Date", :released_at
    column :price, :sortable => :price do |product|
      number_to_currency product.price
    end
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end

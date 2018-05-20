class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :gender, :integer, default: 0
  end
end

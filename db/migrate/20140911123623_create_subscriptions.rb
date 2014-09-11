class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.string :plan
      t.string :stripe_customer_token

      t.timestamps
    end
  end
end

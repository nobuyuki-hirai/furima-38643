class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string        :post_doce,      null: false
      t.integer       :prefecture,     null: false
      t.string        :city,           null: false
      t.string        :address,        null: false
      t.string        :build_name,     null: false
      t.string        :phone_number,   null: false
      t.references    :buy,            null: false, foreign_key: true
      t.timestamps
    end
  end
end

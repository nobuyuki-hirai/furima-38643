class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :title,              null: false
      t.integer      :price,              null: false
      t.text         :concept,            null: false
      t.integer      :category_id,        null: false
      t.integer      :condition_id,       null: false
      t.integer      :postage_payer_id,   null: false
      t.integer      :ship_area_id,       null: false
      t.integer      :ship_date_id,       null: false
      t.references   :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreatePostins < ActiveRecord::Migration[5.2]
  def change
    create_table :postins do |t|
      t.string :title
      t.string :text
      t.belongs_to :member, foreign_key: true

  end
  end
end

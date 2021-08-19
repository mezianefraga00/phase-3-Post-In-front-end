class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :datepost

  end
end
end

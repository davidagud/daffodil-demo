class CreateJoinTableFlowerWedding < ActiveRecord::Migration[5.2]
  def change
    create_join_table :flowers, :weddings do |t|
      # t.index [:flower_id, :wedding_id]
      # t.index [:wedding_id, :flower_id]
    end
  end
end

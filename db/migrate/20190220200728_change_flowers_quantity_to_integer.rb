class ChangeFlowersQuantityToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :flowers, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end

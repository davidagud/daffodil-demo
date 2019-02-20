module MasterflowersHelper

  def options_for_sort_masterflowers
    [["newest", "created_at DESC"], ["oldest", "created_at ASC"], ["a-z", "masterflower_name ASC"], ["z-a", "masterflower_name DESC"], ["highest price", "masterflower_price DESC"], ["lowest price", "masterflower_price ASC"]]
  end

end

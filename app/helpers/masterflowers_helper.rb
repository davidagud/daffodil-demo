module MasterflowersHelper

  def options_for_sort_masterflowers
    [["Newest", "created_at DESC"], ["Oldest", "created_at ASC"], ["A-Z", "masterflower_name ASC"], ["Z-A", "masterflower_name DESC"], ["Highest Price", "masterflower_price DESC"], ["Lowest Price", "masterflower_price ASC"]]
  end

end

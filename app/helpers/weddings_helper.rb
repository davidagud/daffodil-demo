module WeddingsHelper

  def options_for_completed
    [["Either", "" ], ["Completed", "true"], ["Not Completed", "false"]]
  end

  def options_for_sort
    [["Furthest"], ["Soonest"], ["Newest"], ["Oldest"], ["A-Z"], ["Z-A"]]
  end

end

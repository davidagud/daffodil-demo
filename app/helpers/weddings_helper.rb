module WeddingsHelper

  def options_for_completed
    [["Either", "true || completed == false" ], ["Completed", "true"], ["Not Completed", "false"]]
  end

  def options_for_sort
    [["Furthest", "wedding_date DESC"], ["Soonest", "wedding_date ASC"], ["Newest", "created_at DESC"], ["Oldest", "created_at ASC"], ["A-Z", "wedding_name ASC"], ["Z-A", "wedding_name DESC"]]
  end

end

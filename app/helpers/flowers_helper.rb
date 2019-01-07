module FlowersHelper

  def options_for_flowers
      masterflower_choices = []
      @masterflowers.each do |masterflower|
        masterflower_choices.push(masterflower.masterflower_name)
      end
      masterflower_choices
  end

end

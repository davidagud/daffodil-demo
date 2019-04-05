module FlowersHelper

  def options_for_flowers

    @masterflowers = Masterflower.all

      masterflower_choices = []
      @masterflowers.each do |masterflower|
        masterflower_choices.push(masterflower.masterflower_name + " - " + masterflower.vendor)
      end

      masterflower_choices

  end

end

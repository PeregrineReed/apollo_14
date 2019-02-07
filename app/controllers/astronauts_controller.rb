class AstronautsController < ApplicationController

  def index
    @astro = Astronaut.all
    @missions = Mission.ordered_missions
    @avg_age = @astro.avg_age
  end

end

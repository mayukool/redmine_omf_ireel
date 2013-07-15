require 'yaml'
require 'pry'
class BandanaController < ApplicationController
  unloadable

  def index
     show
     render('show')

  end


  def show
   @resources = YAML::load(File.open("#{RAILS_ROOT}/config/app_config.yml"))
    @resources = @resources["resources"].first["nodes"].each { |v| puts v }
  end

  def load_node
     @nodes_tobe_loaded = params[:rn]
     nodes = @nodes_tobe_loaded * " "
     @image_tobe_loaded = params[:itm]
     @variable = `screen -d -L -m env -i bash --noprofile --norc /home/mkulkarni/script.sh #{nodes}`
  end

 def save_node
   @id = params[:id]
   render ('save_node')
 end

 def screen_log
  @log = `tail -20 screenlog.0`
  render(:text => @log)
 end

end





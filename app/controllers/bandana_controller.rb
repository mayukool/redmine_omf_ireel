require 'yaml'
require 'pry'
class BandanaController < ApplicationController
  unloadable
# @@ids = [1,2,3]

#before_filter :configure_resources

  def index
    # active_ids = params[:r].collect{|id| puts id}
     show
     render('show')
     # render(:text => "Hello NICTA!!")
    # @array = [1,2,3,4,5]
   # @resources = AppConfig.resources.first
 # @resources = YAML::load(File.open("#{RAILS_ROOT}/config/app_config.yml"))
 # @resources = @resources["resources"].first["nodes"].each { |v| puts v }
    # render ('bandana/configure_resources')
    # render ('bandana/hello')
     # redirect_to(:action => 'other_hello')
      # render ('bandana/other_hello')

  end


  def other_hello
      render(:text => "Hello NICTA!!")
  end


  def configure_resources
     @resources = YAML::load(File.open("#{RAILS_ROOT}/config/app_config.yml"))
     render(:text => "Testing YAML!!")
     
  end


  def show
   @resources = YAML::load(File.open("#{RAILS_ROOT}/config/app_config.yml"))
    @resources = @resources["resources"].first["nodes"].each { |v| puts v }
    
   end

  def load_node
     # render(:text => "Hello NICTA!!")
     @nodes_tobe_loaded = params[:rn]
     @image_tobe_loaded = params[:itm]
     # @variable = `omf-5.4 load -i @image_tobe_loaded -t @nodes_tobe_loaded.join(',')`
     #@opi = `ls -lrth`
     @variable = `screen -d -L -m env -i bash --noprofile --norc /home/mkulkarni/script.sh omf.nicta.node16 omf.nicta.node17 omf.nicta.node18`
     # @variable = `omf-5.4 load -i baseline.ndz -t omf.nicta.node16,omf.nicta.node17,omf.nicta.node18`
     # system("omf-5.4 load -i #{@image_tobe_loaded} -t #{@nodes_tobe_loaded.join(',')}")
    # params[:rn].each {|x| render (:text => 'x')}	
    #if (params[:rn]. == '1')
     #render(:text => "Node 1 selected")
    # end
  end

 def save_node
   @id = params[:id]
   render ('save_node')
 end

 def screen_log
  @log = `tail -20 screenlog.0`
  render(:text => @log)
  #render file: "/home/mkulkarni/redmine/screenlog.0"
  # render(:text => "Node 1 selected")
  # @ls = `ls -lrth`
 # <%=  @ls %> <br />
   # @log = `IO.foreach("screenlog.0") {|block| puts block}`
 # <%=  @log %> <br />
  # render ('screen_log')

 # <%= link_to("O/P Log", {:controller => 'bandana', :action => 'screen_log'}) %>


 end

end


# <%= link_to("My first link", {:controller => 'bandana', :action => 'other_hello'}) %>

# <%= link_to("Loads", {:controller => 'bandana', :action => 'loads'} %>

# <div class="form-buttons">
     # <%= submit_tag("Load") %>
     # <%= submit_tag("Save") %>
    # </div>

# <%= check_box_tag 'resource_ids[]', r.id, false, :id => 'resource_#{r.id}' %>

#<% Dir.glob('/var/lib/omf-images/*.ndz') do |items| %>
 # <%= "Image: #{items}" %><br />
# <% end %>


 # <% unless @ids.nil? %>
 # <% @ids.each do |num| %>
 # c<%= num %>
 # <% end %>

#<% Dir.foreach('/var/lib/omf-images') do |item| %>
 #<%  next if item == '.' or item == '..' %>
  #  <div class="form-buttons">
     # <%= submit_tag("#{item}") %>
   # </div> <br />
# <% end  %>


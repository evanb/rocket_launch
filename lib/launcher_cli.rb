require 'rubygems'
require 'highline/import'
require File.dirname(__FILE__) + '/launcher'

launcher = Launcher.new
while true
  choose do |menu|
    menu.prompt = "Launch command:  "
    menu.choice :stop do launcher.stop end
    menu.choice :left do launcher.left end
    menu.choice :right do launcher.right end
    menu.choice :up do launcher.up end
    menu.choice :down do launcher.down end
    menu.choice :fire do launcher.fire end
  end
end


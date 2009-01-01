require 'rubygems'
require File.dirname(__FILE__) + '/usb_device'
require File.dirname(__FILE__) + '/usb_constants'

class Launcher

  include UsbConstants

  def initialize 
    @device = UsbDevice.new
  end
  
  def stop
    @device.send_command(STOP)
  end

  def left
    @device.send_command(LEFT)
  end
  
  def right
    @device.send_command(RIGHT)
  end
  
  def up
    @device.send_command(UP)
  end

  def down
    @device.send_command(DOWN)
  end
  
  def fire
    @device.send_command(FIRE)
  end  
  
end

require 'rubygems'
require 'usb'
require File.dirname(__FILE__) + '/usb_constants'

class UsbDevice

  include UsbConstants

  def initialize
    @device = get_usb_device()
    @handle = get_usb_interface(@device)
  end

  def get_usb_device
    device = USB.devices.find {|d| d.idProduct == PRODUCT_ID and d.idVendor == VENDOR_ID }
    raise USBDeviceNotFoundError if device.nil?
    return device
  end

  def get_usb_interface(device)
    handle = device.open
    raise CannotOpenDeviceError if handle.nil?

    retries = 0
    begin
      error_code = handle.usb_claim_interface(INTERFACE)
      raise "Cannot claim interface" unless error_code.nil?
    rescue CannotClaimInterfaceError
      handle.usb_detach_kernel_driver_np(INTERFACE);
      if retries.zero? 
        retries += 1
        retry
      else
        raise $!
      end
    end
    
    error_code = handle.set_altinterface(0)
    raise CannotSetAlternativeInterfaceError unless error_code.nil?

    handle
  end

  def send_command(command)
  
    # python: controlMsg(requestType, request, buffer, value=0, index=0, timeout=100) -> bytesWritten|buffer
    # ruby: USB::DevHandle#usb_control_msg(requesttype, request, value, index, bytes, timeout) 
  
    @handle.usb_control_msg(0x21, 0x09, 0x02, 0x01, INITA.pack('C*'), 100)
    @handle.usb_control_msg(0x21, 0x09, 0x02, 0x01, INITB.pack('C*'), 100)
    @handle.usb_control_msg(0x21, 0x09, 0x02, 0x01, (command + CMDFILL).pack('C*'), 100)
  end
  
  class USBDeviceNotFoundError              < StandardError; end
  class CannotOpenDeviceError               < StandardError; end
  class CannotClaimInterfaceError           < StandardError; end
  class CannotSetAlternativeInterfaceError  < StandardError; end
    
end

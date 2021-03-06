module UsbConstants

  STOP      = [ 0,  0,  0,  0,  0,  0]
  LEFT      = [ 0,  1,  0,  0,  0,  0]
  RIGHT     = [ 0,  0,  1,  0,  0,  0]
  UP        = [ 0,  0,  0,  1,  0,  0]
  DOWN      = [ 0,  0,  0,  0,  1,  0]
  LEFTUP    = [ 0,  1,  0,  1,  0,  0]
  RIGHTUP   = [ 0,  0,  1,  1,  0,  0]
  LEFTDOWN  = [ 0,  1,  0,  0,  1,  0]
  RIGHTDOWN = [ 0,  0,  1,  0,  1,  0]
  FIRE      = [ 0,  0,  0,  0,  0,  1]

  PRODUCT_ID = 0x0202
  VENDOR_ID = 0x1130
  INTERFACE = 0x01

  INITA     = [85, 83, 66, 67,  0,  0,  4,  0]
  INITB     = [85, 83, 66, 67,  0, 64,  2,  0]
  CMDFILL   = [ 8,  8,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0,
                0,  0,  0,  0,  0,  0,  0,  0]

end


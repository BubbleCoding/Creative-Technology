# This class reads the usb port on a raspberry pi. It dose not work on other devices
ser = serial.Serial(port='COM5', baudrate=9600, bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, timeout=2)
try:
    ser.isOpen()
    print("Serial port is open")
except:
    print("ERROR")
    exit()

if (ser.isOpen()):
    try:
        while (True):
            print(ser.read())
    except:
        print("error")
else:
    print("Cannot open serial port")
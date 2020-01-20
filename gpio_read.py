import RPi.GPIO as GPIO
import time
import sys

if __name__ == '__main__':
	gpio_pin = int(sys.argv[1])

	GPIO.setmode(GPIO.BCM)
	GPIO.setup(gpio_pin,GPIO.IN)

	old_state = GPIO.LOW
	try:
		while True:
			state = GPIO.input(gpio_pin)
			if(state == GPIO.LOW and old_state == GPIO.HIGH):
				try:
					f = open("/tmp/mm_path")
					path = f.read()
					f.close()

					if(len(path) > 0):
						path = path.split('\n')
						fmm = open(path[0]+"/mm", "w")
						fmm.close()
				except Exception as e:
					print(e)
					pass
			time.sleep(0.01)
			old_state = state
	except KeyboardInterrupt:
		GPIO.cleanup()

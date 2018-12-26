from mycroft import MycroftSkill, intent_file_handler
from mycroft.util import wait_while_speaking
import time

class Airplay(MycroftSkill):
    def __init__(self):
        MycroftSkill.__init__(self)

    def get_intro_message(self):
    	#Inform the user about the rreboot
    	self.speak_dialog("reboot")
    	#wait until message completed
    	wait_while_speaking()
    	#wait 3 seconds
    	time.sleep(3)
    	#reboot
    	
    	return None

def create_skill():
    return Airplay()


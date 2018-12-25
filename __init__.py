from mycroft import MycroftSkill, intent_file_handler


class Airplay(MycroftSkill):
    def __init__(self):
        MycroftSkill.__init__(self)

    @intent_file_handler('airplay.intent')
    def handle_airplay(self, message):
        self.speak_dialog('airplay')


def create_skill():
    return Airplay()


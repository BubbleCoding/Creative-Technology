# The obstacle class takes care obstacle health and location

from sprites import Sprites


class Obstacle:

    def __init__(self, location, screen):
        self.sprites = Sprites()
        self.location = location
        self.gameWindow = screen
        self.damage = 0

    def obstacle_health(self):  # all obstacle can be damaged by skeletons
        self.damage += 1
        return self.damage

    def draw_obstacle(self):
        self.sprites.obstacle(self.gameWindow, self.location, self.damage)

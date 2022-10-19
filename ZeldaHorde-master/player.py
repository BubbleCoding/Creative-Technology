# The player class takes care of player movement, health and attacks

import pygame
import numpy

from constants import Constants
from sprites import Sprites


class Player:

    def __init__(self, screen):
        self.myFont = pygame.font.Font('freesansbold.ttf', 45)
        self.health = 100
        self.location = (10, 10)
        self.timer = 0
        self.gameWindow = screen
        self.sprites = Sprites()
        self.building = False

    def handle_movement(self, time, moves, obstacles, border):
        moveList = moves
        obstacle_list = obstacles + border
        self.building = moveList[8]
        old_location = self.location
        direction = ((-moveList[0] + moveList[1]), (-moveList[2] + moveList[3]))  # direction sum of the move keys
        new_location = tuple(numpy.add(self.location, direction))
        if time > self.timer + Constants.playerSpeed:  # move the play after playerSpeed time
            self.timer = time
            if new_location in obstacle_list:  # If the player wanted to move into a obstacle don't move him
                self.location = old_location
            else:
                self.location = new_location

    def sword_attack(self, moves): # generate location of attack
        moveList = moves
        if moveList[4]:
            attack_location = tuple(numpy.add(self.location, (-1, 0)))
        elif moveList[5]:
            attack_location = tuple(numpy.add(self.location, (1, 0)))
        elif moveList[6]:
            attack_location = tuple(numpy.add(self.location, (0, -1)))
        elif moveList[7]:
            attack_location = tuple(numpy.add(self.location, (0, 1)))
        return attack_location

    def health_handle(self):  # update health
        self.health -= 1

    def check_death(self):
        if self.health <= 0:
            return True

    def draw_player(self):
        self.sprites.player(self.gameWindow, self.location, self.building)
        self.sprites.health(self.gameWindow, self.health)





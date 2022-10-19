# AI&P Final Project Rover Vos S2161702 group 21
# Sadly I couldn't finish the program. I broke the skull AI somewhere along the way on the last day.
# I was trying to reduce calculation time by having a cap on the depth and remembering steps.
# Furthermore I couldn't manage to implement my physical interaction. After about 10 hours of research of which 5 with
# student assistants we couldn't figure out how to make it work. In the end we were able to receive the correct data
# on our raspberry pi console, but not in pycharm. It gave empty byte strings(class thing does this on a raspberry pi).


import pygame
import random
from constants import Constants
from sprites import Sprites
from handler import Handle
from skeleton import Skeleton
from skull import Skull
from bat import Bat
from player import Player
from obstacle import Obstacle
from menu import Menu


class Game:

    def __init__(self):
        pygame.init()

        self.myFont = pygame.font.Font('freesansbold.ttf', 45)
        self.clock = pygame.time.Clock()
        self.size = (Constants.window_width, Constants.window_height)
        self.gameWindow = pygame.display.set_mode(self.size)
        self.run = False
        self.intermission = True
        self.intermission_timer = 0

        # create
        self.obstacle_list = []  # a list of all obstacle objects
        self.obstacle_location_list = []  # a list of all obstacle locations
        self.border_list = []

        self.monster_list = []

        self.position_list = []  # a list of all position objects

        self.skull_list = []  # a list of all skull objects
        self.skull_location_list = []  # a list of all skull locations

        self.skeleton_list = []  # a list of all skeleton objects
        self.skeleton_location_list = []  # a list of all skeleton locations

        self.bat_list = []  # a list of all skeleton objects
        self.bat_location_list = []  # a list of all skeleton locations

        self.initial_border()  # create starting skeletons, walls and border
        self.initial_monsters()
        self.move_list = [False, False, False, False, False, False, False, False, False, False, False]  # key states
        #               [left, right, up, down, a, d, w, s, space]

        # self.building = False  # is the player in building mode or attack mode

        # create objects of classes
        self.handler = Handle()
        self.sprites = Sprites()
        self.player = Player(self.gameWindow)
        self.menu = Menu()

        self.time = 0  # internal clock
        self.skeleton_timer = 0  # last time the skeletons moved
        self.skull_timer = 0  # last time the skulls moved
        self.bat_timer = 0  # last time the bats moved
        self.score = 0

    def game_loop(self):
        self.clock.tick(Constants.FPS)
        self.state()  # state machine
        self.move_list = self.handler.handle_events(self.move_list)  # state of all keys
        self.draw_components()
        self.place_obstacle()  # gives the player the option to place a obstacle when building = true
        self.player.handle_movement(self.time, self.move_list, self.obstacle_location_list, self.border_list)
        self.time = pygame.time.get_ticks()
        self.update()  # update monsters

    def draw_background(self):  # draw the background
        for x in range(0, Constants.window_width, Constants.tileSize):
            for y in range(0, Constants.window_height, Constants.tileSize):
                self.sprites.floor_draw(self.gameWindow, (x, y))

    def initial_border(self):
        #  border
        for i in range(Constants.window_width):
            self.border_list.append((i, -1))
            self.border_list.append((i, Constants.window_height / Constants.tileSize))
        for i in range(Constants.window_height):
            self.border_list.append((-1, i))
            self.border_list.append((Constants.window_width / Constants.tileSize, i))
        #  initial obstacles
        for i in range(10):
            self.obstacle_list.append(Obstacle((10 + i, 15), self.gameWindow))
        for i in range(4):
            self.border_list.append((i + 28, 0))

    def initial_monsters(self):
        # add x skeletons
        for i in range(0):
            randomX = random.randrange(0, Constants.grid_width)
            randomY = random.randrange(0, Constants.grid_height)
            self.skeleton_list.append(Skeleton((randomX, randomY), self.gameWindow))
        # add x skulls
        for i in range(0):
            randomX = random.randrange(0, Constants.grid_width)
            randomY = random.randrange(0, Constants.grid_height)
            self.skull_list.append(Skull((randomX, randomY), self.gameWindow))
        # add x bats
        for i in range(1):
            randomX = random.randrange(0, Constants.grid_width)
            randomY = random.randrange(0, Constants.grid_height)
            self.bat_list.append(Bat((randomX, randomY), self.gameWindow))

    def update(self):
        # reset all lists
        self.monster_list = []
        self.bat_location_list = []
        self.skull_location_list = []
        self.skeleton_location_list = []
        self.obstacle_location_list = []
        for skull in self.skull_list:  # fill skull_location_list with skull locations
            self.monster_list.append(skull.location)
            self.skull_location_list.append(skull.location)
        for skeleton in self.skeleton_list:  # fill skeleton_location_list with skeleton locations
            self.monster_list.append(skeleton.location)
            self.skeleton_location_list.append(skeleton.location)
        for bat in self.bat_list:  # fill bat_location_list with bat locations
            self.monster_list.append(bat.location)
            self.bat_location_list.append(bat.location)
        for obstacle in self.obstacle_list:  # fill obstacle_location_list with skeleton locations
            self.obstacle_location_list.append(obstacle.location)

        # update skeletons if enough time has passed
        if self.time > self.skeleton_timer + Constants.skeleton_speed:
            self.skeleton_timer = self.time  # reset skeleton_timer

            for skeleton in self.skeleton_list:  # calculate and update next action of skeletons
                index = self.monster_list.index(skeleton.location)
                update = skeleton.handle_skeleton_movement(self.player.location, self.obstacle_list,
                                                           self.obstacle_location_list, self.monster_list)
                if update[1]:  # if best next location is an obstacle attack it
                    update[0].obstacle_health()
                    if update[0].damage == 5:  # if obstacle toke 5 damage remove it
                        self.obstacle_list.remove(update[0])
                else:
                    self.monster_list[index] = update[0]  # move skeleton
                # index += 1
        # update skull if enough time has passed
        if self.time > self.skull_timer + Constants.skull_speed:  # if skeletons didn't move for skeleton_speed time
            self.skull_timer = self.time  # reset skeleton_timer
            for skull in self.skull_list:
                index = self.monster_list.index(skull.location)
                skull.handle_skull_movement(self.player.location,
                                            (self.monster_list + self.obstacle_location_list + self.border_list))
                self.monster_list[index] = skull.location  # move skull
        #  update bat if enough time has passed
        if self.time > self.bat_timer + Constants.bat_speed:  # if skeletons didn't move for skeleton_speed time
            self.bat_timer = self.time  # reset skeleton_timer
            for bat in self.bat_list:
                index = self.monster_list.index(bat.location)
                bat.handle_bat_movement(self.player.location,
                                        (self.monster_list + self.obstacle_location_list + self.border_list), self.time)
                self.monster_list[index] = bat.location  # move bat
        if self.player.location in self.monster_list:
            self.player.health_handle()

    def place_obstacle(self):
        # place obstacle
        if self.move_list[4] or self.move_list[5] or self.move_list[6] or self.move_list[7]:  # if direct key is pressed
            if self.player.building:  # if player is in building mode place an obstacle
                self.obstacle_list.append(
                    Obstacle(self.player.sword_attack(self.move_list), self.gameWindow))
                self.obstacle_location_list.append(self.player.sword_attack(self.move_list))

    def draw_components(self):  # draw all the components of the game
        self.draw_background()  # draw the grid
        self.kill_monster()  # sadly this is here because of ordering issues
        # draw player
        self.player.draw_player()
        # draw obstacles
        for i in self.obstacle_list:
            i.draw_obstacle()
        # draw skeletons
        for i in self.skeleton_list:
            i.draw_skeleton()
        # draw skull
        for i in self.skull_list:
            i.draw_skull()
        for i in self.bat_list:
            i.draw_bat()

        pygame.display.update()

    def kill_monster(self):
        if not self.player.building:  # if player not in building mode
            if self.move_list[4] or self.move_list[5] or self.move_list[6] or self.move_list[7]:  # if a directional key is pressed
                attack_location = self.player.sword_attack(self.move_list)  # generate direction of attack
                if attack_location in self.skeleton_location_list:  # check if attack location is the same as the location of a skeleton
                    attack_index = self.skeleton_location_list.index(attack_location)
                    if len(self.skeleton_list) >= attack_index:  # in case that the attack_index goes out of bounce
                        del self.skeleton_location_list[attack_index]  # remove skeleton
                        del self.skeleton_list[attack_index]  # remove skeleton
                        self.score += 1
                if attack_location in self.skull_location_list:  # check if attack location is the same as the location of a skull
                    attack_index = self.skull_location_list.index(attack_location)
                    if len(self.skull_list) >= attack_index:  # in case that the attack_index goes out of bounce
                        del self.skull_location_list[attack_index]  # remove skull
                        del self.skull_list[attack_index]  # remove skull
                        self.score += 2
                if attack_location in self.bat_location_list:  # check if attack location is the same as the location of a bat
                    attack_index = self.bat_location_list.index(attack_location)
                    if len(self.bat_list) >= attack_index:  # in case that the attack_index goes out of bounce
                        del self.bat_location_list[attack_index]  # remove bat
                        del self.bat_list[attack_index]  # remove bat
                        self.score += 3
                self.sprites.sword_attack(self.gameWindow, attack_location)  # draw the attack

    def state(self):
        while self.move_list[9]:  # pause the game
            self.move_list = self.handler.handle_events(self.move_list)  # state of all keys
            self.menu.pause(self.gameWindow, self.myFont)
        while not self.run:  # start the game from start screen
            self.move_list = self.handler.handle_events(self.move_list)  # state of all keys
            if self.move_list[9]:
                self.run = True
                self.move_list[9] = False
            self.menu.start(self.gameWindow, self.myFont)
        while self.player.check_death():
            self.move_list = self.handler.handle_events(self.move_list)  # state of all keys
            self.menu.death(self.gameWindow, self.myFont, self.score)
        if not self.skull_list and not self.skeleton_list and not self.bat_list:
            #  intermission breathing room between the waves of monsters
            if self.intermission:
                self.intermission = False
                self.intermission_timer = self.time
            if self.time >= self.intermission_timer + 20000:
                if self.player.health < 80:
                    self.player.health += 20
                else:
                    self.player.health = 100
                self.initial_monsters()
                self.intermission = True


if __name__ == "__main__":
    game = Game()
    while True:
        game.game_loop()

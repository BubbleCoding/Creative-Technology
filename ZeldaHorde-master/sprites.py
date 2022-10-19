# the sprites class takes care of all sprites with the pyganim library

# all sprites used can be found here and all credit goes to the creator. All the sprites are free to use.
# https://opengameart.org/content/lpc-hanging-signs
# https://www.raventalestudio.com/post/172993340061/daily-doodles-cc0-asset-pack-has-been-expanded
# https://deadlyessence.itch.io/free-tilesets
# https://untiedgames.itch.io/floating-skull-enemy
# https://www.pixilart.com/art/health-bar-sprite-sheet-04dbaae0250b710
# https://edermunizz.itch.io/free-pixel-art-forest/download/eyJleHBpcmVzIjoxNTc5NjIzNzA0LCJpZCI6MTIxNjU4fQ%3d%3d.omWU1%2fbyni343qXSxkLhqJND2%2bA%3d
# https://opengameart.org/content/bat-sprite
# https://opengameart.org/content/pseudo-a-25d-roguelike-skeleton-sprite-sheet

import pyganim
from constants import Constants


class Sprites:
    def __init__(self):
        self.timer = 0
        self.play = False
        self.player_switch = 10000  # speed of which the sprite switches between images in milliseconds
        # generate a sprite object
        self.player_animation = pyganim.PygAnimation([('character/armour01magiciansrobe.png', self.player_switch),
                                                      ('character/armour02whiteshirt.png', self.player_switch),
                                                      ('character/armour03velvetoutfit.png', self.player_switch),
                                                      ('character/armour04chainmail.png', self.player_switch),
                                                      ('character/armour05monksrobe.png', self.player_switch),
                                                      ('character/armour05platemail.png', self.player_switch),
                                                      ('character/armour07leatherjerkin.png', self.player_switch)])
        self.monster_switch = 100
        self.fire_skull_animation = pyganim.PygAnimation([('monster/frame0000.png', self.monster_switch),
                                                          ('monster/frame0001.png', self.monster_switch),
                                                          ('monster/frame0002.png', self.monster_switch),
                                                          ('monster/frame0003.png', self.monster_switch),
                                                          ('monster/frame0004.png', self.monster_switch),
                                                          ('monster/frame0005.png', self.monster_switch),
                                                          ('monster/frame0006.png', self.monster_switch),
                                                          ('monster/frame0007.png', self.monster_switch),
                                                          ('monster/frame0008.png', self.monster_switch),
                                                          ('monster/frame0009.png', self.monster_switch),
                                                          ('monster/frame0010.png', self.monster_switch),
                                                          ('monster/frame0012.png', self.monster_switch),
                                                          ('monster/frame0013.png', self.monster_switch),
                                                          ('monster/frame0014.png', self.monster_switch),
                                                          ('monster/frame0015.png', self.monster_switch)])
        self.skeleton_switch = 100
        self.skeleton_animation = pyganim.PygAnimation([('monster/skeleton1.png', self.skeleton_switch),
                                                        ('monster/skeleton2.png', self.skeleton_switch),
                                                        ('monster/skeleton3.png', self.skeleton_switch)])
        self.bat_switch = 100
        self.bat_animation = pyganim.PygAnimation([('monster/bat1.png', self.bat_switch),
                                                   ('monster/bat2.png', self.bat_switch),
                                                   ('monster/bat3.png', self.bat_switch),
                                                   ('monster/bat2.png', self.bat_switch)])
        self.sword_switch = 500
        self.sword_animation = pyganim.PygAnimation([('character/weapon01crystalsword.png', self.sword_switch),
                                                     ('character/weapon02dagger.png', self.sword_switch),
                                                     ('character/weapon03longsword.png', self.sword_switch),
                                                     ('character/weapon04rustyflail.png', self.sword_switch),
                                                     ('character/weapon04rustyflail.png', self.sword_switch),
                                                     ('character/weapon05doubleaxe.png', self.sword_switch),
                                                     ('character/weapon07spear.png', self.sword_switch)])
        self.attack_mode_animation = pyganim.PygAnimation([('character/attack_mode.png', 2000),
                                                           ('character/inn_mode.png', 500)])
        self.build_mode_animation = pyganim.PygAnimation([('character/build_mode.png', 2000),
                                                          ('character/inn_mode.png', 500)])
        self.wall = pyganim.PygAnimation([('character/wall.png', 2000),
                                          ('character/wall.png', 500)])
        self.wall_damaged = pyganim.PygAnimation([('character/wall_damaged.png', 500),
                                                  ('character/wall.png', 500)])
        self.floor = pyganim.PygAnimation([('character/floor.png', 500),
                                           ('character/floor.png', 500)])
        self.health1_animation = pyganim.PygAnimation([('health/health 1.png', 2000),
                                                       ('health/health 2.png', 500)])
        self.health2_animation = pyganim.PygAnimation([('health/health 2.png', 2000),
                                                       ('health/health 3.png', 500)])
        self.health3_animation = pyganim.PygAnimation([('health/health 3.png', 2000),
                                                       ('health/health 4.png', 500)])
        self.health4_animation = pyganim.PygAnimation([('health/health 4.png', 2000),
                                                       ('health/health 5.png', 500)])
        self.health5_animation = pyganim.PygAnimation([('health/health 5.png', 2000),
                                                       ('health/health 6.png', 500)])
        self.background = pyganim.PygAnimation([('character/background.png', 2000),
                                                ('character/background.png', 500)])
        # turn the sprite object into a playable sprite
        self.player_animation.play()
        self.sword_animation.play()
        self.attack_mode_animation.play()
        self.build_mode_animation.play()
        self.wall.play()
        self.wall_damaged.play()
        self.fire_skull_animation.play()
        self.skeleton_animation.play()
        self.bat_animation.play()
        self.floor.play()
        self.health1_animation.play()
        self.health2_animation.play()
        self.health3_animation.play()
        self.health4_animation.play()
        self.health5_animation.play()
        self.background.play()

    def floor_draw(self, game, location):
        self.floor.blit(game, location)

    def player(self, game, location, building):
        self.player_animation.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

        if not building:  # draw player attack or building state sign
            self.attack_mode_animation.blit(game, (928, 29))
        else:
            self.build_mode_animation.blit(game, (928, 29))

    def skeleton(self, game, location):
        self.skeleton_animation.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

    def bat(self, game, location):
        self.bat_animation.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

    def skull(self, game, location):
        self.fire_skull_animation.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

    def obstacle(self, game, location, damage):
        if damage > 2:
            self.wall_damaged.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))
        else:
            self.wall.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

    def sword_attack(self, game, location):
        self.sword_animation.blit(game, (location[0] * Constants.tileSize, location[1] * Constants.tileSize))

    def health(self, game, health):  # draw the health bar with different sprites at different health levels
        if health > 80:
            self.health1_animation.blit(game, (896, 0))
        elif health > 60:
            self.health2_animation.blit(game, (896, 0))
        elif health > 40:
            self.health3_animation.blit(game, (896, 0))
        elif health > 20:
            self.health4_animation.blit(game, (896, 0))
        else:
            self.health5_animation.blit(game, (896, 0))

    def background_draw(self, game):
        self.background.blit(game, (0, 0))

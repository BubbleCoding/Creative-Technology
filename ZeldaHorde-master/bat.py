from location import Location
from sprites import Sprites
from constants import Constants
import numpy
import bisect


class Bat:
    def __init__(self, location, screen):
        self.sprites = Sprites()
        self.gameWindow = screen
        self.location = location
        self.all_seen = []
        self.all_visited = []
        self.counter = 0
        self.obstacle = False
        self.timer = Constants.bat_speed

    def handle_bat_movement(self, target, monster_list, time):
        if time >= self.timer + Constants.bat_speed * 4:
            self.counter = 0
            self.all_seen = []
            self.all_visited = []
            previous_element_grid = self.location
            previous_element_object = Location(self.location)
            previous_element_object.update(previous_element_object, target, self.obstacle)
            next_move = self.possible_movement(previous_element_grid, previous_element_object, target, monster_list)
            while next_move.parent.parent != next_move.parent:
                next_move = next_move.parent
            if next_move.location in monster_list:
                self.timer = time
            self.location = next_move.location

    def possible_movement(self, previous_element_grid, previous_element_object, target, monster_list):
        previous_element_grid = previous_element_grid
        previous_element_object = previous_element_object
        while target != previous_element_grid:
            if target == previous_element_grid:
                return previous_element_object
            else:
                self.all_visited.append(previous_element_grid)
                move_start = numpy.subtract(previous_element_grid, (1, 1))
                possible_moves_grid = []
                possible_moves_object = []
                for width in range(3):
                    for height in range(3):
                        possible_moves_grid.append(tuple(numpy.add(move_start, (width, height))))
                possible_moves_grid.remove(previous_element_grid)
                for i in possible_moves_grid:
                    if i in self.all_visited:
                        possible_moves_grid.remove(i)
                for i in possible_moves_grid:
                    bisect.insort(possible_moves_object, Location(i))
                for i in possible_moves_object:
                    if i.location in monster_list:
                        self.obstacle = True
                        i.update(previous_element_object, target, self.obstacle)
                    else:
                        self.obstacle = False
                        i.update(previous_element_object, target, self.obstacle)
                    bisect.insort(self.all_seen, i)
                previous_element_object = self.all_seen.pop(0)
                previous_element_grid = previous_element_object.location
                self.counter += 1
                if self.counter >= 30:  # maximum amount of calculations
                    break
        return previous_element_object

    def draw_bat(self):
        self.sprites.bat(self.gameWindow, self.location)

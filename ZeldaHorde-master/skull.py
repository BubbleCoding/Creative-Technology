# The skull class takes care of skull movement through a*

from location import Location
from sprites import Sprites
import numpy
import bisect


class Skull:

    def __init__(self, location, screen):
        self.sprites = Sprites()
        self.gameWindow = screen
        self.location = location
        self.all_seen = []
        self.all_visited = []
        self.counter = 0
        self.far_away = False
        self.semi_away = False
        self.memory_moves = []

    def handle_skull_movement(self, target, monster_list):
        if not self.memory_moves:  # If there are still instructions left do those first
            self.counter = 0
            self.all_seen = []
            self.all_visited = []
            previous_element_grid = self.location
            previous_element_object = Location(self.location)
            previous_element_object.update(previous_element_object, target, False)  # update values of object
            next_move = self.possible_movement(previous_element_grid, previous_element_object, target, monster_list)
            self.memory()
            self.memory_move(next_move)
        if self.memory_moves:
            self.location = self.memory_moves.pop(-1).location

    def possible_movement(self, previous_element_grid, previous_element_object, target, monster_list):
        previous_element_grid = previous_element_grid
        previous_element_object = previous_element_object
        while target != previous_element_grid:  # look for the player
            if target == previous_element_grid:
                return previous_element_object
            else:
                self.all_visited.append(previous_element_grid)
                move_start = numpy.subtract(previous_element_grid, (1, 1)) # get the location value of top left corner is a 3x3 grid with monster in the middle
                possible_moves_grid = []
                possible_moves_object = []
                for width in range(3):
                    for height in range(3):
                        possible_moves_grid.append(tuple(numpy.add(move_start, (width, height)))) # get all possible moves
                for i in possible_moves_grid:
                    if i not in monster_list:
                        bisect.insort(possible_moves_object, Location(i))  # add all legal moves to possible_moves_object list
                for i in possible_moves_object:  # update all values of objects in possible_moves_object list
                    i.update(previous_element_object, target, False)
                    bisect.insort(self.all_seen, i)
                previous_element_object = self.all_seen.pop(0)  # get object with lowest  cost
                previous_element_grid = previous_element_object.location
                self.counter += 1
                if self.counter >= 20:  # After x iterations stop
                    return previous_element_object
        return previous_element_object

    def memory(self):  # if the player is far away remember a number of moves
        if self.counter > 50:
            self.far_away = True
            self.semi_away = False
        elif self.counter > 25:
            self.semi_away = True
            self.far_away = False
        else:
            self.far_away = False
            self.semi_away = False

    def memory_move(self, next_move):  # if the player is far away remember a number of moves
        if self.far_away:
            while next_move.parent.parent != next_move.parent:
                if len(self.memory_moves) == 15:
                    self.memory_moves.pop(0)
                self.memory_moves.append(next_move)
                next_move = next_move.parent
        elif self.semi_away:
            while next_move.parent.parent != next_move.parent:
                if len(self.memory_moves) == 10:
                    self.memory_moves.pop(0)
                self.memory_moves.append(next_move)
                next_move = next_move.parent
        else:
            while next_move.parent.parent != next_move.parent:
                next_move = next_move.parent
            self.memory_moves.append(next_move)

    def draw_skull(self):
        self.sprites.skull(self.gameWindow, self.location)

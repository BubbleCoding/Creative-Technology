# The skeleton class takes care of skeleton movement through greedy

import numpy
from sprites import Sprites


class Skeleton:
    def __init__(self, location, screen):
        self.sprites = Sprites()
        self.gameWindow = screen
        self.location = location

    def handle_skeleton_movement(self, player, obstacles, obstacles_location, monster_locations):
        next_move = self.possible_skeleton_movement(player, monster_locations)
        if (tuple(next_move[0])) in obstacles_location:  # If the location the greedy algorithm picked was a obstacle
            index = obstacles_location.index(tuple(next_move[0]))
            return [obstacles[index], True]  # return old location and a true value which means that it was a obstacle
        else:
            self.location = tuple(next_move[0])
            return [tuple(next_move[0]), False]  # return new location and a false value which means that the square if free

    def possible_skeleton_movement(self, player, monster_locations):
        move_start = numpy.subtract(self.location, (1, 1))  # get the location value of top left corner is a 3x3 grid with monster in the middle
        possible_moves = []
        for width in range(3):
            for height in range(3):
                possible_moves.append(numpy.add(move_start, (width, height)))  # get all possible moves
        manhattan_distance_list = self.best_skeleton_move(possible_moves, player, monster_locations)  # generate all manhattan values
        index = manhattan_distance_list.index(min(manhattan_distance_list))
        return [possible_moves[index]]

    def best_skeleton_move(self, possible_skeleton_locations, player, monster_locations):
        manhattan_distance_list = []
        for location in possible_skeleton_locations:  # generate a list of manhattan scores
            if (location[0], location[1]) in monster_locations:
                manhattan_distance_list.append(1000)  # If possible move is a monster big manhattan score
            else:
                manhattan_distance_list.append(
                    (abs(player[0] - location[0]) + abs(player[1] - location[1])))  # add real manhattan score
        return manhattan_distance_list

    def draw_skeleton(self):
        self.sprites.skeleton(self.gameWindow, self.location)

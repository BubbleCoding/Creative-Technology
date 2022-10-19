# the class handler takes care of all keyboard input

import pygame
import sys


class Handle:
    def __init__(self):
        pass

    def handle_events(self, moves):
        moveList = moves
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

            if event.type == pygame.KEYDOWN:  # if key pressed turn value to true
                if event.key == pygame.K_LEFT:
                    moveList[0] = True
                if event.key == pygame.K_RIGHT:
                    moveList[1] = True
                if event.key == pygame.K_UP:
                    moveList[2] = True
                if event.key == pygame.K_DOWN:
                    moveList[3] = True
                if event.key == pygame.K_a:
                    moveList[4] = True
                if event.key == pygame.K_d:
                    moveList[5] = True
                if event.key == pygame.K_w:
                    moveList[6] = True
                if event.key == pygame.K_s:
                    moveList[7] = True
                if event.key == pygame.K_SPACE:
                    moveList[8] = not moveList[8]
                if event.key == pygame.K_p:
                    moveList[9] = not moveList[9]
                if event.key == pygame.K_o:
                    moveList[10] = not moveList[10]

            if event.type == pygame.KEYUP:  # if key released turn value to false
                if event.key == pygame.K_LEFT:
                    moveList[0] = False
                if event.key == pygame.K_RIGHT:
                    moveList[1] = False
                if event.key == pygame.K_UP:
                    moveList[2] = False
                if event.key == pygame.K_DOWN:
                    moveList[3] = False
                if event.key == pygame.K_a:
                    moveList[4] = False
                if event.key == pygame.K_d:
                    moveList[5] = False
                if event.key == pygame.K_w:
                    moveList[6] = False
                if event.key == pygame.K_s:
                    moveList[7] = False
        return moveList


#  The menu class takes care of the different states of the game and what they look like

import pygame
from constants import Constants
from sprites import Sprites


class Menu:
    def __init__(self):
        self.blink = False
        self.timer = 0
        self.sprites = Sprites()

    def pause(self, game_window, font):
        text = font.render("pause", True, Constants.text_color)
        textRect = text.get_rect()
        textRect.center = ((Constants.window_width // 2), (Constants.window_height // 4) + 50)
        rect = ((Constants.window_width // 2) - 150, Constants.window_height // 4, 300, 100,)
        pygame.draw.rect(game_window, Constants.text_color, rect, 1)
        game_window.blit(text, textRect)
        pygame.display.update()

    def start(self, game_window, font):
        self.sprites.background_draw(game_window)
        text = font.render("press p to start", True, Constants.text_color)
        text2 = font.render("Magic Horde", True, Constants.text_color)
        textRect = text.get_rect()
        textRect2 = text2.get_rect()
        textRect.center = ((Constants.window_width // 2), (Constants.window_height // 2))
        textRect2.center = ((Constants.window_width // 2), (Constants.window_height // 4) + 50)
        game_window.blit(text, textRect)
        game_window.blit(text2, textRect2)
        pygame.display.update()

    def death(self, game_window, font, score):
        score_text = "score: " + str(score)
        self.sprites.background_draw(game_window)
        text = font.render("you died", True, Constants.text_color)
        text2 = font.render(score_text, True, Constants.text_color)
        textRect = text.get_rect()
        textRect2 = text2.get_rect()
        textRect.center = ((Constants.window_width // 2), (Constants.window_height // 4) + 50)
        textRect2.center = ((Constants.window_width // 2), (Constants.window_height // 4) + 100)
        game_window.blit(text, textRect)
        game_window.blit(text2, textRect2)
        pygame.display.update()

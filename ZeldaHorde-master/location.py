# the location class takes care of all needed data for A*

class Location:
    def __init__(self, location):
        self.location = location
        self.parent = None
        self.manhattan_score = 0
        self.travel_score = 0
        self.score = self.manhattan_score + self.travel_score
        self.is_seen = False
        self.visited = False

    def __lt__(self, other):
        return self.score < other.score

    def manhattan_distance(self, location):
        self.manhattan_score = abs(location[0] - self.location[0]) + abs(location[1] - self.location[1])

    def score_update(self):
        self.score = self.travel_score + self.manhattan_score

    def update(self, previous_element, target, obstacle):
        self.parent = previous_element
        self.manhattan_distance(target)
        if obstacle:
            self.travel_score = previous_element.travel_score + 4
        else:
            self.travel_score = previous_element.travel_score + 1
        self.score_update()

    def loc(self):
        return self.location

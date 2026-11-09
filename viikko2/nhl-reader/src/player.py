class Player:
    def __init__(self, dict):
        self.name = dict['name']
        self.nationality = dict['nationality']
        self.assists = dict['assists']
        self.goals = dict['goals']
        self.team = dict['team']
        self.games = dict['games']
        self.id = dict['id']

    def __str__(self):
        return self.name

    def finnish_players(self):
        if self.nationality == 'FIN':
            print(f"{self.name} team {self.team} goals {self.goals} assists {self.assists}")

from typing import List

class Case:
    def __init__(self):
        # Case vide par défaut
        self.occupe: str = ' '

    def jouer1(self):
        if self.occupe == ' ':
            self.occupe = 'X'
        else:
            print("Impossible de jouer : case déjà occupée.")

    def jouer2(self):
        if self.occupe == ' ':
            self.occupe = 'O'
        else:
            print("Impossible de jouer : case déjà occupée.")

class Terrain:
    def __init__(self, grille: List[Case] = None, tour: int = 1):
        # Initialise la grille à neuf Case() si aucun argument
        if grille is None:
            self.grille = []
            for i in range(9):
                self.grille.append(Case())
        else:
            if len(grille) != 9 or not all(isinstance(c, Case) for c in grille):
                raise ValueError("Grille invalide : doit être une liste de 9 Case.")
            self.grille = grille

        # Tour = 1 (X) ou 2 (O)
        self.tour = tour

    def __str__(self) -> str:
        s = ""
        for i in range(0, 9, 3):
            ligne = "|".join(self.grille[j].occupe for j in range(i, i + 3))
            s += ligne + "\n"
        return s

    def jouer(self, pos: int):
        if not (0 <= pos < 9):
            print("Indice invalide : doit être entre 0 et 8.")
            return
        case = self.grille[pos]
        if self.tour == 1:
            case.jouer1()
            self.tour = 2
        else:
            case.jouer2()
            self.tour = 1

# Exemple d'utilisation
if __name__ == "__main__":
    t = Terrain()
    t.jouer(3)
    t.jouer(2)
    t.jouer(4)
    t.jouer(6)
    t.jouer(5)
    print(t)

#include <stdio.h>
#include "liste.h"
#include "truc.h"
#include "abr.h"
#include "ligne.h"

int main(int argc, char *argv[])
{
  Un_elem *liste_sta = NULL;
  Une_ligne *liste_ligne = NULL;
  Un_elem *liste_con = NULL;
  Un_nabr *abr_sta;

  if (argc != 4)
    {
      fprintf(stderr, "Usage : test_connexion fichier_stations fichier_ligne fichier connexion\n");
      return 1;
    }
	
  if ((liste_sta = lire_stations(argv[1])) == NULL)
    {
      fprintf(stderr, "Erreur : Lecture fichier stations\n");
      return 1;
    }
	
  abr_sta = construire_abr(liste_sta);

  if ((liste_ligne = lire_lignes(argv[2])) == NULL)
    {
      fprintf(stderr, "Erreur : Lecture fichier lignes\n");
      return 1;
    }
	
  if ((liste_con = lire_connexions(argv[3], liste_ligne, abr_sta)) == NULL)
    {
      fprintf(stderr, "Erreur : Lecture fichier connexion\n");
      return 1;
    }
	
  ecrire_liste(stdout,liste_con);

  detruire_abr(abr_sta);
	
  detruire_liste_et_truc(liste_con);

  detruire_liste_et_truc(liste_sta);
	
  detruire_lignes(liste_ligne);

  return 0;
}

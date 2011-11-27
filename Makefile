#C_FLAGS = -Wall -g -std=c99
C_FLAGS = -Wall -g

all : test_sta test_ligne test_connexion test_dijkstra

truc.o : truc.c
	gcc ${C_FLAGS} -c truc.c

liste.o : liste.c
	gcc ${C_FLAGS} -c liste.c

station.o : station.c
	gcc ${C_FLAGS} -c station.c

abr.o : abr.c
	gcc ${C_FLAGS} -c abr.c

test_sta.o : test_sta.c
	gcc ${C_FLAGS} -c test_sta.c

test_sta : test_sta.o liste.o truc.o abr.o station.o
	gcc ${C_FLAGS} -o test_sta test_sta.o truc.o liste.o abr.o station.o

ligne.o : ligne.c
	gcc ${C_FLAGS} -c ligne.c

test_ligne.o : test_ligne.c
	gcc ${C_FLAGS} -c test_ligne.c

test_ligne : test_ligne.o ligne.o
	gcc ${C_FLAGS} -o test_ligne test_ligne.o ligne.o

connexion.o : connexion.c
	gcc ${C_FLAGS} -c connexion.c

test_connexion.o : test_connexion.c
	gcc ${C_FLAGS} -c test_connexion.c

test_connexion : test_connexion.o connexion.o ligne.o abr.o liste.o truc.o station.o
	gcc ${C_FLAGS} -lm -o test_connexion test_connexion.o connexion.o ligne.o abr.o liste.o truc.o station.o

dijkstra.o : dijkstra.c
	gcc ${C_FLAGS} -c dijkstra.c

test_dijkstra.o : test_dijkstra.c
	gcc ${C_FLAGS} -c test_dijkstra.c

test_dijkstra : test_dijkstra.o connexion.o ligne.o abr.o liste.o truc.o station.o dijkstra.o
	gcc ${C_FLAGS} -lm -o test_dijkstra test_dijkstra.o connexion.o ligne.o abr.o liste.o truc.o station.o dijkstra.o

clean :
	rm -f *.o test_sta test_ligne test_connexion test_dijksra

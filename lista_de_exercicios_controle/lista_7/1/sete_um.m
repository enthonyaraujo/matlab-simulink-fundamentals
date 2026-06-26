% colocar no command window
s = tf('s');

G1 = 1/s;
H1 = 2;
B1 = G1 + H1;

G2 = 2*s;
H2 = 1; 
B2 = feedback(G2, H2); 

G3 = B1 * B2;

H3 = 5 / G2;
G4 = feedback(G3, H3);

H4 = 1;

TF_final = feedback(G4,H4);
minreal(TF_final)
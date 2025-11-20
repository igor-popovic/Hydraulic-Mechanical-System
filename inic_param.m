clc; clear;

%% parametri sistema
K=0;
Bp=30;
Mt=8;
Ap=3 * 10^(-3);
Vt=4 * 10^(-3);
Kc = 1.8 * 10^(-12);
Ctp = 1.9 * 10^(-13);
Kq = 1;
Kt = 6.86 * 10^(-2);
Kf = 2.5 * 10^(2);
r_pov_opruge=0.01;
R=10;
Be = 13*(10^8);
Umax = 24;
m=250;
r=0.4;
b=250;
k=2*(10^6);
F=500; 

%% matrice


% Matrica A
a11 = 0;
a12 = 1;
a13 = 0;
a14 = 0;
a15 = 0;

a21 = -(k+K)/(Mt+10*m/3);
a22 = -(Bp + b)/(Mt+10*m/3);
a23 = (k)/(Mt+10*m/3);
a24 = b/(Mt+10*m/3);
a25 = Ap/(Mt+10*m/3);

a31 = 0;
a32 = 0;
a33 = 0;
a34 = 1;
a35 = 0;

a41 = k/(3*m);
a42 = b/(3*m);
a43 = -k/(3*m);
a44 = -b/(3*m);
a45 = 0;


a51 = 0;
a52 = -4*Ap*Be/Vt;
a53 = 0;
a54 = 0;
a55 = -(Ctp+Kc)*4*Be/Vt;


A = [a11, a12, a13 , a14, a15;
     a21, a22, a23 , a24, a25;
     a31, a32, a33 , a34, a35;
     a41, a42, a43 , a44, a45;
     a51, a52, a53 , a54, a55;];

% Matrica B
b1 = 0;
b2 = 0;
b3 = 0;
b4 = 0;
b5 = Kt*Kq*4*Be/ (r_pov_opruge*R*Kf*Vt);

B = [b1; b2; b3; b4; b5];

% Matrica H
h1 = 0;
h2 = 0;
h3 = 0;
h4 = -1/(3*m);
h5 = 0;

H = [h1; h2; h3; h4; h5];

% Matrica C i D
c1 = 0; c2 = 0; c3 = 1; c4=0; c5=0;
C = [c1, c2, c3, c4, c5];
D = 0;

%% f-ja prenosa

sys = ss(A, B, C, D);
G = tf(sys);
s = tf('s');
%G = C*(s*eye(5)-A)^(-1)*B;
figure()
pzmap(G);
G

figure()
step(G/(1+G));














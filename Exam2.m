% Brandon Ramirez Lopez, Gabriel Ritch, Emerson Fleming
% ME 203
% Exam 2
clc, clear all, format compact
%% Question 1
syms x1 x2 x3 x4 x5
% Write out each equations
eqn1=-5*x1+6*x2+7*x3+8*x5==6;
eqn2=4*x1+5*x2+6*x3+2*x4==1;
eqn3=-5*x1-3*x2+3*x3+5*x4+2*x5==8;
eqn4=x1-5*x2+4*x3+11*x4+9*x5==56;
eqn5=8*x1+8*x2+3*x3+7*x4+x5==13;
[A,B]=equationsToMatrix([eqn1,eqn2,eqn3,eqn4,eqn5]);,[x1,x2,x3,x4,x5];
Solution1=linsolve(A,B)
% Question 1 soultion 2
A2=[-5,6,7,0,8;4,5,6,2,0;-5,-3,3,5,2;1,-5,4,11,9;8,8,3,7,1];
B2=[6;1;8;56;13];
% x3 should equal z3 if so there is a soultion
x2=rank(A2);
z2=rank([A2,B2]);
% Answer to variables
solution2=A2\B2
%% Question 2
% Part 1--use roots() to find zeros of A and B
% define coefficients to A (5x^5+8x^4+x^3+x+6)
A = [5 8 1 0 1 6];
% define coefficients to B (4x^3+8x^2+2)
B = [4 8 0 2];
% use roots() to find zeros of function A
Azeros=roots(A)
% use roots() to find zeros of function A
Bzeros=roots(B)

% Part 2--use polyval() to evaluate A and B at x=[1 2 3]
% define points x to evaluate A and B at
x=[1 2 3];
% use polyval() to evaluate A at x=[1 2 3]
Ax=polyval(A,x)
% use polyval() to evaluate B at x=[1 2 3]
Bx=polyval(B,x)

% Part 3--find C=A*B
syms x
A3=5*x^5+8*x^4+x^3+x+6;
B3=4*x^3+8*x^2+2;
C=expand(A3*B3)

% Part 4--find D=A/B and remainder r
%since we are finding remainder, round down with floor() when finding quotient D
%use rem()function to find remainder of quotient A/B
[r,D]=polynomialReduce(A3,B3)
D
r
%% Question 3
wants_to_play = 1;

while wants_to_play == 1
    % generate a random integer form 1 to 15.
    number = randi(15,1);

    % The player should be able to make unlimited guesses of the number

    guess = 0;
    
    while number ~= guess
        guess = input('\nGuess a number between 1 and 15: \n');
        % indicate if the player has won or give the player hints if the guess is wrong.
        distance = abs(guess-number);
        switch(distance)
            case 0
                fprintf('You won \n \n') % “You won” ask if the player wants to restart the game
                wants_to_play = input('Would you like to play again? (Yes/No): \n', 's');
                switch(wants_to_play)
                    case 'Yes'
                        wants_to_play = 1;
                    case 'No'
                        wants_to_play = 0;
                end
                
            case 1 %“Very close” if the guess is within 1 of the correct number
                fprintf('Very close \n')

            case {2,3} % “Getting closer” if the guess is within 2 or 3 of the correct number
                fprintf('Getting closer \n')

            otherwise % “Not close” if the guess is not within 3 of the correct number
                fprintf('Not close\n')

        end
    end
    
end

fprintf('Thank you for playing the game. △□○\n \n')


%% Question 4 
x=[1:10];
y=[1:10];
f=ExamF(200,759);
g=ExamF(x,y);

%% Problem 5 -Gabriel Ritch

%givens:
% set 1
xi = -2:0.01:8;
yi = 0.025:0.001:1000;
n = min(size(xi,1), size(yi,1));
m = min(size(xi,2), size(yi,2));
x=xi(1:n,1:m);
y=yi(1:n,1:m);

% set 2
xi2 = 25:1:365;
yi2 = 25:0.2:100;
n1 = min(size(xi2,1), size(yi2,1));
m1 = min(size(xi2,2), size(yi2,2));
x1=xi2(1:n1,1:m1);
y1=yi2(1:n1,1:m1);

f1 = get_f_xy_Ritch_Gabriel(x,y);

f2 = get_f_xy_Ritch_Gabriel(x1,y1);

[rows1,columns1]=size(f1);
[rows2,columns2]=size(f2);
fprintf('The dimensions of f1 is %d row by %d columns\n',rows1,columns1)

fprintf('The dimensions of f2 is %d row by %d columns\n',rows2,columns2)
%% Question 6
% Part 1--user input commands for A,b,Wn
A=input('Enter value for A: ')
b=input('Enter value for b: ')
Wn=input('Enter value for Wn: ')
t=[0:.01:10]
% Amplitude equation
Amp=A.*exp(b.*t).*cos(Wn.*t)
% Parts 2 and 3--switch case to find and graph amplitude
switch b
    case {b<0}
        t=0;
        while t>=0
            Amp=A*exp(b*t)*cos(Wn*t);
            Amp>=-40;
            Amp<=40;
        end
        figure(1)
        plot(t,Amp)
        title('Amplitude for b<0')
        xlabel('t')
        ylabel('Amplitude')
    case {b==0}
        t=linspace(0,tf,1000);
        figure(2)
        plot(t,Amp)
        title('Amplitude for b=0')
        xlabel('t')
        ylabel('Amplitude')
    case {b>0}
        t=linspace(0,tf,1000);
        figure(3)
        plot(t,Amp)
        title('Amplitude for b>0')
        xlabel('t')
        ylabel('Amplitude')
end
%% Question 6 edited
A=input('Enter value for A: ')
b=input('Enter value for b: ')
Wn=input('Enter value for Wn: ')
%t=[0:.01:10];
% Amplitude equation
Amp=A.*exp(b.*t).*cos(Wn.*t);

% Parts 2 and 3--switch case to find and graph amplitude
if b<0
    b='less than zero'
elseif b==0
    b='zero'
elseif b>0
    b='greater than zero'
end
switch b
    case 'less than zero'
        while t>=0
            t=t+.01
            if Amp>40
            break 
            end
        end
end

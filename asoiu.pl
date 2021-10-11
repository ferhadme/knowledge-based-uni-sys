%

university(asoiu) .
department(computer_engineering, asoiu) .
faculty(itif, computer_engineering) .
speciality(it, itif) .
speciality(cs, itif) .
speciality(cyber_security, itif) .

study(ferhad, it) .
point(ferhad, 594) .
no(ferhad, 7) .
national(ferhad) .

study(ceyhun, it) .
point(ceyhun, 565) .
no(ceyhun, 8) .
national(ceyhun) .

study(ali_abbas, it) .
foreign(ali_abbas) .
no(ali_abbas, 2) .

study(kamran, cyber_security) .
point(kamran, 530) .
no(kamran, 23) .
national(kamran) .

teacher(ilqar, it) .


teach(X, Y) :- 
	teacher(X, Z), 
	study(Y, Z) .

groupmate(X, Y) :-
	study(X, Z),
	study(Y, Z) .

university_student(X, Y) :- 
	study(X, Z), 
	speciality(Z, U), 
	faculty(U, T), 
	department(T, Y), 
	university(Y) .

university_teacher(X, Y) :- 
	teacher(X, Z), 
	speciality(Z, U), 
	faculty(U, T), 
	department(T, Y), 
	university(Y) .

university_member(X, Y) :- 
	university_student(X, Y) .
university_member(X, Y) :- 
	university_teacher(X, Y) .

scholarship(X) :- 
	national(X), 
	point(X, Z), 
	Z >= 553 .
private(X) :- 
	foreign(X) .
private(X) :- 
	point(X, Z), Z < 553 .

even_day(X) :- 
	X >= 1, 
	X =< 5, 
	Z is X mod 2, 
	Z = 0 .
odd_day(X) :- 
	X >= 1, 
	X =< 5, 
	Z is X mod 2, 
	Z = 1 .
top_week(X) :-
	Z is X mod 2,
	Z is 1 .
bottom_week(X) :-
	Z is X mod 2,
	Z is 0 .

four_special_student(X, Y) :-
	Start is (Y - 1) * 4,
	End is Y * 4,
	no(X, No),
	No > Start,
	No =< End .
	
%online(X, Y) :- 
%	odd_day(Y), 
%	no(X, T), 
%	Z is T mod 2, 
%	Z = 1 .
%online(X, Y) :- 
%	even_day(Y), 
%	no(X, T), 
%	Z is T mod 2, 
%	Z = 0 .
%offline(X, Y) :- 
%	odd_day(Y), 
%	no(X, T), 
%	Z is T mod 2, 
%	Z = 0 .
%offline(X, Y) :- 
%	even_day(Y), 
%	no(X, T), 
%	Z is T mod 2, 
%	Z = 1 .

% stud, weekno, day
offline(X, Y, Z) :-
	four_special_student(X, Y) .
	
offline(X, Y, Z) :-
	

online(X, Y, Z) :-
	\+ offline(X, Y, Z) .


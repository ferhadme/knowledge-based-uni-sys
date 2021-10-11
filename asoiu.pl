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

study(ceyhun, it) .
point(ceyhun, 565) .
no(ceyhun, 8) .

study(ali_abbas, it) .

national(ferhad) .
national(ceyhun) .
foreign(ali_abbas) .

teacher(ilqar, it) .


teach(X, Y) :- 
	teacher(X, Z), 
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

scholarship(X, Y) :- 
	national(X), 
	point(X, Z), 
	Z >= 553 .
private(X, Y) :- 
	foreign(X) .
private(X, Y) :- 
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

online(X, Y) :- 
	odd_day(Y), 
	no(X, T), 
	Z is T mod 2, 
	Z = 1 .
offline(X, Y) :- 
	odd_day(Y), 
	no(X, T), 
	Z is T mod 2, 
	Z = 0 .
online(X, Y) :- 
	even_day(Y), 
	no(X, T), 
	Z is T mod 2, 
	Z = 0 .
offline(X, Y) :- 
	even_day(Y), 
	no(X, T), 
	Z is T mod 2, 
	Z = 1 .


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


% teacher, student
teach(X, Y) :- 
	teacher(X, Z), 
	study(Y, Z) .

% student_1, student_2
groupmate(X, Y) :-
	study(X, Z),
	study(Y, Z) .

% student, university
university_student(X, Y) :- 
	study(X, Z), 
	speciality(Z, U), 
	faculty(U, T), 
	department(T, Y), 
	university(Y) .

% teacher, university
university_teacher(X, Y) :- 
	teacher(X, Z), 
	speciality(Z, U), 
	faculty(U, T), 
	department(T, Y), 
	university(Y) .

% member, university
university_member(X, Y) :- 
	university_student(X, Y) .
university_member(X, Y) :- 
	university_teacher(X, Y) .

% student
scholarship(X) :- 
	national(X), 
	point(X, Z), 
	Z >= 553 .
private(X) :- 
	foreign(X) .
private(X) :- 
	point(X, Z), Z < 553 .

% day_no
day_validation(X) :-
	X >= 1,
	X <= 5 .

% week no
top_week(X) :-
	Z is X mod 2,
	Z is 1 .
bottom_week(X) :-
	Z is X mod 2,
	Z is 0 .

% student, week_no
four_special_student(X, Y) :-
	Start is (Y - 1) * 4,
	End is Y * 4,
	no(X, No),
	No > Start,
	No =< End .

% number
odd_number(X) :-
	Z is X mod 2,
	Z = 1 .
even_number(X) :-
	\+ odd_number(X) .

% student, day_no
same_mod(X, Z) :-
	no(X, No),
	No_mod is No mod 2,
	Day_mod is Z mod 2,
	No_mod = Day_mod .
different_mod(X, Z) :-
	no(X, No),
	No_mod is No mod 2,
	Day_mod is Z mod 2,
	\+ (No_mod = Day_mod) .

% student, week_no, day_no
offline(X, Y, Z) :-
	day_validation(Z),
	four_special_student(X, Y) .
offline(X, Y, Z) :-
	day_validation(Z),
	odd_number(Y),
	Week_const is (Y + 1) / 2,
	odd_number(Week_const),
	same_mod(X, Z) .
offline(X, Y, Z) :-
	day_validation(Z),
	even_number(Y),
	Week_const is Y / 2,
	odd_number(Week_const),
	same_mod(X, Z) .
offline(X, Y, Z) :-
	day_validation(Z),
	odd_number(Y),
	Week_const is (Y + 1) / 2,
	even_number(Week_const),
	different_mod(X, Z) .
offline(X, Y, Z) :-
	day_validation(Z),
	even_number(Y),
	Week_const is Y / 2,
	even_number(Week_const),
	different_mod(X, Z) .

online(X, Y, Z) :-
	day_validation(Z),
	\+ offline(X, Y, Z) .


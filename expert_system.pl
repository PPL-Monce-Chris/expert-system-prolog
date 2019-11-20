%-- Chris Johnson, Monce Romero
%-- CS 3210-001
%-- Programming Assignment #3
%-- 11/15/19

begin :- 
    write('Welcome to the Expert System about _____ !,
        I am going to ask questions about _____ features.
        please answer yes. or no.
        Ready?    '),
        read(yes) -> animal(_); write('Good Bye.') , halt.


is_true_guess(Guess) :- 
    undo,
    format('~w?~n', [Guess]),
    read(yes), write('Cool beans!'),
    write('would you like to try again?'),nl,
    write('type yes. or no.'),nl,
    read(yes)-> begin, read(no)-> halt;
    write('Well get over it.'),nl,
    write('would you like to try again? type yes. or no.   '), 
    read(yes)-> begin; halt.


:- dynamic yes/1.
:- dynamic  no/1.

check(Question) :- (yes(Question) -> true ;
     (no(Question) -> fail ;
      is_true(Question) ) ).


is_true(Question) :- 
    animal(Question) -> true ;
    ((format('~w?~n', [Question]), read(Response),
    (Response == yes -> assert(yes(Question));
    Response == no -> assert(no(Question)), fail;
    write('incorrect choice'), halt))).
        

animal(dog) :- check('has fur'), check('says woof'), check('is it man best firend'), is_true_guess('Is it a pupper?').
animal(cat) :- check('has fur'), check('says meow'), check('is it evil'), is_true_guess('Is it a pussy cat?'). 
animal(duck) :- check('has feathers'), check('says quack'), check('does it fly'), is_true_guess('Is it a quack master?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').

% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').

% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').
% animal(duck) :- check('has feathers'), check('says quack'), is_true_guess('Is it a duck?').


animal(none) :- write('sorry im not a mind reader.'),nl,  
    write('would you like to try again? type yes. or no.'),
    read(yes)-> undo, begin; halt.

undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo.
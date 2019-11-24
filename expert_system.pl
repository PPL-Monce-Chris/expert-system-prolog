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

animal(onea) :- check('11'), check('11a'), is_true_guess('is it 1a').
animal(oneb) :- check('11'), check('11b'), is_true_guess('is it 1b').

animal(twoa) :- check('22'), check('2aa'), is_true_guess('is it twoa').
animal(twob) :- check('22'), check('22b'), is_true_guess('is it twob').
animal(twoc) :- check('22'), check('22c'), is_true_guess('is it twoc').
animal(twod) :- check('23'), check('23d'), is_true_guess('is it twod').
animal(twoe) :- check('23'), check('23e'), is_true_guess('is it twoe').

animal(threea) :- check('33'), check('3aa'), is_true_guess('is it 3a').
animal(threeb) :- check('33'), check('3bb'), is_true_guess('is it 3b').
animal(threec) :- check('33'), check('3cc'), is_true_guess('is it 3c').
animal(threed) :- check('33'), check('3dd'), is_true_guess('is it 3d').
animal(threee) :- check('33'), check('3ee'), is_true_guess('is it 3e').


animal(none) :- write('sorry im not a mind reader.'),nl,  
    write('would you like to try again? type yes. or no.'),
    read(yes)-> undo, begin; halt.

undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo.
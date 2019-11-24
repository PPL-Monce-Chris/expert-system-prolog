%-- Chris Johnson, Monce Romero
%-- CS 3210-001
%-- Programming Assignment #3
%-- 11/15/19

:- dynamic yes/1, no/1.

begin :-
    write('Welcome to the Expert System about Encryption Algorithms !,
        I am going to ask questions about encryption features.
        please answer yes. or no.
        Ready?    '),
        read(yes) -> encrypt(_); write('Good Bye.') , halt.


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
    encrypt(Question) -> true ;
    ((format('~w?~n', [Question]), read(Response),
    (Response == yes -> assert(yes(Question));
    Response == no -> assert(no(Question)), fail;
    write('input not recognized'), halt))).


encrypt(des) :- check('invented by IBM'), check('uses double or triple encryption'), check('not secured'), is_true_guess('Is it DES encryption?').
encrypt(aes) :- check('invented by NIST'), check('uses a simple mathematical framework'), check('secured'), is_true_guess('Is it AES encryption?').
encrypt(mars) :- check('invented by IBM'), check('uses block cipher'), check('not secured'), is_true_guess('Is it MARS encryption?').
encrypt(idea) :- check('designed by James Massay'), check('uses symmetric-key block cipher'), check('not secured'), is_true_guess('Is it IDEA encryption?').
encrypt(rc2) :- check('invented by Ron Rivest'), check('uses 64-bit block cipher'), check('not secured'), is_true_guess('Is it RC2 encryption?').

encrypt(rc4) :- check('invented by Ron Rivest'), check('algorithm has not been released'), check('not secured'),  is_true_guess('Is it RC4 Encryption?').
encrypt(rc5) :- check('invented by Ron Rivest'), check('uses block cipher'), check('secured'), is_true_guess('Is it RC5 Encryption?').
encrypt(rc6) :- check('derived from RC5'), check('uses block cipher'), check('secured'),  is_true_guess('Is it RC6 Encryption?').
encrypt(blow) :- check('built by Bruce Schneier'), check('uses symmetric-key block cipher'), check('not secured'), is_true_guess('Is it Blowfish Encryption?').
encrypt(two) :- check('succesor to Blowfish'), check('can be implemented on hardware and smartcards'), check('not secured'), is_true_guess('Is it Twofish Encryption?').

encrypt(three) :- check('created has the Skein Hash Function'), check('uses block cipher'), check('not secured'), is_true_guess('Is it Threefish Encryption?').
encrypt(rsa) :- check('created by Ron Rivest and others'), check('uses assymetric-key encryption'), check('secured'), is_true_guess('Is it RSA Encryption?').
encrypt(trans) :- check('used by the Romans'), check('uses double or triple encryption'), check('not secured'), is_true_guess('Is it Transposition?').
encrypt(ellip) :- check('discovered by R. Propper'), check('uses assymetric-key encryption'), check('secured'), is_true_guess('Is it Elliptic Curve Encryption?').
encrypt(caeser) :- check('discovered by Caeser'), check('uses substitution of letters'), check('not secured'), is_true_guess('Is it Caesar Cipher?').


encrypt(none) :- write('sorry im not a mind reader.'),nl,
    write('would you like to try again? type yes. or no.'),
    read(yes)-> undo, begin; halt.

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.

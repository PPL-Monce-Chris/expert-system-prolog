%-- Chris Johnson, Monce Romero
%-- CS 3210-001
%-- Programming Assignment #3
%-- 11/15/19


begin :-
    write('Welcome to the Expert System about Encryption Algorithms !,
        I am going to ask questions about encryption features.
        please answer yes. or no.
        Ready?    '),
        read(yes) -> encryption(_); write('Good Bye.') , halt.


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

check(Question) :- (yes(Question) -> true;
     (no(Question) -> fail ;
      is_true(Question) ) ).

checkSecure(Question) :- (yes(Question) -> true;
    (no(Question) -> fail ;
     write('Is it '), is_true(Question) ) ).


checkNot(Question) :- (no(Question) -> true;
    (yes(Question) -> fail ;
     write('Is it not '), is_true(Question) ) ).


is_true(Question) :-
    ((format('~w?~n', [Question]), read(Response),
    (Response == yes -> assertz(yes(Question)), assertz(+/(no(Question)));
    Response == no -> assertz(no(Question)), assertz(+/(yes(Question))), fail;
    write('input not recognized'), halt))).


encryption(rsa) :- checkSecure('secured?'), check('Was it invented by Ron Rivest?'), check('Does it use assymetric-key encryption?'), is_true_guess('Is it RSA Encryption?').
encryption(rc5) :- checkSecure('secured?'), check('Was it invented by Ron Rivest?'), check('Does it use block cipher?'), is_true_guess('Is it RC5 Encryption?').
encryption(ellip) :- checkSecure('secured?'), check('Was it discovered by R. Propper?'), check('Does it use assymetric-key encryption?'), is_true_guess('Is it Elliptic Curve Encryption?').
encryption(rc6) :- checkSecure('secured?'), check('Was it derived from RC5?'), check('Does it use block cipher?'), is_true_guess('Is it RC6 Encryption?').
encryption(aes) :- checkSecure('secured?'), check('Was it invented by NIST?'), check('Does it use a simple mathematical framework?'), is_true_guess('Is it AES encryption?').

encryption(des) :- checkNot('secured?'), check('Was it invented by IBM?'), check('Does it use double or triple encryption?'), is_true_guess('Is it DES encryption?').
encryption(mars) :- checkNot('secured?'), check('Was it invented by IBM?'), check('Does it use block cipher?'), is_true_guess('Is it MARS encryption?').

encryption(rc2) :- checkNot('secured?'), check('Was it invented by Ron Rivest?'), check('Does it use a 64-bit block cipher?'), is_true_guess('Is it RC2 encryption?').
encryption(rc4) :- checkNot('secured?'), check('Was it invented by Ron Rivest?'), check('Is the algorithm still not released?'), is_true_guess('Is it RC4 Encryption?').

encryption(idea) :- checkNot('secured?'), check('Was it designed by James Massay?'), check('Does it use symmetric-key block ciphers?'), is_true_guess('Is it IDEA encryption?').
encryption(blow) :- checkNot('secured?'), check('Was it built by Bruce Schneier?'), check('Does it use symmetric-key block ciphers?'), is_true_guess('Is it Blowfish Encryption?').
encryption(two) :- checkNot('secured?'), check('Was it a succesor to Blowfish?'), check('Can it be implemented on hardware and smartcards?'), is_true_guess('Is it Twofish Encryption?').
encryption(three) :- checkNot('secured?'), check('Does it use the Skein Hash Function?'), check('Does it use block cipher?'), is_true_guess('Is it Threefish Encryption?').
encryption(trans) :- checkNot('secured?'), check('Was it used by the Romans?'), check('Does it use double or triple encryption?'), is_true_guess('Is it Transposition?').
encryption(caeser) :- checkNot('secured?'), check('Was it discovered by Caeser?'), check('Does it use the substitution of letters?'), is_true_guess('Is it Caesar Cipher?').


encryption(none) :- write('sorry im not a mind reader.'),nl,
    write('would you like to try again? type yes. or no.'),
    read(yes)-> undo, begin; halt.

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.

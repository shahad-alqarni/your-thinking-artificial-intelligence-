go  :- write('This program determines how you think. If you are thinking rationally or heartily .

let’s start the test

Chosse your answer, either Y. = yes or N. = no '),
      nl,
      nl,
      nl,
      hypothesize(Thinking),
      write('I guess that the way you think is:'),
      write(Thinking),
      nl,
      undo.

/* hypotheses to be tested */
hypothesize(rationally)   :- rationally, !.
hypothesize(heartily)     :- heartily, !.
hypothesize(unknown).             /* no diagnosis */




/* thinking identification rules */
rationally :- wise,strong,equitable,

           verify(the_combination_of_heart_and_mind_is_required_in_human_relations),
           verify(the_sweetest_feelings_are_those_that_shine_with_the_light_of_the_mind),
           verify(do_you_choose_money_and_position_in_front_of_honesty_and_conviction),
           verify(talking_about_emotions_alone_leads_to_disaster),
           verify(do_you_choose_exile_in_a_foreign_country_and_a_high_salary_instead_of_hard_work_next_to_your_family).

heartily :- passionate, kind,sensitive,

           verify(people_are_different_and_your_heart_holds_the_key),
           verify(there_are_those_we_deal_with_with_our_hearts_and_others_with_our_minds),
           verify(the_skill_and_magnificence_of_man_in_linking_reason_and_emotion_in_dealing),
           verify(the_mind_of_the_artist_is_in_his_feeling_and_the_mind_of_the_poet_is_in_his_heart),
           verify(the_combination_of_heart_and_mind_is_required_in_human_relations).


/* classification rules */
wise    :- verify(his_decision_is_correct), !.
strong    :- verify(unaffected_by_emotion).
equitable    :- verify(unfair).
passionate    :- verify(cares_about_people).
kind    :- verify(sweet_with_everyone).
sensitive    :- verify(quickly_affected).



/* how to ask questions */
ask(Question) :-
    write('Does this fit your way of thinking? '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.

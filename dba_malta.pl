% MINIMALES DBA-VERGLEICHSSYSTEM

artikel_de("nur in dem anderen Vertragstaat besteuert werden").
artikel_en("may be taxed in the other Contracting State").

% RESTRIKTIONSGRADE:
restriktion(nur, 10).        
restriktion(may_be, 5).     

vergleiche :-
    artikel_de(TextDE),
    artikel_en(TextEN),
    
    (sub_atom(TextDE, _, _, _, 'nur') -> RestrDE = nur ; RestrDE = unbekannt),
    (sub_atom(TextEN, _, _, _, 'may be') -> RestrEN = may_be ; RestrEN = unbekannt),
    
    % Vergleiche Grade
    restriktion(RestrDE, GradDE),
    restriktion(RestrEN, GradEN),
    
    % Ausgabe
    write('Deutsche Version: '), write(RestrDE), write(' (Grad: '), write(GradDE), write(')'), nl,
    write('Englische Version: '), write(RestrEN), write(' (Grad: '), write(GradEN), write(')'), nl,
    
    (GradDE > GradEN -> 
        write('ERGEBNIS: Deutsche Version ist RESTRIKTIVER!') 
    ; 
        write('ERGEBNIS: Versionen sind gleich')
    ), nl.

% START
:- vergleiche.




:- use_module(library(clpfd)).

% Entry point
solve(Puzzle) :-
    length(Puzzle, 9),
    maplist(same_length(Puzzle), Puzzle),
    append(Puzzle, Vars), Vars ins 1..9,

    % Row constraints
    maplist(all_distinct, Puzzle),

    % Column constraints
    transpose(Puzzle, Columns),
    maplist(all_distinct, Columns),

    % 3x3 Block constraints
    Puzzle = [A,B,C,D,E,F,G,H,I],
    blocks(A, B, C),
    blocks(D, E, F),
    blocks(G, H, I),

    % Custom labeler that logs try and backtrack steps
    my_label(Puzzle),

    % Print final solution
    print_solution(Puzzle).

% Block constraints for 3x3 blocks
blocks([], [], []).
blocks([A,B,C|Rest1], [D,E,F|Rest2], [G,H,I|Rest3]) :-
    all_distinct([A,B,C,D,E,F,G,H,I]),
    blocks(Rest1, Rest2, Rest3).

% Print the solution grid
print_solution([]).
print_solution([Row|Rest]) :-
    writeln(Row),
    print_solution(Rest).

% Custom labeling predicate that prints try/backtrack with row,col info
my_label(Puzzle) :-
    my_label_rows(Puzzle, 1).

my_label_rows([], _).
my_label_rows([Row|Rest], RowIndex) :-
    my_label_row(Row, RowIndex, 1),
    NextRowIndex is RowIndex + 1,
    my_label_rows(Rest, NextRowIndex).

my_label_row([], _, _).
my_label_row([Cell|Rest], RowIndex, ColIndex) :-
    try_cell(Cell, RowIndex, ColIndex),
    NextColIndex is ColIndex + 1,
    my_label_row(Rest, RowIndex, NextColIndex).

try_cell(Cell, Row, Col) :-
    indomain(Cell),
    format('try(~w,~w,~w).\n', [Row, Col, Cell]),
    true.
try_cell(Cell, Row, Col) :-
    format('backtrack(~w,~w,~w).\n', [Row, Col, Cell]),
    fail.

% Sample test puzzle
test :-
    Puzzle = [[1,_,_,_,_,7,_,9,_],
              [_,3,_,_,2,_,_,_,8],
              [_,_,9,6,_,_,5,_,_],
              [_,_,5,3,_,_,9,_,_],
              [_,1,_,_,8,_,_,_,2],
              [6,_,_,_,_,4,_,_,_],
              [3,_,_,_,_,_,_,1,_],
              [_,4,_,_,_,_,_,_,7],
              [_,_,7,_,_,_,3,_,_]],
    solve(Puzzle).

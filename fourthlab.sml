(*----------------------------*)
exception NoAnswer

datatype pattern = Wildcard
                 | Variable of string
                 | UnitP
                 | ConstP of int
                 | TupleP of pattern list
                 | ConstructorP of string * pattern

datatype valu = Const of int
              | Unit
              | Tuple of valu list
              | Constructor of string * valu

fun g f1 f2 p =
    let val r = g f1 f2 
    in
        case p of
            Wildcard          => f1 ()
          | Variable x        => f2 x
          | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
          | ConstructorP(_,p) => r p
          | _                 => 0
    end

(*1 task*)
fun only_capitals(str_lst) =
    List.filter(fn
        "" => false
        | str => Char.isUpper(String.sub(str, 0))
        ) str_lst

(*2 task*)
fun longest_string1(str_lst) =
    List.foldl(fn (cur_str, long_str) =>
        if String.size cur_str > String.size long_str
        then cur_str
        else long_str
        ) "" str_lst

(*3 task*)
fun longest_string2(str_lst) =
    List.foldl(fn (cur_str, long_str) =>
        if String.size cur_str >= String.size long_str
        then cur_str
        else long_str
        ) "" str_lst

(*4 task*)
fun longest_string_helper str_cmp (str_lst) =
    List.foldl (fn (str1, str2) => 
        if str_cmp(String.size str1, String.size str2)
        then str1
        else str2
        ) "" str_lst

val longest_string3 = longest_string_helper (fn (str_1, str_2 ) => str_1 > str_2)

val longest_string4 = longest_string_helper (fn (str_1, str_2 ) => str_1 >= str_2)

(*5 task*)
val longest_capitalized = longest_string3 o only_capitals

(*6 task*)
val rev_string = String.implode o rev o String.explode

(*7 task*)
fun first_answer func ([]) = raise NoAnswer
  | first_answer func (h::t) =
    case func (h) of
    SOME v => v
    | NONE => first_answer func t

(*8 task*)
fun all_answers func lst =
    let fun tail_rec([], a) = SOME(a)
          | tail_rec(h::t, a) =
                case func(h) of
                SOME v => tail_rec(t, a @ v)
                | NONE => NONE
    in tail_rec(lst, []) end

(*9 task*)

(*9.1 task*)
val count_wildcards = g (fn _ => 1) (fn _ => 0)

(*9.2 task*)
val count_wild_and_variable_lengths = g (fn _ => 1) (String.size)

(*9.3 task*)
fun count_some_var(str, pat) = g (fn _ => 0) (fn sp => if sp = str then 1 else 0) pat

(*10 task*)
fun check_pat(pat) =
    let fun getTypes(Variable x) = [x]
          | getTypes(ConstructorP(_, pa1)) = getTypes(pa1)
          | getTypes(TupleP ps) = List.foldl(fn (pa2, a) => getTypes(pa2) @ a) [] ps
          | getTypes(_) = []
        fun isDublicates([]) = true
          | isDublicates(h::t) =
                if List.exists(fn s => s = h) t
                then false
                else isDublicates(t)
    in isDublicates(getTypes(pat)) end

(*11 task*)
fun first_match (_, Wildcard) = SOME []
  | first_match (Unit, UnitP) = SOME []
  | first_match (v , Variable s) = SOME [(s, v)]
  | first_match (Const v, ConstP p) =
        if v = p 
        then SOME [] 
        else NONE
  | first_match (Constructor(str, v), ConstructorP(str_p, p)) =
        if str = str_p 
        then first_match(v, p) 
        else NONE
  | first_match (Tuple v, TupleP p) =
        if List.length v = List.length p 
        then case all_answers first_match(ListPair.zip(v, p)) of
                  SOME v1 => SOME v1
                  |_ => NONE
        else NONE
  | first_match (_, _) = NONE
use "fourthLab.sml";

fun provided_test1() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "", "errors"]
        val strList3 = []
    in
        (only_capitals(strList1),
        only_capitals(strList2),
        only_capitals(strList3))
    end

fun provided_test2() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "errors", "srorre"]
        val strList3 = []
    in
        (longest_string1(strList1),
        longest_string1(strList2),
        longest_string1(strList3))
    end

fun provided_test3() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "errors", "srorre"]
        val strList3 = []
    in
        (longest_string2(strList1),
        longest_string2(strList2),
        longest_string2(strList3))
    end

fun provided_test4() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "errors", "srorre"]
        val strList3 = []
    in
        (longest_string3(strList1),
        longest_string3(strList2),
        longest_string3(strList3))
    end

fun provided_test5() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "errors", "srorre"]
        val strList3 = []
    in
        (longest_string4(strList1),
        longest_string4(strList2),
        longest_string4(strList3))
    end

fun provided_test6() = 
    let val strList1 = ["Hello", "My", "Name", "Is", "robert", "Valid"]
        val strList2 = ["", "Checks", "for", "errors", "srorre"]
        val strList3 = []
    in
        (longest_capitalized(strList1),
        longest_capitalized(strList2),
        longest_capitalized(strList3))
    end

fun provided_test7() = 
    let val str1 =  "cat"
        val str2 = "reversable"
        val str3 = ""
    in
        (rev_string(str1),
        rev_string(str2),
        rev_string(str3))
    end

fun provided_test8() = 
    let
        val l1 = [5]
        val l2 = [2, 4, 6, 8]
        val l3 = [10, 20, 30]
    in
        ((first_answer (fn a => if a = 5 then SOME a else NONE) l1) handle (NoAnswer) => 0,
        (first_answer (fn a => if a = 10 then SOME a else NONE) l2) handle (NoAnswer) => 0,
        (first_answer (fn a => if a = 20 then SOME a else NONE) l3) handle (NoAnswer) => 0)
    end

fun provided_test9() = 
    let
        val list1 = [3, 3, 3]
        val list2 = [3, 2, 3]
        val list3 = [10, 20, 30]
    in
        (all_answers (fn c => if c = 3 then SOME [c] else NONE) list1,
        all_answers (fn c => if c = 3 then SOME [c] else NONE) list2,
        all_answers (fn c => if c > 5 then SOME [c] else NONE) list3)
    end

fun provided_test10() = 
    let
        val p1: pattern = Wildcard
        val p2: pattern = Variable "hello"
        val p3: pattern = (TupleP ([Wildcard,ConstP(1), Wildcard, Wildcard]))
        val p4: pattern = (TupleP ([ConstP(1),ConstP(1), ConstructorP("mystr", Wildcard)]))
    in
       (count_wildcards(p1),
        count_wildcards(p2),
        count_wildcards(p3),
        count_wildcards(p4))
    end

fun provided_test11() = 
    let
        val p1: pattern = Wildcard
        val p2: pattern = Variable "txt"
        val p3: pattern = (TupleP ([Variable "some", Variable "something else", ConstructorP("str", Wildcard)]))
        val p4: pattern = (TupleP ([Wildcard, Variable "check", Wildcard, Wildcard, Variable "second check"]))
    in
       (count_wild_and_variable_lengths(p1),
        count_wild_and_variable_lengths(p2),
        count_wild_and_variable_lengths(p3),
        count_wild_and_variable_lengths(p4))
    end

fun provided_test12() = 
    let
        val p1: pattern = Wildcard
        val p2: pattern = Variable "txt"
        val p3: pattern = (TupleP ([Wildcard, Variable "check", Wildcard, Wildcard]))
        val p4: pattern = (TupleP ([Variable "some", Variable "some", ConstructorP("str", Wildcard)]))
    in
       (count_some_var("nothing", p1),
        count_some_var("txt", p2),
        count_some_var("some", p3),
        count_some_var("check", p4))
    end

fun provided_test13() = 
    let
        val p1: pattern = Wildcard
        val p2: pattern = Variable "txt"
        val p3: pattern = (TupleP ([Variable "some", Variable "some", ConstructorP("str", Wildcard)]))
        val p4: pattern = (TupleP ([Wildcard, Variable "second check", Wildcard, Wildcard, Variable "check"]))
    in
       (check_pat(p1),
        check_pat(p2),
        check_pat(p3),
        check_pat(p4))
    end

fun provided_test14() =
    (first_match(Unit, UnitP),
    first_match(Unit, Wildcard),
    first_match(Const 1, ConstP 1),
    first_match(Const 1, ConstP 2),
    first_match(Tuple[Unit, Const 0], Variable "txt"),
    first_match(Tuple[Unit, Const 1], TupleP[UnitP, ConstP 1]),
    first_match(Tuple[Unit, Const 0], TupleP[UnitP, ConstP 1]),
    first_match(Constructor("SomeTxt", Unit), ConstructorP("SomeTxt", UnitP)),
    first_match(Constructor("SomeTxt", Unit), ConstructorP("SomeOtherTxt", UnitP)),
    first_match(Constructor("SomeTxt", Unit), ConstructorP("SomeOtherTxt", Wildcard)))

val ans_first = provided_test1()
val ans_second = provided_test2()
val ans_third = provided_test3()
val ans_fourth = provided_test4()
val ans_fifth = provided_test5()
val ans_sixth = provided_test6()
val ans_seventh = provided_test7()
val ans_eighth = provided_test8()
val ans_ninth = provided_test9()
val ans_tenth = provided_test10()
val ans_eleventh = provided_test11()
val ans_twelfth = provided_test12()
val ans_thirteenth = provided_test13()
val ans_fourteenth = provided_test14()
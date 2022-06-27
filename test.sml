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
        val list1 = [5, 4, 3, 2, 1]
        val list2 = [4]
        val list3 = [1, 2, 3]
    in
        ((if (first_answer (fn arg => if arg = 4 then SOME (arg) else NONE) list1) = 4 then "Right" else "NOT") handle (NoAnswer) => "Wrong",
        (if (first_answer (fn arg => if arg = 4 then SOME (arg) else NONE) list2) = 4 then "Right" else "NOT") handle (NoAnswer) => "Wrong",
        (if (first_answer (fn arg => if arg = 4 then SOME (arg) else NONE) list3) = 4 then "Right" else "NOT") handle (NoAnswer) => "Wrong")
    end

fun provided_test9() = 
    let
        val list1 = [5, 4, 3, 2, 1]
        val list2 = [4]
        val list3 = [1, 2, 3]
    in
           (all_answers (fn arg => if arg > 0 then SOME [arg] else NONE) list1,
            all_answers (fn arg => if arg = 4 then SOME [arg] else NONE) list2,
            all_answers (fn arg => if arg < 3 then SOME [arg] else NONE) list3)
    end

fun provided_test10() = 
    let
        val pattern1: pattern = (TupleP ([ConstP(1),ConstP(1), ConstructorP("mystr", Wildcard)]))
        val pattern2: pattern = Wildcard
        val pattern3: pattern = (TupleP ([Wildcard,ConstP(1), Wildcard, Wildcard]))
        val pattern4: pattern = Variable "hello"
    in
           (count_wildcards(pattern1),
            count_wildcards(pattern2),
            count_wildcards(pattern3),
            count_wildcards(pattern4))
    end

fun provided_test11() = 
    let
        val pattern1: pattern = (TupleP ([Variable "car", Variable "bicycle", ConstructorP("mystr", Wildcard)]))
        val pattern2: pattern = Wildcard
        val pattern3: pattern = (TupleP ([Wildcard, Variable "sometext", Wildcard, Wildcard]))
        val pattern4: pattern = Variable "hello"
    in
           (count_wild_and_variable_lengths(pattern1),
            count_wild_and_variable_lengths(pattern2),
            count_wild_and_variable_lengths(pattern3),
            count_wild_and_variable_lengths(pattern4))
    end

fun provided_test12() = 
    let
        val str1 = "car" val pattern1: pattern = (TupleP ([Variable "car", Variable "car", ConstructorP("mystr", Wildcard)]))
        val str2 = "car"  val pattern2: pattern = Wildcard
        val str3 = "sometext"  val pattern3: pattern = (TupleP ([Wildcard, Variable "sometext", Wildcard, Wildcard]))
        val str4 = "hello"  val pattern4: pattern = Variable "hello"
    in
           (count_some_var(str1, pattern1),
            count_some_var(str2, pattern2),
            count_some_var(str3, pattern3),
            count_some_var(str4, pattern4))
    end

fun provided_test13() = 
    let
        val pattern1: pattern = (TupleP ([Variable "car", Variable "car", ConstructorP("mystr", Wildcard)]))
        val pattern2: pattern = Wildcard
        val pattern3: pattern = (TupleP ([Wildcard, Variable "sometext", Wildcard, Wildcard, Variable "another text"]))
        val pattern4: pattern = Variable "hello"
    in
           (check_pat(pattern1),
            check_pat(pattern2),
            check_pat(pattern3),
            check_pat(pattern4))
    end

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
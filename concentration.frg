#lang forge

option run_sterling "vis.js"

abstract sig Prerequisite {
    courses: set Course
}

abstract sig Course {
    prerequisites: set Prerequisite,
    equivalentCourses: set Course
}

sig SemesterSchedule {
    semNumber: one Int,
    semCourses: set Course
}

abstract sig coursesSet {
    setCourses: set Course
}

one sig foundationCourses extends coursesSet {}
one sig usedAdditionalCourses extends coursesSet {}
one sig usedThousandLevelCourses extends coursesSet {}
one sig fallCourses extends coursesSet {}
one sig springCourses extends coursesSet {}
one sig capstoneCourses extends coursesSet {}
one sig AICourses extends coursesSet {}
one sig algoTheoryCourses extends coursesSet {}
one sig calcCourses extends coursesSet {}
one sig thousandLevelCourses extends coursesSet {}
one sig additionalCourses extends coursesSet {}

one sig cs0111 extends Course {}
one sig cs0112 extends Course {}
one sig cs0150 extends Course {}
one sig cs0170 extends Course {}
one sig cs0190 extends Course {}
one sig cs0200 extends Course {}
one sig cs0220 extends Course {}
one sig cs0300 extends Course {}
one sig cs0320 extends Course {}
one sig cs0330 extends Course {}
one sig cs0410 extends Course {}
one sig cs0500 extends Course {}
one sig cs1010 extends Course {}
one sig cs1260 extends Course {}
one sig cs1300 extends Course {}
one sig cs1380 extends Course {}
one sig cs1410 extends Course {}
one sig cs1420 extends Course {}
one sig cs1430 extends Course {}
one sig cs1460 extends Course {}
one sig cs1470 extends Course {}
one sig cs1550 extends Course {}
one sig cs1570 extends Course {}
one sig cs1670 extends Course {}
one sig cs1680 extends Course {}
one sig cs1710 extends Course {}
one sig cs1951A extends Course {}
one sig cs1952Q extends Course {}
one sig apma1650 extends Course {}
one sig apma1655 extends Course {}
one sig math0100 extends Course {}
one sig math0180 extends Course {}
one sig math0200 extends Course {}
one sig math0520 extends Course {}
one sig math0540 extends Course {}
one sig math1450 extends Course {}
one sig math1530 extends Course {}

one sig cs0200Pre extends Prerequisite {}
one sig cs0300Pre extends Prerequisite {}
one sig cs0320Pre extends Prerequisite {}
one sig cs0330Pre extends Prerequisite {}

one sig cs0410Pre1 extends Prerequisite {}
one sig cs0410Pre2 extends Prerequisite {}
one sig cs0410Pre3 extends Prerequisite {}

one sig cs0500Pre1 extends Prerequisite {}
one sig cs0500Pre2 extends Prerequisite {}
one sig cs0500Pre3 extends Prerequisite {}
one sig cs0500Pre4 extends Prerequisite {}
one sig cs0500Pre5 extends Prerequisite {}

one sig cs1010Pre extends Prerequisite {}

one sig cs1260Pre extends Prerequisite {}

one sig cs1300Pre extends Prerequisite {}

one sig cs1380Pre extends Prerequisite {}

one sig cs1410Pre1 extends Prerequisite {}
one sig cs1410Pre2 extends Prerequisite {}

one sig cs1420Pre1 extends Prerequisite {}
one sig cs1420Pre2 extends Prerequisite {}
one sig cs1420Pre3 extends Prerequisite {}

one sig cs1430Pre1 extends Prerequisite {}
one sig cs1430Pre2 extends Prerequisite {}

one sig cs1470Pre1 extends Prerequisite {}
one sig cs1470Pre2 extends Prerequisite {}
one sig cs1470Pre3 extends Prerequisite {}

one sig cs1570Pre1 extends Prerequisite {}
one sig cs1570Pre2 extends Prerequisite {}

one sig cs1670Pre extends Prerequisite {}

one sig cs1680Pre extends Prerequisite {}

one sig cs1710Pre extends Prerequisite {}

one sig cs1951APre extends Prerequisite {}

one sig cs1952QPre1 extends Prerequisite {}
one sig cs1952QPre2 extends Prerequisite {}
one sig cs1952QPre3 extends Prerequisite {}

one sig apma1650Pre extends Prerequisite {}
one sig apma1655Pre extends Prerequisite {}

one sig math0180Pre extends Prerequisite {}
one sig math0200Pre extends Prerequisite {}

pred establishPrerequisites {
    cs0200Pre.courses = cs0150 + cs0170 + cs0190
    cs0300Pre.courses = cs0200 + cs0190
    cs0320Pre.courses = cs0200 + cs0190
    cs0330Pre.courses = cs0200 + cs0190
    
    cs0410Pre1.courses = cs0200
    cs0410Pre2.courses = cs0220 + apma1650 + apma1655 + cs1410
    cs0410Pre3.courses = math0520 + math0540

    cs0500Pre1.courses = cs0220
    cs0500Pre2.courses = cs0150 + cs0200
    cs0500Pre3.courses = cs0170 + cs0200
    cs0500Pre4.courses = cs0111 + cs0112 + cs0200
    cs0500Pre5.courses = cs0190 + cs0200

    cs1010Pre.courses = cs0220 + cs1550 + apma1650 + apma1655 + cs1570

    cs1260Pre.courses = cs0220 + cs0320 + cs0300 + cs0330

    cs1300Pre.courses = cs0190 + cs0200 + cs0320

    cs1380Pre.courses = cs0320 + cs0330 + cs0300

    cs1410Pre1.courses = cs0190 + cs0200
    cs1410Pre2.courses = cs0220 + apma1650 + apma1655

    cs1420Pre1.courses = cs0190 + cs0200
    cs1420Pre2.courses = apma1650 + apma1655
    cs1420Pre3.courses = math0520 + math0540

    cs1430Pre1.courses = cs0190 + cs0200
    cs1430Pre2.courses = math0520 + math0540

    cs1470Pre1.courses = cs0150 + cs0170 + cs0190 + cs0200
    cs1470Pre2.courses = math0520 + math0540
    cs1470Pre3.courses = cs0220 + apma1650 + apma1655

    cs1570Pre1.courses = cs0190 + cs0200
    cs1570Pre2.courses = cs0220 + math0540 + math0520 + cs1010

    cs1670Pre.courses = cs0300 + cs0330

    cs1680Pre.courses = cs0300 + cs0330

    cs1710Pre.courses = cs0190 + cs0200

    cs1951APre.courses = cs0190 + cs0200

    cs1952QPre1.courses = cs0190 + cs0200
    cs1952QPre2.courses = apma1650 + apma1655
    cs1952QPre3.courses = math0520 + math0540

    apma1650Pre.courses = math0100 + math0180 + math0200
    apma1655Pre.courses = math0180 + math0200

    math0180Pre.courses = math0100
    math0200Pre.courses = math0100

    cs0150.prerequisites = none
    cs0170.prerequisites = none
    cs0190.prerequisites = none
    cs0200.prerequisites = cs0200Pre
    cs0220.prerequisites = none
    cs0300.prerequisites = cs0300Pre
    cs0320.prerequisites = cs0320Pre
    cs0330.prerequisites = cs0330Pre
    cs0410.prerequisites = cs0410Pre1 + cs0410Pre2 + cs0410Pre3
    cs0500.prerequisites = cs0500Pre1 + cs0500Pre2 + cs0500Pre3 + cs0500Pre4 + cs0500Pre5
    cs1010.prerequisites = cs1010Pre
    cs1260.prerequisites = cs1260Pre
    cs1300.prerequisites = cs1300Pre
    cs1380.prerequisites = cs1380Pre
    cs1410.prerequisites = cs1410Pre1 + cs1410Pre2
    cs1420.prerequisites = cs1420Pre1 + cs1420Pre2 + cs1420Pre3
    cs1430.prerequisites = cs1430Pre1 + cs1430Pre2
    cs1460.prerequisites = none
    cs1470.prerequisites = cs1470Pre1 + cs1470Pre2 + cs1470Pre3
    cs1550.prerequisites = none
    cs1570.prerequisites = cs1570Pre1 + cs1570Pre2
    cs1670.prerequisites = cs1670Pre
    cs1680.prerequisites = cs1680Pre
    cs1710.prerequisites = cs1710Pre
    cs1951A.prerequisites = cs1951APre
    cs1952Q.prerequisites = cs1952QPre1 + cs1952QPre2 + cs1952QPre3
    apma1650.prerequisites = apma1650Pre
    apma1655.prerequisites = apma1655Pre
    math0100.prerequisites = none
    math0180.prerequisites = math0180Pre
    math0200.prerequisites = math0200Pre
    math0520.prerequisites = none
    math0540.prerequisites = none

    cs0150.equivalentCourses = cs0170 + cs0190
    cs0170.equivalentCourses = cs0150 + cs0190
    cs0190.equivalentCourses = cs0150 + cs0170
    cs0200.equivalentCourses = cs0111 + cs0112
    cs0300.equivalentCourses = cs0330
    cs0330.equivalentCourses = cs0300

    math0180.equivalentCourses = math0200
    math0200.equivalentCourses = math0180
    math0520.equivalentCourses = math0540
    math0540.equivalentCourses = math0520

    // define sets of courses for various categories
    fallCourses.setCourses = cs0111 + cs0150 + cs0170 + cs0190 + cs0320 + cs0330 + cs0410 + cs1010 + cs1260 + cs1410 + cs1430 + cs1570 + math0100 + math0180 + math0200 + apma1650 + apma1655 + math0520 + math0540
    springCourses.setCourses = cs0112 + cs0200 + cs0220 + cs0320 + cs0300 + cs0500 + cs1300 + cs1380 + cs1420 + cs1430 + cs1460 + cs1470 + cs1550 + cs1710 + cs1951A + cs1952Q + math0520 + math0540 + math0100 + math0180 + apma1650 + apma1655
    capstoneCourses.setCourses = cs1260 + cs1300 + cs1380 + cs1410 + cs1420
    AICourses.setCourses = cs1410 + cs1420 + cs1430 + cs1460 + cs1470 + cs1951A + cs1952Q
    algoTheoryCourses.setCourses = cs0500 + cs1010 + cs1550 + cs1570
    calcCourses.setCourses = math0100 + math0180 + math0200
    thousandLevelCourses.setCourses = cs1010 + cs1260 + cs1300 + cs1380 + cs1410 + cs1420 + cs1430 + cs1460 + cs1470 + cs1550 + cs1570 + cs1670 + cs1680 + cs1951A + cs1952Q
    additionalCourses.setCourses = cs0320 + cs1010 + cs1410 + cs1420 + cs1430 + cs1460 + cs1470 + cs1550 + cs1570 + cs1951A + cs1952Q + math0520 + math0540
}

// One of 220, 1450, APMA 1650/1655, or MATH 1530
pred fullFillsMathFoundations {
    some semSched: SemesterSchedule | {
        cs0220 in semSched.semCourses or
        math1450 in semSched.semCourses or
        apma1650 in semSched.semCourses or
        apma1655 in semSched.semCourses or
        math1530 in semSched.semCourses
    }
}

pred hasAlgoTheoryCourse {
    // has some algorithms or theory course (part of the new requirements)
    // only one should be in foundation courses even if all are taken
    some semSched: SemesterSchedule | {
        some {semSched.semCourses & algoTheoryCourses.setCourses}
        
        cs1010 in semSched.semCourses => cs1010 in foundationCourses.setCourses or
        cs1550 in semSched.semCourses => cs1550 in foundationCourses.setCourses or
        cs1570 in semSched.semCourses => cs1570 in foundationCourses.setCourses

        // let algTheoryCoursesInSched = semSched.semCourses & algoTheoryCourses.setCourses
        
        // {cs1010 in algTheoryCoursesInSched => {
        //     cs1010 in foundationCourses.setCourses
        //     no cs1550 + cs1570 & foundationCourses.setCourses
        // }
        // else cs1550 in algTheoryCoursesInSched => {
        //     cs1550 in foundationCourses.setCourses
        //     no cs1570 & foundationCourses.setCourses
        // }
        // else cs1570 in algTheoryCoursesInSched => {
        //     cs1570 in foundationCourses.setCourses
        // }}

    }

    
}


pred hasAICourse {
    // has some AI course (part of the new requirements)
    some semSched: SemesterSchedule | {
        some {semSched.semCourses & AICourses.setCourses}
        cs1410 in semSched.semCourses => cs1410 in foundationCourses.setCourses
        cs1420 in semSched.semCourses => cs1420 in foundationCourses.setCourses
        cs1430 in semSched.semCourses => cs1430 in foundationCourses.setCourses
        cs1460 in semSched.semCourses => cs1460 in foundationCourses.setCourses
        cs1470 in semSched.semCourses => cs1470 in foundationCourses.setCourses
        cs1951A in semSched.semCourses => cs1951A in foundationCourses.setCourses
        cs1952Q in semSched.semCourses => cs1952Q in foundationCourses.setCourses
    }
}

pred hasSystemsCourse[isAB: Int] {
    // must have a systems course -- for the AB, this includes cs0320
    some semSched: SemesterSchedule | {
        (cs0300 in semSched.semCourses or cs0330 in semSched.semCourses)
        or (cs0320 in semSched.semCourses and isAB = 1)

        cs0300 in semSched.semCourses => cs0300 in foundationCourses.setCourses
        cs0330 in semSched.semCourses => cs0330 in foundationCourses.setCourses
        cs0320 in semSched.semCourses => cs0320 in foundationCourses.setCourses
    }
}

pred fulfillsIntermediateRequirements[isAB: Int] {
    hasSystemsCourse[isAB] and hasAICourse and hasAlgoTheoryCourse
}

pred fifteenTwentyIntroSequence {
    // take cs0150 and then cs0200 in a later semester
    some semSched: SemesterSchedule | {
        cs0150 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0200 in laterSemSchedule.semCourses
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred fulfillsIntroSequence {
    fifteenTwentyIntroSequence or seventeenTwentyIntroSequence or oneelevenTwohundredIntroSequence or oneelevenOnetwelveTwohundredIntroSequence
}

pred seventeenTwentyIntroSequence {
    // take cs0170 and then cs0200 in a later semester
    some semSched: SemesterSchedule | {
        cs0170 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0200 in laterSemSchedule.semCourses
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred oneelevenTwohundredIntroSequence {
    // take cs0111 and then cs0200 in a later semester
    some semSched: SemesterSchedule | {
        cs0111 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0200 in laterSemSchedule.semCourses
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred oneelevenOnetwelveTwohundredIntroSequence {
    // take cs0111 and then cs0112 and then cs0200 in a later semester
    some semSched: SemesterSchedule | {
        cs0111 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0112 in laterSemSchedule.semCourses and 
                {some evenLaterSemSchedule: SemesterSchedule | {
                    cs0200 in evenLaterSemSchedule.semCourses
                    evenLaterSemSchedule.semNumber > laterSemSchedule.semNumber
                }}
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred fulfillsAllCoursePrereqs {
    // for all semesters
    all semSched: SemesterSchedule | {
        // for all courses in that semester
        all course: semSched.semCourses | {
            // for all prerequisite sets of that course
            all prereq: course.prerequisites | {
                // we must have taken one course in the set of prerequisites in some earlier semester
                some earlierSemSchedule: SemesterSchedule | {
                    some prereqCourse: prereq.courses | {
                        prereqCourse in earlierSemSchedule.semCourses
                        earlierSemSchedule.semNumber < semSched.semNumber
                    }
                }
            }
        }
    }   
}

pred noEquivalentTaken {
    // cannot take equivalent courses (at least for credit, e.g. you can't get credit for both 300 and 330)
    no semSched1, semSched2: SemesterSchedule | 
        {some course: semSched1.semCourses | 
            {some course.equivalentCourses & semSched2.semCourses}}
}

pred atLeastSomeThousandLevel[numThousandLevel: Int] {
    // must take the indicated number of thousand-level courses
    #{sem: SemesterSchedule, course: Course | 
        course in sem.semCourses and course in thousandLevelCourses.setCourses and course not in foundationCourses.setCourses
        and course in usedThousandLevelCourses.setCourses and course not in usedAdditionalCourses.setCourses
    } >= numThousandLevel
}

pred someAdditionalCourses[numAdditional: Int] {
    // must take the indicated number of additional courses
    #{sem: SemesterSchedule, course: Course | 
        course in sem.semCourses and course in additionalCourses.setCourses and course not in foundationCourses.setCourses and
        course in usedAdditionalCourses.setCourses and course not in usedThousandLevelCourses.setCourses
    } >= numAdditional
}

pred fulfillsCalcRequirement[isAB: Int, hasHSCredit: Int] {
    // if ScB, must take math0100, math0180, math0200, or have HS credit
    {some semSched: SemesterSchedule | 
        some {semSched.semCourses & calcCourses.setCourses}}
    or isAB = 1 or hasHSCredit = 1
}

// fulling the capstone requirement means that you take one of these courses in your 7th or 8th semester
pred fullfillsCapstoneRequirement {
    some semSched: SemesterSchedule | {
        semSched.semNumber = 6 or semSched.semNumber = 7
        and some {semSched.semCourses & capstoneCourses.setCourses}
    } 
}

pred validSemesterSchedule {
    // can't have a semester number less than 0 or greater than 7
    all sem: SemesterSchedule | sem.semNumber >= 0 and sem.semNumber <= 7

    // no two semesters can have the same number
    no disj sem1, sem2: SemesterSchedule | sem1.semNumber = sem2.semNumber

    // take between 0 and 5 CS courses per semester
    all sem: SemesterSchedule | #{sem.semCourses} <= 5 and #{sem.semCourses} >= 0
    
    // can't take the same course twice
    no disj sem1, sem2: SemesterSchedule | sem1.semCourses & sem2.semCourses != none
}

pred coursesInCorrectSemester {
    all sem: SemesterSchedule | {
        remainder[sem.semNumber, 2] = 0 => {all course: sem.semCourses | course in fallCourses.setCourses}
        remainder[sem.semNumber, 2] = 1 => {all course: sem.semCourses | course in springCourses.setCourses}
    }
}

pred wellformedSchedule {
    validSemesterSchedule and coursesInCorrectSemester
}

pred limitCSCourses[limit: Int] {
    // limit the CS courses to some number per semester
    all sem: SemesterSchedule | #{sem.semCourses} <= limit and #{sem.semCourses} >= 0
}

pred finishBySem[semNum: Int] {
    // no concentration courses beyond the given semester number (since we use 0-based sem numbers, subtract one)
    all sem: SemesterSchedule | sem.semNumber > subtract[semNum, 1] => #{sem.semCourses} = 0
}

pred includeCourse[course: Course] {
    // include the given course in the course plan
    some sem: SemesterSchedule | course in sem.semCourses
}

pred validSCBPlan {
    establishPrerequisites
    fulfillsCalcRequirement[0, 0] //  second arg is 0 if no HS credit, 1 if HS credit
    fulfillsIntroSequence
    fulfillsIntermediateRequirements[0]
    someAdditionalCourses[4]
    atLeastSomeThousandLevel[5]
    fulfillsAllCoursePrereqs
    wellformedSchedule
    noEquivalentTaken
    fullfillsCapstoneRequirement
    fullFillsMathFoundations
}

pred validABPlan {
    establishPrerequisites
    fulfillsCalcRequirement[1, 0] // second arg is 0 if no HS credit, 1 if HS credit
    fulfillsIntroSequence
    fulfillsIntermediateRequirements[1]
    someAdditionalCourses[2]
    atLeastSomeThousandLevel[2]
    fulfillsAllCoursePrereqs
    wellformedSchedule
    noEquivalentTaken
    fullfillsCapstoneRequirement
    fullFillsMathFoundations
}

run {
    validSCBPlan
    // validABPlan // uncomment this line to run the AB plan and comment out the SCB plan
    finishBySem[8]
    // includeCourse[cs1710]
} for exactly 8 SemesterSchedule, 8 Int


/* TESTING:

- for examples, we can write examples, but since they can be very long/involved, we don't need many examples
- more focus on necessary/sufficient tests 
- is it possible to graduate taking only these classes, or taking some set of courses
- group classes into specific pathways, and write necessary/sufficient tests based on these
- beyond just writing A + B allows us to take C
- checking for under/over constraints
- don't just reiterate what the model is saying

Final presentation:
- create a presentation of one possible output of the model
*/
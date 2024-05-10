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

abstract sig coursesUsed {
    foundationCourses: set Course
}

one sig usedCourses extends coursesUsed {}

one sig cs0111 extends Course {}
one sig cs0112 extends Course {}
one sig cs0150 extends Course {}
one sig cs0170 extends Course {}
one sig cs0190 extends Course {}
one sig cs0200 extends Course {}
one sig cs0300 extends Course {}
one sig cs0320 extends Course {}
one sig cs0330 extends Course {}
one sig cs0410 extends Course {}
one sig cs0500 extends Course {}
one sig cs0530 extends Course {}
one sig cs1010 extends Course {}
one sig cs1120 extends Course {}
one sig cs1410 extends Course {}
one sig cs1411 extends Course {}
one sig cs1420 extends Course {}
one sig cs1430 extends Course {}
one sig cs1460 extends Course {}
one sig cs1470 extends Course {}
one sig cs1550 extends Course {}
one sig cs1570 extends Course {}
one sig cs1951A extends Course {}
one sig cs1952Q extends Course {}
one sig cs0220 extends Course {}
one sig apma1650 extends Course {}
one sig apma1655 extends Course {}
one sig math0520 extends Course {}
one sig math0540 extends Course {}
one sig math0100 extends Course {}
one sig math0180 extends Course {}
one sig math0200 extends Course {}
// capstone courses
// one sig cs1230 extends Course {}
// one sig cs1234 extends Course {}
one sig cs1260 extends Course {}
one sig cs1290 extends Course {}
one sig cs1300 extends Course {}
one sig cs1320 extends Course {}
one sig cs1370 extends Course {}
one sig cs1380 extends Course {}
// one sig cs1440 extends Course {}
// one sig cs1515 extends Course {}
// one sig cs1600 extends Course {}
// one sig cs1660 extends Course {}
// one sig cs1620 extends Course {}
// one sig cs1670 extends Course {}
// one sig cs1690 extends Course {}
// one sig cs1680 extends Course {}
// one sig cs1710 extends Course {}
// one sig cs1730 extends Course {}
// one sig cs1760 extends Course {}
// one sig cs1950U extends Course {}
// one sig cs1951C extends Course {}
// one sig cs1951I extends Course {}
// one sig cs1951U extends Course {}
// one sig cs1952B extends Course {}
// one sig cs1970 extends Course {}
// one sig cs2240 extends Course {}
// one sig cs2370 extends Course {}
// one sig cs2390 extends Course {}
// one sig cs2420 extends Course {}
// one sig cs2500B extends Course {}
// one sig cs2510 extends Course {}
// one sig cs2950T extends Course {}
// one sig cs2950V extends Course {}
// one sig cs2951I extends Course {}
// one sig cs2952K extends Course {}
// one sig cs2952N extends Course {}


one sig cs0200Pre extends Prerequisite {}
one sig cs0300Pre extends Prerequisite {}
one sig cs0320Pre extends Prerequisite {}
one sig cs0330Pre extends Prerequisite {}

one sig cs0410Pre1 extends Prerequisite {}
one sig cs0410Pre2 extends Prerequisite {}
one sig cs0410Pre3 extends Prerequisite {}

one sig cs0500Pre extends Prerequisite {}
one sig cs1010Pre extends Prerequisite {}
one sig cs1120Pre extends Prerequisite {}
one sig cs1410Pre extends Prerequisite {}
one sig cs1411Pre extends Prerequisite {}
one sig cs1420Pre extends Prerequisite {}
one sig cs1430Pre extends Prerequisite {}
one sig cs1460Pre extends Prerequisite {}
one sig cs1470Pre extends Prerequisite {}
one sig cs1550Pre extends Prerequisite {}
one sig cs1570Pre extends Prerequisite {}
one sig cs1951APre extends Prerequisite {}
one sig cs1952QPre extends Prerequisite {}

pred establishPrerequisites {
    cs0200Pre.courses = cs0150 + cs0170 + cs0190
    cs0300Pre.courses = cs0200 + cs0190
    cs0320Pre.courses = cs0200 + cs0190
    cs0330Pre.courses = cs0200 + cs0190
    
    cs0410Pre1.courses = cs0200
    cs0410Pre2.courses = cs0220 + apma1650 + apma1655 + cs1410
    cs0410Pre3.courses = math0520 + math0540 + cs0530

    cs0150.prerequisites = none
    cs0170.prerequisites = none
    cs0190.prerequisites = none
    cs0200.prerequisites = cs0200Pre
    cs0300.prerequisites = cs0300Pre
    cs0320.prerequisites = cs0320Pre
    cs0330.prerequisites = cs0330Pre
    cs0410.prerequisites = cs0410Pre1 + cs0410Pre2 + cs0410Pre3

    cs0150.equivalentCourses = cs0170 + cs0190
    cs0170.equivalentCourses = cs0150 + cs0190
    cs0190.equivalentCourses = cs0150 + cs0170
    cs0300.equivalentCourses = cs0330
    cs0330.equivalentCourses = cs0300
}

pred hasAlgoTheoryCourse {
    // has some algorithms or theory course (part of the new requirements)
    some semSched: SemesterSchedule | {
        (cs0500 in semSched.semCourses or cs1010 in semSched.semCourses or cs1550 in semSched.semCourses or cs1570 in semSched.semCourses)
    
        cs1010 in semSched.semCourses => cs1010 in usedCourses.foundationCourses
        cs1550 in semSched.semCourses => cs1550 in usedCourses.foundationCourses
        cs1570 in semSched.semCourses => cs1570 in usedCourses.foundationCourses
    }
}

pred hasAICourse {
    // has some AI course (part of the new requirements)
    some semSched: SemesterSchedule | {
        (cs0410 in semSched.semCourses or cs1410 in semSched.semCourses or cs1411 in semSched.semCourses or cs1420 in semSched.semCourses or cs1430 in semSched.semCourses or cs1460 in semSched.semCourses or cs1470 in semSched.semCourses or cs1951A in semSched.semCourses or cs1952Q in semSched.semCourses)

        cs1410 in semSched.semCourses => cs1410 in usedCourses.foundationCourses
        cs1411 in semSched.semCourses => cs1411 in usedCourses.foundationCourses
        cs1420 in semSched.semCourses => cs1420 in usedCourses.foundationCourses
        cs1430 in semSched.semCourses => cs1430 in usedCourses.foundationCourses
        cs1460 in semSched.semCourses => cs1460 in usedCourses.foundationCourses
        cs1470 in semSched.semCourses => cs1470 in usedCourses.foundationCourses
        cs1951A in semSched.semCourses => cs1951A in usedCourses.foundationCourses
        cs1952Q in semSched.semCourses => cs1952Q in usedCourses.foundationCourses
    }
}

pred hasSystemsCourse[isAB: Int] {
    // must have a systems course -- for the AB, this includes cs0320
    some semSched: SemesterSchedule | {
        (cs0300 in semSched.semCourses or cs0330 in semSched.semCourses)
        or (cs0320 in semSched.semCourses and isAB = 1)

        cs0300 in semSched.semCourses => cs0300 in usedCourses.foundationCourses
        cs0330 in semSched.semCourses => cs0330 in usedCourses.foundationCourses
        cs0320 in semSched.semCourses => cs0320 in usedCourses.foundationCourses
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
    no disj semSched1, semSched2: SemesterSchedule | 
        {some course: semSched1.semCourses | 
            {some equivalentCourse: course.equivalentCourses | equivalentCourse in semSched2.semCourses}}
}

pred atLeastSomeThousandLevel[numThousandLevel: Int] {
    // must take the indicated number of thousand-level courses
    let thousandLevelCourses = cs1010 + cs1120 + cs1410 + cs1411 + cs1420 + cs1430 + cs1460 + cs1470 + cs1550 + cs1570 + cs1951A + cs1952Q {
        #{sem: SemesterSchedule, course: Course | course in sem.semCourses and course in thousandLevelCourses and course not in usedCourses.foundationCourses} >= numThousandLevel
    }
}

pred someAdditionalCourses[numAdditional: Int] {
    // must take the indicated number of additional courses
    let additionalCourses = cs0320 + cs1010 + cs1120 + cs1410 + cs1411 + cs1420 + cs1430 + cs1460 + cs1470 + cs1550 + cs1570 + cs1951A + cs1952Q + math0520 + math0540 {
        #{sem: SemesterSchedule, course: Course | course in sem.semCourses and course in additionalCourses and course not in usedCourses.foundationCourses} >= numAdditional
    }
}

pred fulfillsCalcRequirement[isAB: Int, hasHSCredit: Int] {
    // if ScB, must take math0100, math0180, math0200, or have HS credit
    {some semSched: SemesterSchedule | 
        (math0100 in semSched.semCourses and math0180 in semSched.semCourses and math0200 in semSched.semCourses)}
    or isAB = 1 or hasHSCredit = 1
}

// fulling the capstone requirement means that you take one of these courses in your 7th or 8th semester
pred fullfillsCapstoneRequirement {
    some semSched: SemesterSchedule | {

        semSched.semNumber = 7 or semSched.semNumber = 8

        // (cs1230 in semSched.semCourses and cs1234 in semSched.semCourses)
        cs1260 in semSched.semCourses
        or cs1290 in semSched.semCourses
        or cs1300 in semSched.semCourses
        or cs1320 in semSched.semCourses
        or cs1370 in semSched.semCourses
        or cs1380 in semSched.semCourses
        or cs1410 in semSched.semCourses
        or cs1420 in semSched.semCourses
        // or cs1430 in semSched.semCourses
        // or cs1440 in semSched.semCourses
        // or cs1470 in semSched.semCourses
        // or cs1515 in semSched.semCourses
        // or cs1600 in semSched.semCourses
        // or (cs1660 in semSched.semCourses and cs1620 in semSched.semCourses)
        // or (cs1670 in semSched.semCourses and cs1690 in semSched.semCourses)
        // or cs1680 in semSched.semCourses
        // or cs1710 in semSched.semCourses
        // or cs1730 in semSched.semCourses
        // or cs1760 in semSched.semCourses
        // or cs1950U in semSched.semCourses
        // or cs1951A in semSched.semCourses
        // or cs1951C in semSched.semCourses
        // or cs1951I in semSched.semCourses
        // or cs1951U in semSched.semCourses
        // or cs1952B in semSched.semCourses
        // or cs1970 in semSched.semCourses
        // or cs2240 in semSched.semCourses
        // or cs2370 in semSched.semCourses
        // or cs2390 in semSched.semCourses
        // or cs2420 in semSched.semCourses
        // or cs2500B in semSched.semCourses
        // or cs2510 in semSched.semCourses
        // or cs2950T in semSched.semCourses
        // or cs2950V in semSched.semCourses
        // or cs2951I in semSched.semCourses
        // or cs2952K in semSched.semCourses
        // or cs2952N in semSched.semCourses
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

run {
    establishPrerequisites
    fulfillsCalcRequirement[0, 0] // 0 for ScB, 1 for AB; second arg is 0 if no HS credit, 1 if HS credit
    fulfillsIntroSequence
    fulfillsIntermediateRequirements[0] // 0 for ScB, 1 for AB
    someAdditionalCourses[4] // 4 for ScB, 2 for AB
    atLeastSomeThousandLevel[5] // 5 for ScB, 2 for AB
    fulfillsAllCoursePrereqs
    validSemesterSchedule
    noEquivalentTaken
    finishBySem[5]
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
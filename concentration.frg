#lang forge

// TODO: Account for fall v spring courses


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
    some semSched: SemesterSchedule | 
        (cs0500 in semSched.semCourses or cs1010 in semSched.semCourses or cs1550 in semSched.semCourses or cs1570 in semSched.semCourses)
}

pred hasAICourse {
    some semSched: SemesterSchedule | 
        (cs0410 in semSched.semCourses or cs1410 in semSched.semCourses or cs1411 in semSched.semCourses or cs1420 in semSched.semCourses or cs1430 in semSched.semCourses or cs1460 in semSched.semCourses or cs1470 in semSched.semCourses or cs1951A in semSched.semCourses or cs1952Q in semSched.semCourses)
}

pred hasSystemsCourse {
    some semSched: SemesterSchedule | 
        (cs0300 in semSched.semCourses or cs0320 in semSched.semCourses or cs0330 in semSched.semCourses)
}

pred fulfillsIntermediateRequirements {
    hasSystemsCourse
}

pred fifteenTwentyIntroSequence {
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
    some semSched: SemesterSchedule | {
        cs0170 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0200 in laterSemSchedule.semCourses
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred oneelevenTwohundredIntroSequence {
    some semSched: SemesterSchedule | {
        cs0111 in semSched.semCourses and {some laterSemSchedule: SemesterSchedule | {
            cs0200 in laterSemSchedule.semCourses
            laterSemSchedule.semNumber > semSched.semNumber
        }}
    }
}

pred oneelevenOnetwelveTwohundredIntroSequence {
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
    all semSched: SemesterSchedule | {
        all course: semSched.semCourses | {
            all prereq: course.prerequisites | {
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
    no disj semSched1, semSched2: SemesterSchedule | 
        {some course: semSched1.semCourses | 
            {some equivalentCourse: course.equivalentCourses | equivalentCourse in semSched2.semCourses}}
}

// pred 1120IntroSequence {
//     some semSched: SemesterSchedule | {
//         cs0111 in semSched.semCourses and some laterSemSchedule: SemesterSchedule | {
//             cs0200 in laterSemSchedule.semCourses
//             laterSemSchedule.semNumber > semSched.semNumber
//         }
//     }
// }

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


run {
    establishPrerequisites
    fulfillsIntroSequence
    fulfillsIntermediateRequirements
    fulfillsAllCoursePrereqs
    validSemesterSchedule
    noEquivalentTaken
} for exactly 5 SemesterSchedule
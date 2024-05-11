#lang forge

open "concentration.frg"

// IMPORTANT: you may see warnings when you run our tests stating that the some following tests do no not 
// reference their respective predicate, this is because those predicates takes in an argument
// depending on whether we are specifiying for the SCB or AB concentration.
// We were having some trouble writing assert statements for some predicate so
// we instead call another predicate which calls the orginal predicate
// with the argument passed in 
// FOR example: the hasSCBSysCourse and hasABSysCourse predicates

// test suite for wellformedSchedule {
//     // eight semester constraint
//     assert eightSemesters is necessary for wellformedSchedule

//     // semesters are assigned different numbers
//     assert disjointSemesters is necessary for wellformedSchedule

//     // can take max 5 courses per semester
//     assert maxFiveCourses is necessary for wellformedSchedule

//     // cannot take the same course twice
//     assert cantTakeSameCourseTwice is necessary for wellformedSchedule

//     // courses must be in the proper season when they are offered
//     assert coursesInProperSeason is necessary for wellformedSchedule

//     // it is possible to have no classes in all semester
//     assert noClasses is sufficient for wellformedSchedule

//     test expect {
//         // cant have more than 5 courses in a semester
//         sixClassesNotValid : {
//             some sem : SemesterSchedule | #{sem.semCourses} = 6 and wellformedSchedule
//         } is unsat
//     } 

// }

// test suite for fulfillsIntroSequence {
//     test expect {
//         // going from 11 to 200 is valid
//         validIntroSequence11to200 : {
//             {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
//             eightSemesters
//             disjointSemesters
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is sat

//         // going from just 11 to 12 is invalid
//         invalidIntroSequence11to12 : {
//             {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0112 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
//             {no sem3: SemesterSchedule | cs0200 in sem3.semCourses or cs0190 in sem3.semCourses}            
//             eightSemesters
//             disjointSemesters
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is unsat

//         // going from 11 to 15 to 200 is valid
//         validIntroSequence11to15to200 : {
//             {some disj sem1, sem2, sem3: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and cs0200 in sem3.semCourses and sem1.semNumber < sem2.semNumber and sem2.semNumber < sem3.semNumber}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is sat

//         // going from 11 to 15 to 12 is invalid
//         invalidIntroSequence11to15to12 : {
//             {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
//             {no sem3: SemesterSchedule | cs0200 in sem3.semCourses or cs0190 in sem3.semCourses}            
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is unsat

//         // going from 11 to 15 to 15 to 200 is invalid, not wellformed schedule
//         invalidIntroSequence11to15to15to200 : {
//             {some disj sem1, sem2, sem3, sem4: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and cs0150 in sem3.semCourses and cs0200 in sem4.semCourses and sem1.semNumber < sem2.semNumber and sem2.semNumber < sem3.semNumber and sem3.semNumber < sem4.semNumber}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//             wellformedSchedule
//         } is unsat

//         // going from 15 to 200 is valid
//         validIntroSequence15to200 : {
//             {some disj sem1, sem2: SemesterSchedule | cs0150 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is sat

//         // going from 17 to 200 is valid
//         validIntroSequence17to200 : {
//             {some disj sem1, sem2: SemesterSchedule | cs0170 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is sat

//         validIntroHas19 : {
//             {some sem1: SemesterSchedule | cs0190 in sem1.semCourses}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsIntroSequence
//         } is sat
//     }
// }

// test suite for fulfillsCalcRequirement {
//     test expect {
//         // math 100 is necessary for fulfillsCalcRequirement
//         noCalcNotValidSCB : {
//             {no sem: SemesterSchedule | math0100 in sem.semCourses}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsCalcRequirement[0, 0]
//         } is unsat

//         // don't need to take any calc course if AB
//         noCalcABValid : {
//             {no sem: SemesterSchedule | some {sem.semCourses & calcCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsCalcRequirement[1, 0]
//         } is sat
        
//         // don't need to take any calc course if have HS credit
//         noCalcHSCreditValid : {
//             {no sem: SemesterSchedule | some {sem.semCourses & calcCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             fulfillsCalcRequirement[0, 1]
//         } is sat
//     }
// }

// pred hasOnlyCS0300 {
//     some sem: SemesterSchedule | cs0300 in sem.semCourses
//     cs0300 in foundationCourses.setCourses
//     cs0330 not in foundationCourses.setCourses
//     cs0320 not in foundationCourses.setCourses
//     no sem: SemesterSchedule | {cs0330 in sem.semCourses or cs0320 in sem.semCourses}
// }

// pred hasOnlyCS0330 {
//     some sem: SemesterSchedule | cs0330 in sem.semCourses
//     cs0330 in foundationCourses.setCourses
//     cs0300 not in foundationCourses.setCourses
//     cs0320 not in foundationCourses.setCourses
//     no sem: SemesterSchedule | {cs0300 in sem.semCourses or cs0320 in sem.semCourses}
// }

// pred hasOnlyCS0320 {
//     some sem: SemesterSchedule | cs0320 in sem.semCourses
//     cs0320 in foundationCourses.setCourses
//     cs0300 not in foundationCourses.setCourses
//     cs0330 not in foundationCourses.setCourses
//     no sem: SemesterSchedule | {cs0300 in sem.semCourses or cs0330 in sem.semCourses}
// }

// pred hasCS300OrCS330 {
//     some sem: SemesterSchedule | {
//         { cs0300 in sem.semCourses and cs0300 in foundationCourses.setCourses } or
//         { cs0330 in sem.semCourses and cs0330 in foundationCourses.setCourses }
//     }
// }

// pred hasCS300OrCS0320OrCS330 {
//     some sem: SemesterSchedule | {
//         { cs0300 in sem.semCourses and cs0300 in foundationCourses.setCourses 
//             and cs0320 not in foundationCourses.setCourses and cs0330 not in foundationCourses.setCourses } or
//         { cs0320 in sem.semCourses and cs0320 in foundationCourses.setCourses 
//             and cs0300 not in foundationCourses.setCourses and cs0330 not in foundationCourses.setCourses} or
//         { cs0330 in sem.semCourses and cs0330 in foundationCourses.setCourses 
//             and cs0320 not in foundationCourses.setCourses and cs0300 not in foundationCourses.setCourses }
//     }
// }

// pred hasSCBSysCourse {
//     hasSystemsCourse[0]
// }

// pred hasABSysCourse {
//     hasSystemsCourse[1]
// }


// // IMPORTANT: you may see warnings stating that the following tests do no not 
// // reference hasSystemsCourse, this is because hasSystemsCourse takes in an argument
// // depending on whether we are specifiying for the SCB or AB concentration.
// // We were having some trouble writing assert statements for this predicate so
// // we instead call hasSystemsCourse with the argument in the hasSCBSysCourse and
// // hasABSysCourse predicates above.
// test suite for hasSystemsCourse {
//     assert hasOnlyCS0300 is sufficient for hasSCBSysCourse
//     assert hasOnlyCS0330 is sufficient for hasSCBSysCourse

//     assert hasOnlyCS0300 is sufficient for hasABSysCourse
//     assert hasOnlyCS0330 is sufficient for hasABSysCourse
//     assert hasOnlyCS0320 is sufficient for hasABSysCourse

//     assert hasCS300OrCS330 is necessary for hasSCBSysCourse
//     assert hasCS300OrCS0320OrCS330 is necessary for hasABSysCourse

//     test expect {
//         noCS300Or330NotValidSCB : {
//             {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0330 in sem.semCourses}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             hasSCBSysCourse
//         } is unsat

//         noCS300Or320Or330NotValidAB : {
//             {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             hasABSysCourse
//         } is unsat

//         noCS300Or320Or330NotValidSCB : {
//             {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             hasSCBSysCourse
//         } is unsat
//     }
// }

// // predicates utilized for passing in arguments to the implementation predicate
pred fulfillsIntermediateRequirementsSCB {
    fulfillsIntermediateRequirements[0]
}

// pred fulfillsIntermediateRequirementsAB {
//     fulfillsIntermediateRequirements[1]
// }

test suite for fulfillsIntermediateRequirements {
    // assert fulfillsIntermediateRequirementsSCB is necessary for fulfillsIntermediateRequirementsSCB
    // assert fulfillsIntermediateRequirementsAB is necessary for fulfillsIntermediateRequirementsAB

    // assert hasAICourse is necessary for fulfillsIntermediateRequirementsSCB
    // assert hasAICourse is necessary for fulfillsIntermediateRequirementsAB

    // assert hasAlgoTheoryCourse is necessary for fulfillsIntermediateRequirementsSCB
    // assert hasAlgoTheoryCourse is necessary for fulfillsIntermediateRequirementsAB

    // assert hasSCBSysCourse is necessary for fulfillsIntermediateRequirementsSCB
    // assert hasABSysCourse is necessary for fulfillsIntermediateRequirementsAB

    test expect {
        // // not having an AI course is not valid
        // noAICourseNotValidSCB : {
        //     {no sem: SemesterSchedule | some {sem.semCourses & AICourses.setCourses}}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsSCB
        // } is unsat

        // noAICourseNotValidAB : {
        //     {no sem: SemesterSchedule | some {sem.semCourses & AICourses.setCourses}}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsAB
        // } is unsat

        // // not having an algo theory course is not valid
        // noAlgoTheoryCourseNotValidSCB : {
        //     {no sem: SemesterSchedule | some {sem.semCourses & algoTheoryCourses.setCourses}}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsSCB
        // } is unsat

        // noAlgoTheoryCourseNotValidAB : {
        //     {no sem: SemesterSchedule | some {sem.semCourses & algoTheoryCourses.setCourses}}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsAB
        // } is unsat

        // // not having a systems course is not valid
        // noSCBSysCourseNotValidSCB : {
        //     {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0330 in sem.semCourses}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsSCB
        // } is unsat

        // noABSysCourseNotValidAB : {
        //     {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses}
        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsAB
        // } is unsat

        // // taking multiple courses from each area is valid (testing for overconstraining)
        // // student is not limited to only one course from each area
        // allCoursesValidSCB : {
        //     some sem : SemesterSchedule | {
        //         some disj c1, c2 : AICourses.setCourses | c1 in sem.semCourses and c2 in sem.semCourses
        //         some disj c1, c2 : algoTheoryCourses.setCourses | c1 in sem.semCourses and c2 in sem.semCourses
        //         cs0300 in sem.semCourses or cs0330 in sem.semCourses
        //     }

        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsSCB
        // } is sat

        // allCoursesValidAB : {
        //     some sem : SemesterSchedule | {
        //         some disj c1, c2 : AICourses.setCourses | c1 in sem.semCourses and c2 in sem.semCourses
        //         some disj c1, c2 : algoTheoryCourses.setCourses | c1 in sem.semCourses and c2 in sem.semCourses
        //         cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses
        //     }

        //     establishPrerequisites
        //     fulfillsAllCoursePrereqs
        //     fulfillsIntermediateRequirementsAB
        // } is sat

        // only one of the courses gets 1000 level course gets added to foundation courses
        oneCourseFromEachAreaInFoundationsValidSCB : {
            some sem1 : SemesterSchedule | {
                some c1 : AICourses.setCourses | {
                    c1 = cs1410 and c1 in sem1.semCourses and cs1410 in foundationCourses.setCourses and no {cs1420 + cs1430 + cs1460 + cs1470 + cs1951A + cs1952Q} & foundationCourses.setCourses} 
                some c2 : algoTheoryCourses.setCourses | {
                    c2 = cs1010 and c2 in sem1.semCourses and cs1010 in foundationCourses.setCourses and {some {cs1550 + cs1570} & foundationCourses.setCourses}}
                cs0300 in sem1.semCourses or cs0330 in sem1.semCourses

            }

            establishPrerequisites
            // fulfillsAllCoursePrereqs
            fulfillsIntermediateRequirementsSCB
        } is unsat
    }    
    
}

// pred additionalCoursesSCB {
//     someAdditionalCourses[4]
// }

// pred additionalCoursesAB {
//     someAdditionalCourses[2]
// }

// test suite for someAdditionalCourses {
//     // additional courses must be taken to fulfill the CS requirement
//     test expect {
//         noAdditionalCoursesNotValidSCB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) - foundationCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesSCB
//         } is unsat

//         noAdditionalCoursesNotValidAB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) - foundationCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesAB
//         } is unsat

//         // some course is in both additional and foundation courses is not valid
//         additionalAndFoundationNotValidSCB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) & foundationCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesSCB
//         } is sat

//         additionalAndFoundationNotValidAB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) & foundationCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesAB
//         } is sat

//         // additional course can't be an already utilized 1000 level course
//         additionalAndUsedThousandNotValidSCB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) & usedThousandLevelCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesSCB
//         } is sat

//         additionalAndUsedThousandNotValidAB : {
//             {no sem: SemesterSchedule | some {(sem.semCourses & additionalCourses.setCourses) & usedThousandLevelCourses.setCourses}}
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesAB
//         } is sat

//         // no limit on the number of additional courses you can take
//         // also making sure this predicate does not constrain the number of classes in a semester
//         allAdditionalCoursesValidSCB : {
//             some  disj sem1, sem2 : SemesterSchedule | {
//                 some disj c1, c2, c3, c4, c5, c6, c7 : additionalCourses.setCourses | c1 in sem2.semCourses and c2 in sem1.semCourses and c3 in sem2.semCourses and c4 in sem2.semCourses and c5 in sem2.semCourses and c6 in sem2.semCourses and c7 in sem2.semCourses
//             }

//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesSCB
//         } is sat

//         allAdditionalCoursesValidAB : {
//             some  disj sem1, sem2 : SemesterSchedule | {
//                 some disj c1, c2, c3, c4, c5, c6, c7 : additionalCourses.setCourses | c1 in sem2.semCourses and c2 in sem1.semCourses and c3 in sem2.semCourses and c4 in sem2.semCourses and c5 in sem2.semCourses and c6 in sem2.semCourses and c7 in sem2.semCourses
//             }

//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//             additionalCoursesAB
//         } is sat

//     }
// }

// pred thousandLevelCoursesSCB {
//     atLeastSomeThousandLevel[5]
// }

// pred thousandLevelCoursesAB {
//     atLeastSomeThousandLevel[2]
// }

// test suite for atLeastSomeThousandLevel {
//         // must take at least the indicated number of 1000 level courses
//         test expect {
//             noThousandLevelNotValidSCB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) - foundationCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesSCB
//             } is unsat
    
//             noThousandLevelNotValidAB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) - foundationCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesAB
//             } is unsat
    
//             // some course is in both 1000 level and foundation courses is not valid
//             thousandLevelAndFoundationNotValidSCB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) & foundationCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesSCB
//             } is sat
    
//             thousandLevelAndFoundationNotValidAB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) & foundationCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesAB
//             } is sat
    
//             // 1000 level course can't be an already utilized additional course
//             thousandLevelAndUsedAdditionalNotValidSCB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) & usedAdditionalCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesSCB
//             } is sat
    
//             thousandLevelAndUsedAdditionalNotValidAB : {
//                 {no sem: SemesterSchedule | some {(sem.semCourses & thousandLevelCourses.setCourses) & usedAdditionalCourses.setCourses}}
//                 establishPrerequisites
//                 fulfillsAllCoursePrereqs
//                 thousandLevelCoursesAB
//             } is sat
    
//             // no limit on the number of 1000 level courses you can take
//             // also making sure this predicate does not constrain the number of classes in a semester
//             allThousandLevelCoursesValidSCB : {
//                 some  disj sem1, sem2 : SemesterSchedule | {
//                     some disj c1, c2, c3, c4, c5, c6, c7 : thousandLevelCourses.setCourses | c1 in sem2.semCourses and c2 in sem1.semCourses and c3 in sem2.semCourses and c4 in sem2.semCourses and c5 in sem2.semCourses and c6 in sem2.semCourses and c7 in sem2.semCourses
//                 }
//             } is sat
//         }
// }

// pred noEquivalentCoursesAllowed {
//     no semSched1, semSched2: SemesterSchedule | 
//         {some course: semSched1.semCourses | 
//             {some course.equivalentCourses & semSched2.semCourses}}
// }

// test suite for noEquivalentTaken {
//     assert noEquivalentCoursesAllowed is necessary for noEquivalentTaken

//     test expect {
//         // can't have equivalent courses in the same semester
//         equivalentCoursesNotValid : {
//             {some sem: SemesterSchedule | cs0330 in sem.semCourses and cs0300 in sem.semCourses}
//             noEquivalentTaken
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//         } is unsat

//         // can't have equivalent courses in different semesters
//         equivalentCoursesNotValidDiffSem : {
//             {some disj sem1, sem2: SemesterSchedule | cs0330 in sem1.semCourses and cs0300 in sem2.semCourses}
//             noEquivalentTaken
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//         } is unsat

//         // can take any class other than equivalent courses
//         allCoursesValid : {
//             some sem: SemesterSchedule | {
//                 some disj c1, c2 : Course | c1 in sem.semCourses and c2 in sem.semCourses and  #{c1.equivalentCourses & c2} = 0
//             }
//             noEquivalentTaken
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//         } is sat

//         // can take any class other equivalent in different semesters
//         allCoursesValidDiffSem : {
//             some disj sem1, sem2: SemesterSchedule | {
//                 some disj c1, c2 : Course | c1 in sem1.semCourses and c2 in sem2.semCourses and  #{c1.equivalentCourses & c2} = 0
//             }
//             noEquivalentTaken
//             establishPrerequisites
//             fulfillsAllCoursePrereqs
//         } is sat
//     }

// }

// test suite for finishBySem {
//     test expect {
//         finishBySemValid : {
//             some disj c1, c2: Course, s1, s2, s3: SemesterSchedule | 
//                 s1.semNumber = 0 and c1 in s1.semCourses and
//                 s2.semNumber = 1 and c2 in s2.semCourses and
//                 s3.semNumber = 2 and no s3.semCourses and
//                 finishBySem[2]
//         } is sat
//     } 
// }

// test suite for validSCBPlan {
//     // math100 needs to be taken
//     assert hasMath100 is necessary for validSCBPlan
    
//     // make sure concentration plan is wellformed
//     assert eightSemesters is necessary for validSCBPlan
//     assert disjointSemesters is necessary for validSCBPlan
//     assert maxFiveCourses is necessary for validSCBPlan
//     assert cantTakeSameCourseTwice is necessary for validSCBPlan
//     assert coursesInProperSeason is necessary for validSCBPlan

//     // math foundations must be satisfied
//     assert satisfiesMathFoundations is necessary for validSCBPlan

//     // intermediate requirements must be satisfied
//     assert fulfillsIntermediateRequirementsSCB is necessary for validSCBPlan

//     // additional courses must be taken
//     assert additionalCoursesSCB is necessary for validSCBPlan

//     // 1000 level courses must be taken
//     assert thousandLevelCoursesSCB is necessary for validSCBPlan

//     // no equivalent courses can be taken
//     assert noEquivalentCoursesAllowed is necessary for validSCBPlan

//     // capstone must be taken
//     assert satisfiesCapstone is necessary for validSCBPlan 

//     // make sure the model doesn't allow anyone to take no CS classes overall
//     assert notNoClasses is necessary for validSCBPlan

//     // its possible to have no CS classes towards concentration in a semester
//     assert noClassesInASem is sufficient for validSCBPlan for 8 SemesterSchedule

//     test expect {
//         // can finish all requirements in 4 semesters
//         fourSemestersValid : {
//             {some disj s1, s2, s3, s4: SemesterSchedule | 
//                 satisfiesMathFoundations and
//                 fulfillsIntermediateRequirementsSCB and
//                 additionalCoursesSCB and
//                 thousandLevelCoursesSCB and
//                 satisfiesCapstone
//             }
//             validSCBPlan
//         } is sat

//         // can't finish all requirements in 1 semester
//         oneSemesterNotValid : {
//             {one sem: SemesterSchedule | 
//                 satisfiesMathFoundations and
//                 fulfillsIntermediateRequirementsSCB and
//                 additionalCoursesSCB and
//                 thousandLevelCoursesSCB and
//                 satisfiesCapstone
//             }
//             validSCBPlan
//         } is unsat

//         // cant have overlap between 1000 level and additional courses
//         noOverlapThousandAndAdditionalNotValid : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in usedAdditionalCourses.setCourses implies c1 not in usedThousandLevelCourses.setCourses
//                 some c2: Course | c2 in usedThousandLevelCourses.setCourses implies c2 not in usedAdditionalCourses.setCourses
//             }
//             validSCBPlan
//         } is sat

//         // cant have overlap between 1000 level and foundation courses
//         noOverlapThousandAndFoundationNotValid : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in foundationCourses.setCourses implies c1 not in usedThousandLevelCourses.setCourses
//                 some c2: Course | c2 in usedThousandLevelCourses.setCourses implies c2 not in foundationCourses.setCourses
//             }
//             validSCBPlan
//         } is sat

//         // cant have overlap between additional and foundation courses
//         noOverlapAdditionalAndFoundationNotValid : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in foundationCourses.setCourses implies c1 not in usedAdditionalCourses.setCourses
//                 some c2: Course | c2 in usedAdditionalCourses.setCourses implies c2 not in foundationCourses.setCourses
//             }
//             validSCBPlan
//         } is sat

//     }
// }

// test suite for validABPlan {
    
//     // make sure concentration plan is wellformed
//     assert eightSemesters is necessary for validABPlan
//     assert disjointSemesters is necessary for validABPlan
//     assert maxFiveCourses is necessary for validABPlan
//     assert cantTakeSameCourseTwice is necessary for validABPlan
//     assert coursesInProperSeason is necessary for validABPlan

//     // math foundations must be satisfied
//     assert satisfiesMathFoundations is necessary for validABPlan

//     // intermediate requirements must be satisfied
//     assert fulfillsIntermediateRequirementsAB is necessary for validABPlan

//     // additional courses must be taken
//     assert additionalCoursesAB is necessary for validABPlan

//     // 1000 level courses must be taken
//     assert thousandLevelCoursesAB is necessary for validABPlan

//     // no equivalent courses can be taken
//     assert noEquivalentCoursesAllowed is necessary for validABPlan

//     // capstone must be taken
//     assert satisfiesCapstone is necessary for validABPlan 

//     // make sure the model doesn't allow anyone to take no CS classes overall
//     assert notNoClasses is necessary for validABPlan

//     // its possible to have no CS classes towards concentration in a semester
//     assert noClassesInASemAB is sufficient for validABPlan for 8 SemesterSchedule

//     test expect {
//         // can finish all requirements in 3 semesters
//         threeSemestersValid : {
//             {some disj s1, s2, s3: SemesterSchedule | 
//                 satisfiesMathFoundations and
//                 fulfillsIntermediateRequirementsAB and
//                 additionalCoursesAB and
//                 thousandLevelCoursesAB and
//                 satisfiesCapstone
//             }
//             validABPlan
//         } is sat

//         // can't finish all requirements in 1 semester
//         oneSemesterNotValidAB : {
//             {one sem: SemesterSchedule | 
//                 satisfiesMathFoundations and
//                 fulfillsIntermediateRequirementsAB and
//                 additionalCoursesAB and
//                 thousandLevelCoursesAB and
//                 satisfiesCapstone
//             }
//             validABPlan
//         } is unsat

//         // cant have overlap between 1000 level and additional courses
//         noOverlapThousandAndAdditionalNotValidAB : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in usedAdditionalCourses.setCourses implies c1 not in usedThousandLevelCourses.setCourses
//                 some c2: Course | c2 in usedThousandLevelCourses.setCourses implies c2 not in usedAdditionalCourses.setCourses
//             }
//             validABPlan
//         } is sat

//         // cant have overlap between 1000 level and foundation courses
//         noOverlapThousandAndFoundationNotValidAB : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in foundationCourses.setCourses implies c1 not in usedThousandLevelCourses.setCourses
//                 some c2: Course | c2 in usedThousandLevelCourses.setCourses implies c2 not in foundationCourses.setCourses
//             }
//             validABPlan
//         } is sat

//         // cant have overlap between additional and foundation courses
//         noOverlapAdditionalAndFoundationNotValidAB : {
//             some sem: SemesterSchedule | {
//                 some c1: Course | c1 in foundationCourses.setCourses implies c1 not in usedAdditionalCourses.setCourses
//                 some c2: Course | c2 in usedAdditionalCourses.setCourses implies c2 not in foundationCourses.setCourses
//             }
//             validABPlan
//         } is sat
//     }

// }

// -----------PREDICATES for TESTING----------------

// pred satisfiesCapstone {
//     some semSched: SemesterSchedule | {
//         semSched.semNumber = 6 or semSched.semNumber = 7
//         and some {semSched.semCourses & capstoneCourses.setCourses}
//     }
// }

// pred satisfiesMathFoundations {
//     some semSched: SemesterSchedule | {
//         cs0220 in semSched.semCourses or
//         math1450 in semSched.semCourses or
//         apma1650 in semSched.semCourses or
//         apma1655 in semSched.semCourses or
//         math1530 in semSched.semCourses
//     }

// }

// pred hasMath100 {
//     some sem: SemesterSchedule | math0100 in sem.semCourses
// }

// pred eightSemesters {
//     all sem: SemesterSchedule | sem.semNumber >= 0 and sem.semNumber <= 7 
// }

// pred disjointSemesters {
//     no disj sem1, sem2: SemesterSchedule | sem1.semNumber = sem2.semNumber
// }

// pred maxFiveCourses {
//     all sem: SemesterSchedule | #{sem.semCourses} <= 5 and #{sem.semCourses} >= 0
// }

// pred cantTakeSameCourseTwice {
//     no disj sem1, sem2: SemesterSchedule | sem1.semCourses & sem2.semCourses != none
// }

// pred coursesInProperSeason {
//     all sem: SemesterSchedule | {
//         remainder[sem.semNumber, 2] = 0 => {all course: sem.semCourses | course in fallCourses.setCourses}
//         remainder[sem.semNumber, 2] = 1 => {all course: sem.semCourses | course in springCourses.setCourses}
//     }
// }

// // no classes in any semester is wellformed
// pred noClasses {
//     eightSemesters and disjointSemesters and
//     {all sem: SemesterSchedule | sem.semCourses = none}
// }

// pred notNoClasses {
//     some sem: SemesterSchedule | sem.semCourses != none
// }

// pred noClassesInASem {
//     some sem: SemesterSchedule | #{sem.semCourses} = 0
//     validSCBPlan
// }

// pred noClassesInASemAB {
//     some sem: SemesterSchedule | #{sem.semCourses} = 0
//     validABPlan
// }
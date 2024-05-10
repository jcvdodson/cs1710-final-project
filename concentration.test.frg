#lang forge

open "concentration.frg"

// example of valid and invalid schedule


// 11,12 200, where you don't need to take 12


// math 100 needs to be in the schedule


// min 3 foundations courses with one in each area
// --- can take multiple from each area (check for over/under constrain)
// 3 Foundations courses, 1 in each area:
// Algorithms/Theory course
// ---one of 0500, 1010, 1550, or 1570
// AI/ML/DS course
// ---one of 410 (new in Fall 2024), 1410, 1420, 1430, 1460, 1470, or 1951A
// Systems course
// ---one of CSCI300 or 330 (320 moves to addl courses)


// min 5 1000 level courses
// --- can take more than 5
// --- Cannot overlap any 1000-level courses used to satisfy Foundations requirements.
// --- ex: 1410, 1420, 1430, 1460, 1470, or 1951A AND 1010, 1550, or 1570
// check if any of those courses above are in the schedule, there are 5 other 1000 level courses


// min 4 additional courses
// ex: 320 1000- or 2000-level CSCI courses, math0520, math0530
// Cannot overlap any 1000-level courses used to satisfy Foundations requirements.


// some capstone course


pred eightSemesters {
    all sem: SemesterSchedule | sem.semNumber >= 0 and sem.semNumber <= 7 
}

pred disjointSemesters {
    no disj sem1, sem2: SemesterSchedule | sem1.semNumber = sem2.semNumber
}

pred maxFiveCourses {
    all sem: SemesterSchedule | #{sem.semCourses} <= 5 and #{sem.semCourses} >= 0
}

pred cantTakeSameCourseTwice {
    no disj sem1, sem2: SemesterSchedule | sem1.semCourses & sem2.semCourses != none
}

pred coursesInProperSeason {
    all sem: SemesterSchedule | {
        remainder[sem.semNumber, 2] = 0 => {all course: sem.semCourses | course in fallCourses.setCourses}
        remainder[sem.semNumber, 2] = 1 => {all course: sem.semCourses | course in springCourses.setCourses}
    }
}

// no classes in any semester is wellformed
pred noClasses {
    eightSemesters and disjointSemesters and
    {all sem: SemesterSchedule | sem.semCourses = none}
}

test suite for wellformedSchedule {
    // eight semester constraint
    assert eightSemesters is necessary for wellformedSchedule

    // semesters are assigned different numbers
    assert disjointSemesters is necessary for wellformedSchedule

    // can take max 5 courses per semester
    assert maxFiveCourses is necessary for wellformedSchedule

    // cannot take the same course twice
    assert cantTakeSameCourseTwice is necessary for wellformedSchedule

    // courses must be in the proper season when they are offered
    assert coursesInProperSeason is necessary for wellformedSchedule

    // it is possible to have no classes in all semester
    assert noClasses is sufficient for wellformedSchedule

    test expect {
        // cant have more than 5 courses in a semester
        sixClassesNotValid : {
            some sem : SemesterSchedule | #{sem.semCourses} = 6 and wellformedSchedule
        } is unsat
    } 

}

test suite for fulfillsIntroSequence {
    test expect {
        // going from 11 to 200 is valid
        validIntroSequence11to200 : {
            {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
            eightSemesters
            disjointSemesters
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is sat

        // going from 11 to 12 is invalid
        invalidIntroSequence11to12 : {
            {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0112 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
            {no sem3: SemesterSchedule | cs0200 in sem3.semCourses}            
            eightSemesters
            disjointSemesters
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is unsat

        // going from 11 to 15 to 200 is valid
        validIntroSequence11to15to200 : {
            {some disj sem1, sem2, sem3: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and cs0200 in sem3.semCourses and sem1.semNumber < sem2.semNumber and sem2.semNumber < sem3.semNumber}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is sat

        // going from 11 to 15 to 12 is invalid
        invalidIntroSequence11to15to12 : {
            {some disj sem1, sem2: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
            {no sem3: SemesterSchedule | cs0200 in sem3.semCourses}            
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is unsat

        // going from 11 to 15 to 15 to 200 is invalid, not wellformed schedule
        invalidIntroSequence11to15to15to200 : {
            {some disj sem1, sem2, sem3, sem4: SemesterSchedule | cs0111 in sem1.semCourses and cs0150 in sem2.semCourses and cs0150 in sem3.semCourses and cs0200 in sem4.semCourses and sem1.semNumber < sem2.semNumber and sem2.semNumber < sem3.semNumber and sem3.semNumber < sem4.semNumber}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
            wellformedSchedule
        } is unsat

        // going from 15 to 200 is valid
        validIntroSequence15to200 : {
            {some disj sem1, sem2: SemesterSchedule | cs0150 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is sat

        // going from 17 to 200 is valid
        validIntroSequence17to200 : {
            {some disj sem1, sem2: SemesterSchedule | cs0170 in sem1.semCourses and cs0200 in sem2.semCourses and sem1.semNumber < sem2.semNumber}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsIntroSequence
        } is sat
    }
}

test suite for fulfillsCalcRequirement {
    test expect {
        // math 100 is necessary for fulfillsCalcRequirement
        noCalcNotValidSCB : {
            {no sem: SemesterSchedule | math0100 in sem.semCourses}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsCalcRequirement[0, 0]
        } is unsat

        // don't need to take any calc course if AB
        noCalcABValid : {
            {no sem: SemesterSchedule | some {sem.semCourses & calcCourses.setCourses}}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsCalcRequirement[1, 0]
        } is sat
        
        // don't need to take any calc course if have HS credit
        noCalcHSCreditValid : {
            {no sem: SemesterSchedule | some {sem.semCourses & calcCourses.setCourses}}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            fulfillsCalcRequirement[0, 1]
        } is sat
    }
}

pred hasOnlyCS0300 {
    some sem: SemesterSchedule | cs0300 in sem.semCourses
    cs0300 in foundationCourses.setCourses
    no sem: SemesterSchedule | {cs0330 in sem.semCourses or cs0320 in sem.semCourses}
}

pred hasOnlyCS0330 {
    some sem: SemesterSchedule | cs0330 in sem.semCourses
    cs0330 in foundationCourses.setCourses
    no sem: SemesterSchedule | {cs0300 in sem.semCourses or cs0320 in sem.semCourses}
}

pred hasOnlyCS0320 {
    some sem: SemesterSchedule | cs0320 in sem.semCourses
    cs0320 in foundationCourses.setCourses
    no sem: SemesterSchedule | {cs0300 in sem.semCourses or cs0330 in sem.semCourses}
}

pred hasCS300OrCS330 {
    some sem: SemesterSchedule | {
        { cs0300 in sem.semCourses and cs0300 in foundationCourses.setCourses } or
        { cs0330 in sem.semCourses and cs0330 in foundationCourses.setCourses }
    }
}

pred hasCS300OrCS0320OrCS330 {
    some sem: SemesterSchedule | {
        { cs0300 in sem.semCourses and cs0300 in foundationCourses.setCourses } or
        { cs0320 in sem.semCourses and cs0320 in foundationCourses.setCourses } or
        { cs0330 in sem.semCourses and cs0330 in foundationCourses.setCourses }
    }
}

pred hasSCBSysCourse {
    hasSystemsCourse[0]
}

pred hasABSysCourse {
    hasSystemsCourse[1]
}

test suite for hasSystemsCourse {
    assert hasOnlyCS0300 is sufficient for hasSCBSysCourse
    assert hasOnlyCS0330 is sufficient for hasSCBSysCourse

    assert hasOnlyCS0300 is sufficient for hasABSysCourse
    assert hasOnlyCS0330 is sufficient for hasABSysCourse
    assert hasOnlyCS0320 is sufficient for hasABSysCourse

    assert hasCS300OrCS330 is necessary for hasSCBSysCourse
    assert hasCS300OrCS0320OrCS330 is necessary for hasABSysCourse

    test expect {
        noCS300Or330NotValidSCB : {
            {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0330 in sem.semCourses}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            hasSCBSysCourse
        } is unsat

        noCS300Or320Or330NotValidAB : {
            {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            hasABSysCourse
        } is unsat

        noCS300Or320Or330NotValidSCB : {
            {no sem: SemesterSchedule | cs0300 in sem.semCourses or cs0320 in sem.semCourses or cs0330 in sem.semCourses}
            establishPrerequisites
            fulfillsAllCoursePrereqs
            hasSCBSysCourse
        } is unsat
    }
}

test suite for fulfillsIntermediateRequirements {
    
}

test suite for someAdditionalCourses {

}

test suite for atLeastSomeThousandLevel {

}

test suite for noEquivalentTaken {

}

test suite for finishBySem {

}



test suite for validSCBPlan {
    assert hasMath100 is necessary for validSCBPlan

}

test suite for validABPlan {

}

pred hasMath100 {
    some sem: SemesterSchedule | math0100 in sem.semCourses
}




#lang forge/temporal

abstract sig Prerequisite {
    courses: set Course
}

abstract sig Course {
    prerequisites: set Prerequisite
}

one sig cs0150 extends Course {}
one sig cs0170 extends Course {}
one sig cs0190 extends Course {}
one sig cs0300 extends Course {}
one sig cs0320 extends Course {}
one sig cs0330 extends Course {}
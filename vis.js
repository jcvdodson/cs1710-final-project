var fullSchedule = document.createElement('div');
fullSchedule.setAttribute('id', 'fullSchedule');
fullSchedule.style.display = 'flex';
fullSchedule.style.flexDirection = 'column';
fullSchedule.style.justifyContent = 'center';
fullSchedule.style.alignItems = 'center';
div.appendChild(fullSchedule);

// there will be 8 semesetr schedules
// arrnage them in a 4 row, 2 column grid
// each semester schedule will be a div
// each semester schedule will have a header with the semester number + 1
// each semester schedule will have a table with the courses
// each course will be a row in the table
// each course will have a cell for the course number

function createSemesterSchedule(semester, flexRow) {
    var semesterSchedule = document.createElement('div');
    semesterSchedule.style.border = '1px solid black';
    semesterSchedule.style.width = '200px';
    semesterSchedule.style.height = '170px';
    semesterSchedule.style.margin = '5px';
    semesterSchedule.style.padding = '10px';
    semesterSchedule.style.borderRadius = '10px';
    semesterSchedule.style.backgroundColor = 'lightblue';
    semesterSchedule.style.display = 'flex';
    semesterSchedule.style.flexDirection = 'column';
    semesterSchedule.style.justifyContent = 'center';
    semesterSchedule.style.alignItems = 'center';
    semesterSchedule.style.position = 'relative';

    var header = document.createElement('h3');
    header.textContent = "Semester " + (semester + 1);
    semesterSchedule.appendChild(header);

    var table = document.createElement('table');
    table.style.border = '1px solid black';
    table.style.width = '100%';
    table.style.height = '100%';
    table.style.borderCollapse = 'collapse';
    table.style.margin = '0px';
    table.style.padding = '5px';
    table.style.borderRadius = '10px';
    table.style.backgroundColor = 'white';
    table.style.position = 'relative';

    courses = getSemesterCourses(semester);

    // if there are no courses, add a row with a message
    if (courses.length == 0) {
        var row = document.createElement('tr');
        var cell = document.createElement('td');
        cell.style.border = '1px solid black';
        cell.style.width = '100px';
        cell.style.height = '25px';
        cell.style.textAlign = 'center';
        cell.style.verticalAlign = 'middle';
        cell.style.fontSize = '10px';
        cell.style.color = 'black';
        cell.style.backgroundColor = 'lightblue';
        cell.textContent = "No courses";
        row.appendChild(cell);
        table.appendChild(row);
    } else {
        for (var i = 0; i < 5; i++) {
            var row = document.createElement('tr');
            for (var j = 0; j < 1; j++) {
                var cell = document.createElement('td');
                cell.style.border = '1px solid black';
                cell.style.width = '100px';
                cell.style.height = '25px';
                cell.style.textAlign = 'center';
                cell.style.verticalAlign = 'middle';
                cell.style.fontSize = '10px';
                cell.style.color = 'black';
                cell.style.backgroundColor = 'lightblue';
                if (i < courses.length) {
                    cell.textContent = courses[i];
                }
                row.appendChild(cell);
            }
            table.appendChild(row);
        }
    }
    semesterSchedule.appendChild(table);
    flexRow.appendChild(semesterSchedule);
}

function getSemesterCourses(semesterNumber) {
    var courses = [];
    if (SemesterSchedule0.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule0.semCourses._tuples.length; i++) {
            var course = SemesterSchedule0.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule1.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule1.semCourses._tuples.length; i++) {
            var course = SemesterSchedule1.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule2.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule2.semCourses._tuples.length; i++) {
            var course = SemesterSchedule2.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule3.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule3.semCourses._tuples.length; i++) {
            var course = SemesterSchedule3.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule4.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule4.semCourses._tuples.length; i++) {
            var course = SemesterSchedule4.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule5.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule5.semCourses._tuples.length; i++) {
            var course = SemesterSchedule5.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    } else if (SemesterSchedule6.semNumber._id == semesterNumber) {
        for (var i = 0; i < SemesterSchedule6.semCourses._tuples.length; i++) {
            var course = SemesterSchedule6.semCourses._tuples[i];
            courses.push(course._atoms[0]._id.slice(0, -1));
        }
    }
    return courses;
}

// function createBoardData(board) {
//     var boardData = [];
//     for (r = 0; r <= 6; r++) {
//         var row = [];
//         for (c = 0; c <= 7; c++) {
//             row.push("-1");
//         }
//         boardData.push(row);
//     }

//     const pieces = board.join(places).tuples();
//     for (idx = 0; idx < pieces.length; idx++) {
//         const atms = pieces[idx]._atoms;
//         const pieceRow = atms[0].toString();
//         const pieceCol = atms[1].toString();
//         const piece = atms[2].toString();
//         if (piece.includes("Red")) {
//             boardData[pieceRow][pieceCol] = "0";
//         }
//         else if (piece.includes("Yellow")) {
//             boardData[pieceRow][pieceCol] = "1";
//         }
//     }
//     return boardData;
// }
  
function createFullSchedule() {
    // create 4 rows, each with 2 semester schedules
    for (var i = 0; i < 4; i++) {
        var row = document.createElement('div');
        row.style.display = 'flex';
        row.style.flexDirection = 'row';
        row.style.justifyContent = 'center';
        row.style.alignItems = 'center';
        fullSchedule.appendChild(row);

        for (var j = 0; j < 2; j++) {
            createSemesterSchedule(i * 2 + j, row);
        }
    }
}

createFullSchedule();
getSemesterCourses(0);
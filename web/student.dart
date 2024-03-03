import 'dart:html';

class Person {
  String name;

  Person(this.name);
}

class Student extends Person {
  int grade;
  String guardian;
  static List<Student> studentsList = [];

  Student(super.name, this.grade, this.guardian) {
    studentsList.add(this);
  }

  static void displayInfo() {
    var output = querySelector('#studentinfo') as SpanElement;
    output.appendText('$studentsList');
    output.appendHtml("<br>");
    output.appendHtml("<hr>");
  }

  @override
  String toString() {
    return " Student name: $name , Grade: $grade , Guardian name: $guardian";
  }

  static void enrollStudent(String name, int grade, String guardian) {
    Student newStudent = Student(name, grade, guardian);
    var output = querySelector('#enrollstudent') as SpanElement;
    output.appendText("...Student Enrolled...");
    output.appendHtml("<br>");
    output.appendText("Student name: ${newStudent.name}");
    output.appendHtml("<br>");
    output.appendText("Student grade: ${newStudent.grade}");
    output.appendHtml("<br>");
    output.appendText("Guardian name: ${newStudent.guardian}");
    output.appendHtml("<hr>");
  }

  static void removeStudent(String name) {
    bool removed = false;
    for (int i = 0; i < studentsList.length; i++) {
      if (studentsList[i].name == name) {
        studentsList.removeAt(i);
        removed = true;
        break;
      }
    }
    var output = querySelector('#removestudent') as SpanElement;
    if (removed) {
      output.appendText("Student removed: $name");
      output.appendHtml("<br>");
    } else {
      output.appendText("Please enter the correct name");
      output.appendHtml("<br>");
    }
  }

  static void activeStudent(String name) {
    var student = studentsList.firstWhere((student) => student.name == name,
        orElse: () => Student("", 0, ""));
    if (student.name.isNotEmpty) {
      var output = querySelector('#activestudent1') as SpanElement;
      output.appendText('Name: ${student.name}');
      output.appendHtml('<br>');
      output.appendText('Grade: ${student.grade}');
      output.appendHtml('<br>');
      output.appendText('Guardian name: ${student.guardian}');
    } else {
      var output = querySelector('#activestudent2') as SpanElement;
      output.appendText('$name is not present');
      output.appendHtml('<br>');
    }
  }
}

void main() {
  List<Person> people = [
    Student("Samama Ali", 10, "Azhar Ali"),
    Student("Sufian Salman", 9, "Babar Azam"),
    Student('Harry Potter', 12, "James Potter"),
    Student('Hermione Granger', 12, 'Muggles')
  ];

  people;

  var buttonstudentinfo = querySelector('#buttonstudentinfo') as ButtonElement;
  buttonstudentinfo.onClick.listen((event) {
    Student.displayInfo();
  });

  var buttonenrollstudent =
      querySelector('#buttonenrollstudent') as ButtonElement;
  buttonenrollstudent.onClick.listen((event) {
    var name = (querySelector('#enrollname') as InputElement).value;
    var grade = (querySelector('#grade') as InputElement).value;
    var guardian = (querySelector('#guardian') as InputElement).value;
    Student.enrollStudent(
        name.toString(), int.parse(grade.toString()), guardian.toString());
  });

  var buttonremovestudent =
      querySelector('#buttonremovestudent') as ButtonElement;
  buttonremovestudent.onClick.listen((event) {
    var name = (querySelector('#removename') as InputElement).value;
    Student.removeStudent(name.toString());
  });

  var buttonactivestudent =
      querySelector('#buttonactivestudent') as ButtonElement;
  buttonactivestudent.onClick.listen((event) {
    var name = (querySelector('#activename') as InputElement).value;
    Student.activeStudent(name.toString());
  });
}

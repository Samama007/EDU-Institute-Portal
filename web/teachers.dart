import 'dart:html';

class Person {
  String name;

  Person(this.name);
}

class Teacher extends Person {
  String subject;
  int salary;
  static List<Teacher> teachersList = [];

  Teacher(super.name, this.subject, this.salary) {
    teachersList.add(this);
  }

  static void displayInfo() {
    var output = querySelector('#teachersinfo') as SpanElement;
    output.appendText('$teachersList');
    output.appendHtml("<br>");
    output.appendHtml("<hr>");
  }

  @override
  String toString() {
    return "Teacher: $name, Subject: $subject, Salary: $salary";
  }

  static void hireTeacher(String name, String subject, int salary) {
    Teacher newTeacher = Teacher(name, subject, salary);
    var output = querySelector('#hireteacher') as SpanElement;
    output.appendText("...Teacher hired...");
    output.appendHtml("<br>");
    output.appendText("Name: ${newTeacher.name}");
    output.appendHtml("<br>");
    output.appendText("Subject: ${newTeacher.subject}");
    output.appendHtml("<br>");
    output.appendText("Salary: ${newTeacher.salary}");
    output.appendHtml("<hr>");
  }

  static void removeTeacher(String name) {
    bool removed = false;
    for (int i = 0; i < teachersList.length; i++) {
      if (teachersList[i].name == name) {
        teachersList.removeAt(i);
        removed = true;
        break;
      }
    }
    var output = querySelector('#removeteacher') as SpanElement;
    if (removed) {
      output.appendText("Teacher removed: $name");
      output.appendHtml("<br>");
    } else {
      output.appendText("Please enter the correct name");
      output.appendHtml("<br>");
    }
  }

  static void activeTeacher(String name) {
    var teacher = teachersList.firstWhere((teacher) => teacher.name == name,
        orElse: () => Teacher("", "", 0));
    if (teacher.name.isNotEmpty) {
      var output = querySelector('#activeteacher1') as SpanElement;
      output.appendText('Name: ${teacher.name}\n');
      output.appendText('Subject: ${teacher.subject}\n');
      output.appendText('Salary: ${teacher.salary}\n');
    } else {
      var output = querySelector('#activeteacher2') as SpanElement;
      output.appendText('$name is not present');
      output.appendHtml("<br>");
    }
  }
}

void main() {
  List<Person> people = [
    Teacher("Saleem Khan", "Dart", 500000),
    Teacher("Fiza Ali", "Math", 25000),
    Teacher("Saeed Anwar", "Philosphy", 90000),
    Teacher('Albus Dumbledore', 'Defence against the Dark Arts', 420000),
  ];

  people;

  var buttonteacherinfo = querySelector('#buttonteacherinfo') as ButtonElement;
  buttonteacherinfo.onClick.listen((event) {
    Teacher.displayInfo();
  });

  var buttonhireteacher = querySelector('#buttonhireteacher') as ButtonElement;
  buttonhireteacher.onClick.listen((event) {
    var name = (querySelector('#hirename') as InputElement).value;
    var subject = (querySelector('#subject') as InputElement).value;
    var salary = (querySelector('#salary') as InputElement).value;
    Teacher.hireTeacher(
        name.toString(), subject.toString(), int.parse(salary.toString()));
  });

  var buttonremoveteacher =
      querySelector('#buttonremoveteacher') as ButtonElement;
  buttonremoveteacher.onClick.listen((event) {
    var name = (querySelector('#firename') as InputElement).value;
    Teacher.removeTeacher(name.toString());
  });

  var buttonactiveteacher =
      querySelector('#buttonactiveteacher') as ButtonElement;
  buttonactiveteacher.onClick.listen((event) {
    var name = (querySelector('#activename') as InputElement).value;
    Teacher.activeTeacher(name.toString());
  });
}

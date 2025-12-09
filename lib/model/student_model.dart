class Student {
  final String id;
  final String fName;
  final String lName;
  final int year;
  final String faculty;
  final String section;
  final String pNum;
  final String photo;
  final String email;
  final String pass;
  final String app;
  final String entry;
  final String note;

  Student({
    required this.id,
    required this.fName,
    required this.lName,
    required this.year,
    required this.faculty,
    required this.section,
    required this.pNum,
    required this.photo,
    required this.email,
    required this.pass,
    required this.app,
    required this.entry,
    required this.note,
  });

  // From JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'] ?? '',
      fName: json['fName'] ?? '',
      lName: json['lName'] ?? '',
      year: json['year'] ?? 0,
      faculty: json['faculty'] ?? '',
      section: json['section'] ?? '',
      pNum: json['pNum'] ?? '',
      photo: json['photo'] ?? '',
      email: json['email'] ?? '',
      pass: json['pass'] ?? '',
      app: json['app'] ?? '',
      entry: json['entry'] ?? '',
      note: json['note'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'fName': fName,
      'lName': lName,
      'year': year,
      'faculty': faculty,
      'section': section,
      'pNum': pNum,
      'photo': photo,
      'email': email,
      'pass': pass,
      'app': app,
      'entry': entry,
      'note': note,
    };
  }
}
import 'dart:io';
import 'dart:math';

int calculate() {
  return 6 * 7;
}

Future createFile() async {
  File f = File('hello.txt');
  String text = '';
  for (int i = 0; i < 10; i++) {
    text += ('Nguyễn Đình Quyết\n');
  }
  f.writeAsStringSync(text);
}

Future createFile2() async {
  File f = File('Quyet.txt');
  String text = '';
  text += ('Hùng');
  text += ('Hải');
  text += ('Đông');
  text += ('Cường');
  f.writeAsStringSync(text);
}

void readFolder() {
  File f = File('test.txt');
  print('File path: ${f.absolute.path}');
}

void readFolderAndCoppy() {
  File f = File('hello.txt');
  File fCoppy = File('hello_copy.txt');
  String contents = f.readAsStringSync();
  fCoppy.writeAsStringSync(contents);
}

void spamCreateFile() async {
  String text = 'hello';
  for (int i = 0; i < 100; i++) {
    File('spam/hello$i.txt').create(recursive: true).then((File f) {
      f.writeAsStringSync('hello $text + $i');
    });
  }
}

void checkAndDeleteFile() async {
  File f = File('hello_copy.txt');
  if (f.existsSync()) {
    f.deleteSync();
  }
}
void studentManagent() async {
  File f = File('student-managent.csv');
  for(int i = 0;i<100;i++){
    var r = Random();
    f.writeAsStringSync('${generateRandomString(10)},${r.nextInt(21)}\n',mode: FileMode.append);
  }
  List<String> dataTable = [];
  if (f.existsSync()) {
    dataTable  = f.readAsStringSync().split('\n');
  }
  dataTable.forEach((element) {
    print('$element \n');
  });
}
String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
}


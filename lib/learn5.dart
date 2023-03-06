import 'dart:io';

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

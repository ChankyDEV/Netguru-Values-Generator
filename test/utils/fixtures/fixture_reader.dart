import 'dart:io';

String fixture(String name) =>
    File('test/utils/fixtures/$name').readAsStringSync();
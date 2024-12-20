import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

var _uuid = Uuid();

/// Copies the file to the Application Documents Directory
///
/// This means that any temporary files are persisted
Future<File> copyToPermanentDirectory(
    {required File originalFile,
    required String prefix,
    required bool keepFilename}) async {
  String fileExt = extension(originalFile.path);
  String fileName = '';
  if (keepFilename == true) {
    fileName = originalFile.uri.pathSegments.last; // Keep the file name
  } else {
    fileName = '$prefix-${_uuid.v4()}$fileExt'; // image-UNIQUEID.jpg
  }
  Directory directory = await getApplicationDocumentsDirectory();
  return await originalFile.copy('${directory.path}/$fileName');
}

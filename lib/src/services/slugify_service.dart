import 'package:slugify/slugify.dart' as lib;

class SlugifyService {
  String slugify(String text) => lib.slugify(text);
}
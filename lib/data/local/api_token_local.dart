import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

// TODO: Need add AES for more secure hive box
@injectable
class ApiTokenLocal {
  final Box<String> box;

  static const String _keyBox = 'api_token';

  @FactoryMethod(preResolve: true)
  static Future<ApiTokenLocal> openBox() async {
    final isBoxOpen = Hive.isBoxOpen(_keyBox);
    if (!isBoxOpen) {
      final box = await Hive.openBox<String>(_keyBox);

      return ApiTokenLocal(box);
    }

    return ApiTokenLocal(Hive.box<String>(_keyBox));
  }

  ApiTokenLocal(this.box);

  String? getApiToken() => box.get(_keyBox);

  void onSaveToken(String apiToken) {
    box.put(_keyBox, apiToken);
  }
}

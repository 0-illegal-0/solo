import 'package:solo/models/categories_models.dart';
import '../data.dart';

dynamic solo;

addMainData() {
  solo = Solo.fromJson(data);
}

import 'package:collection/collection.dart';

class CheckAnswerHelper {
  static Function isDeepEqual = const DeepCollectionEquality().equals;
  static Function isEqual = const ListEquality().equals;
}

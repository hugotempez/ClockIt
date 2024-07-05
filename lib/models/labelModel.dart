import 'package:realm/realm.dart';
import 'package:realm_common/realm_common.dart';

part 'labelModel.realm.dart';

@RealmModel()
class _Label {
  @PrimaryKey()
  late String label;

  late String comment;
}

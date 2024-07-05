// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labelModel.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Label extends _Label with RealmEntity, RealmObjectBase, RealmObject {
  Label(
    String label,
    String comment,
  ) {
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'comment', comment);
  }

  Label._();

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => RealmObjectBase.set(this, 'label', value);

  @override
  String get comment => RealmObjectBase.get<String>(this, 'comment') as String;
  @override
  set comment(String value) => RealmObjectBase.set(this, 'comment', value);

  @override
  Stream<RealmObjectChanges<Label>> get changes =>
      RealmObjectBase.getChanges<Label>(this);

  @override
  Stream<RealmObjectChanges<Label>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Label>(this, keyPaths);

  @override
  Label freeze() => RealmObjectBase.freezeObject<Label>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'label': label.toEJson(),
      'comment': comment.toEJson(),
    };
  }

  static EJsonValue _toEJson(Label value) => value.toEJson();
  static Label _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'label': EJsonValue label,
        'comment': EJsonValue comment,
      } =>
        Label(
          fromEJson(label),
          fromEJson(comment),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Label._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Label, 'Label', [
      SchemaProperty('label', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('comment', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

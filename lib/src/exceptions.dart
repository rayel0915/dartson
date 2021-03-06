import 'package:analyzer/dart/element/element.dart';

/// Thrown when encode or decode method is called with a dart object that
/// is not available within the entities list of the serializer.
class UnknownEntityException implements Exception {
  final Type type;

  UnknownEntityException(this.type);

  @override
  String toString() => 'UnknownEntityException: $type not found in the entity '
      'list of the serializer. Please make sure to add $type to the entities '
      'defined in the @Serializer annotation of your serializer.';
}

/// Thrown if a [TypeTransformer] was registered to [Serializer] which doesn't
/// contain an encode method.
class MissingEncodeMethodException implements Exception {
  final String type;

  MissingEncodeMethodException(this.type);

  @override
  String toString() =>
      'MissingEncodeMethodException: There\'s no "encode" method available on '
      'TypeTransformer: $type. Please make sure to implement TypeTransformer '
      'and overwrite the interface methods.';
}

/// Thrown if a [TypeTransformer] was registered to [Serializer] which doesn't
/// contain an decode method.
class MissingDecodeMethodException implements Exception {
  final String type;

  MissingDecodeMethodException(this.type);

  @override
  String toString() =>
      'MissingDecodeMethodException: There\'s no "decode" method available on '
      'TypeTransformers: $type. Please make sure to implement TypeTransformer '
      'and overwrite the interface methods.';
}

/// Thrown by the generator in case a not optional argument within an entity
/// constructor is marked as ignored and therefore the generator cannot fill in
/// a value.
class NotOptionalArgumentIgnoredException implements Exception {
  final Element field;
  final ClassElement type;

  NotOptionalArgumentIgnoredException(this.field, this.type);

  @override
  String toString() =>
      'NotOptionalArgumentIgnoredException: The field ${field.name} in '
      '${type.name} is annotated with @Property(ignore:true) but is a not '
      'optional argument of the constructor.';
}

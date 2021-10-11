import 'package:collection/collection.dart';

import '../../presentation/protocols/validation.dart';
import '../protocols/field_validation.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  @override
  String? validate({required String field, required String value}) {
    final filteredValidations = validations.where(
      (validation) => validation.field == field,
    );

    for (final validation in filteredValidations) {
      final error = validation.validate(value: value);

      if (error != null && error.isNotEmpty) {
        return error;
      }
    }

    return null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ValidationComposite &&
        listEquals(other.validations, validations);
  }

  @override
  int get hashCode => validations.hashCode;

  @override
  String toString() => 'ValidationComposite(validations: $validations)';
}

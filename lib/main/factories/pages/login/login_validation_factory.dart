import '../../../../presentation/protocols/validation.dart';
import '../../../../validation/protocols/field_validation.dart';
import '../../../../validation/validators/validation_composite.dart';
import '../../../builders/validation_builder.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations() {
  return [
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),
  ];
}

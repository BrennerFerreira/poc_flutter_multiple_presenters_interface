import '../protocols/field_validation.dart';

class RequiredFieldValidation implements FieldValidation {
  final String _field;

  const RequiredFieldValidation(this._field);

  @override
  String get field => _field;

  @override
  String? validate({String? value}) {
    return value == null || value.isEmpty ? 'Campo obrigatório' : null;
  }

  @override
  String toString() => 'RequiredFieldValidation(_field: $_field)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RequiredFieldValidation && other._field == _field;
  }

  @override
  int get hashCode => _field.hashCode;
}

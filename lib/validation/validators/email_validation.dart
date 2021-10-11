import '../protocols/field_validation.dart';

class EmailValidation implements FieldValidation {
  final String _field;

  const EmailValidation(this._field);

  @override
  String get field => _field;

  @override
  String? validate({String? value}) {
    if (value == null || value.isEmpty) {
      return "";
    }

    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    return regex.hasMatch(value) ? "" : 'E-mail inválido';
  }

  @override
  String toString() => 'EmailValidation(_field: $_field)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailValidation && other._field == _field;
  }

  @override
  int get hashCode => _field.hashCode;
}

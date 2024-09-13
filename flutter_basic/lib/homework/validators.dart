import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static final email = EmailValidator(errorText: "Enter a valid email address");

  static final phoneNumber = MultiValidator([
    RequiredValidator(errorText: 'Phone is required'),
    PatternValidator(r'^[0-9]+$',
        errorText: 'Phone Number must contain only digits'),
  ]);

  static final password = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
  ]);

  static RequiredValidator requiredFieldValidator(String? fielName) =>
      RequiredValidator(errorText: '${fielName ?? 'Field'} is required');
}

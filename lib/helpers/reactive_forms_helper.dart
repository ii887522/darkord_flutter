import 'package:reactive_forms/reactive_forms.dart';

bool showErrors(FormControl<Object?> control) {
  return control.invalid && control.touched && control.dirty;
}

Map<String, dynamic>? Function(AbstractControl<dynamic> control) trimmed(
  Validator<dynamic> validator,
) {
  return (control) {
    control.value = control.value?.trim() ?? '';
    return validator.validate(control);
  };
}

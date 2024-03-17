import 'package:reactive_forms/reactive_forms.dart';

bool showErrors(AbstractControl<dynamic> control) {
  return control.invalid && control.touched && control.dirty;
}

import 'package:reactive_forms/reactive_forms.dart';

bool showErrors(FormControl<Object?> control) {
  return control.invalid && control.touched && control.dirty;
}

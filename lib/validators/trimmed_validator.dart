import 'package:reactive_forms/reactive_forms.dart';

class TrimmedValidator extends Validator<dynamic> {
  final Validator<dynamic> inner;

  const TrimmedValidator(this.inner);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    control.value = control.value?.trim() ?? '';
    return inner.validate(control);
  }
}

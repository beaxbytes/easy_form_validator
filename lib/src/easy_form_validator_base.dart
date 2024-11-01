class FormValidator {
  final String value;
  FormValidator({required this.value});

  List<Function> validations = [];

  FormValidator email({String? errorMessage}) {
    validations.add(() => _email(errorMessage));
    return this;
  }

  FormValidator password({String? errorMessage}) {
    validations.add(() => _password(errorMessage));
    return this;
  }

  FormValidator required({String? errorMessage}) {
    validations.add(() => _required(errorMessage));
    return this;
  }

  FormValidator maxLength(int maxLength, {String? errorMessage}) {
    validations.add(() => _maxLength(maxLength, errorMessage));
    return this;
  }

  FormValidator minLength(int minLength, {String? errorMessage}) {
    validations.add(() => _minLength(minLength, errorMessage));
    return this;
  }

  FormValidator max(int max, {String? errorMessage}) {
    validations.add(() => _max(max, errorMessage));
    return this;
  }

  FormValidator min(int min, {String? errorMessage}) {
    validations.add(() => _min(min, errorMessage));
    return this;
  }

  validate() {
    for (final validation in validations) {
      final error = validation();
      if (error != null) return error;
    }
    return null;
  }

  String? _email(String? errorMessage) {
    final valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.toString());
    if (!valid) return errorMessage ?? 'Invalid email';
    return null;
  }

  String? _password(String? errorMessage) {
    if (value.toString().isEmpty) return errorMessage ?? 'Password is required';
    return null;
  }

  String? _required(String? errorMessage) {
    if (value.toString().isEmpty) return errorMessage ?? 'Field is required';
    return null;
  }

  String? _maxLength(
    int maxLength,
    String? errorMessage,
  ) {
    if (value.toString().length > maxLength) {
      return errorMessage ?? 'Max length is $maxLength';
    }
    return null;
  }

  String? _minLength(
    int minLength,
    String? errorMessage,
  ) {
    if (value.toString().length < minLength) {
      return errorMessage ?? 'Min length is $minLength';
    }
    return null;
  }

  String? _max(
    int max,
    String? errorMessage,
  ) {
    if ((double.tryParse(value.toString()) ?? 0) > max) {
      return errorMessage ?? 'Max is $max';
    }
    return null;
  }

  String? _min(
    int min,
    String? errorMessage,
  ) {
    if ((double.tryParse(value.toString()) ?? 0) < min) {
      return errorMessage ?? 'Min is $min';
    }
    return null;
  }

  String? getError() {
    for (final validation in validations) {
      final error = validation();
      if (error != null) return error;
    }
    return null;
  }

  bool isValid() {
    return getError() == null;
  }
}

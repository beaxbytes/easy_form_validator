import 'package:easy_form_validator/easy_form_validator.dart';

class AuthScreenWidget extends StatelessWidget {
  AuthScreenWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Padding(
              TextFormField(
                validator: (value) {
                  return FormValidator(value: value ?? '')
                      .required(errorMessage: 'Email is requerido')
                      .email(errorMessage: 'Email is invalid')
                      .maxLength(2)
                      .validate();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

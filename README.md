Simple Flutter Form Validation Package, No Hassle

## Features

Simple data validation in Flutter forms

## Getting started

Install the package

```dart
dependencies:
  easy_form_validator: ^CURRENT_VERSION
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';

    TextFormField(
    validator: (value) {
        return FormValidator(value: value ?? '')
            .required(errorMessage: 'Email is requerido')
            .email(errorMessage: 'Email is invalid')
            .maxLength(2)
            .validate();
    },
),
```

## Methods

- email
- password
- required
- maxLength
- minLength
- max
- min
- getErrors
- isValid

## Example

[Example](https://github.com/daniel-leon/easy-form-validator/blob/main/example/easy_form_validator_example.dart)

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

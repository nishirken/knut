import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

typedef Field = ({
  String name,
  List<String>? equalValues,
  String hintText,
});

typedef Fields = (List<Field>, List<Field>);

class InputsBlockWidget extends StatelessWidget {
  final bool validate;
  final Fields fields;
  final String title;
  final FormFieldValidator<String>? validator;

  const InputsBlockWidget({
    Key? key,
    required this.validate,
    required this.fields,
    required this.title,
    this.validator,
  }) : super(key: key);

  FormFieldValidator<String?> _validator(List<String> equalValues) {
    return (String? value) {
      if (value != null && !equalValues.contains(value)) {
        return "The value must be one of ${equalValues.join(', ')}";
      }
      return null;
    };
  }

  List<Widget> _column(List<Field> columnFields) {
    return columnFields.map((field) {
      return FormBuilderTextField(
        name: field.name,
        decoration: InputDecoration(
          hintText: field.hintText,
        ),
        validator: validator ??
            (validate
                ? FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    if (field.equalValues != null &&
                        field.equalValues!.isNotEmpty)
                      _validator(field.equalValues!)
                  ])
                : null),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34.0),
      child: Column(children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(width: 0, height: 24),
        Row(children: [
          Flexible(
            child: Column(
              children: _column(fields.$1),
            ),
          ),
          const SizedBox(width: 24.0, height: 0),
          Flexible(
            child: Column(
              children: _column(fields.$2),
            ),
          ),
        ]),
      ], crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}

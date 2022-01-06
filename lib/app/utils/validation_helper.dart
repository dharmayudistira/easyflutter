String? emptyValidationForm(String? text, String label) {
  final textValue = text ?? "";

  if(textValue.isEmpty) {
    return "Data $label harus diisi!";
  }else {
    return null;
  }
}
customFormValidator(final String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some data';
  }
  return null;
}

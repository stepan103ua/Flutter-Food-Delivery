extension ListExtension<E> on List<E> {
  List<E> operator -(List<E> elements) =>
      where((element) => !elements.contains(element)).toList();
}

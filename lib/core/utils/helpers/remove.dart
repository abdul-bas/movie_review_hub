
void remove({index, castImages, castNames}) {
  castImages.value.removeAt(index);
  castImages.notifyListeners();
  castNames.value.removeAt(index);
  castNames.notifyListeners();
}
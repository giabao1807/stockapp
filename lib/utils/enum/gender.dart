
enum Gender {
  MALE(name: 'male', id : 'M'),
  FEMALE(name: 'female', id : 'F');

  const Gender({
    required this.name,
    required this.id,
  });

  final String name;

  final String id;
}

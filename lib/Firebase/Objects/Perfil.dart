import 'package:cloud_firestore/cloud_firestore.dart';

class Perfil {
  final String? name;
  final String? city;
  final String? country;
  final List<DocumentReference>? rooms;
  final String uid;


  Perfil({
    this.name="",
    this.city="",
    this.country="",
    this.rooms = const[],
    this.uid=""
  });

  factory Perfil.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Perfil(
        name: data?['name'],
        city: data?['city'],
        country: data?['country'],
        rooms: data?['rooms'] is Iterable ? List.from(data?['rooms']) : null,
        uid: snapshot.id

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (city != null) "city": city,
      if (country != null) "country": country,
      if (rooms!.isNotEmpty) "rooms": rooms,

    };
  }
}
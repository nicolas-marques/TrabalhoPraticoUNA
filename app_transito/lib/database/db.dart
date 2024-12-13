import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return DB._instance._firestore;
  }

  static setupDemoData() async {
    FirebaseFirestore firestore = DB.get();
    final geo = Geoflutterfire();

    List<GeoFirePoint> cafe = [
      geo.point(latitude: -19.96263555, longitude: -44.16007983),
      geo.point(latitude: -19.96137324, longitude: -44.20200678),
    ];
    final dados = [
      {
        'nome': 'Cheirim Bão Betim',
        'imagem':
            'https://10619-2.s.cdn12.com/rests/original/107_509736971.jpg',
        'position': cafe[0].data,
      },
      {
        'nome': 'Jefis Cafeteria',
        'imagem':
            'https://i1.wp.com/correiodebetim.com/wp-content/uploads/2021/02/jefisdestaque.jpg?fit=1200%2C675&ssl=1',
        'position': cafe[1].data,
      },
    ];
    await firestore.collection('cafe').add(dados[0]);
    await firestore.collection('cafe').add(dados[1]);
  }
}
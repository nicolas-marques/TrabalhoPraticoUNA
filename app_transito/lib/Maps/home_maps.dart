import 'package:app_transito/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'controllers/maps_controller.dart';

class PreMaps extends StatefulWidget {
  const PreMaps({Key key}) : super(key: key);

  @override
  _PreMapsState createState() => _PreMapsState();
}

class _PreMapsState extends State<PreMaps> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    FirebaseFirestore.instance.collection('cafe').get().then((value) {
      value.docs.forEach((element) {
        print(element.data);
       });
    });
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SimpleDialog(
            title: Text(
              'Ocorreru um erro',
              style: AppTextStyles.titleBlue,
            ),
            children: [
              AlertDialog(
                title: Text('Ocorreu um erro!'),
                content: Text('Ocorreu um erro ao sincronizar o pedido!'),
                actions: [
                  FlatButton(
                    child: Text('Fechar'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          
          return Maps();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class Maps extends StatelessWidget {
  Maps({Key key}) : super(key: key);

  filtro() {
    return SimpleDialog(
      title: Text('Filtrar por Proximidade'),
      children: [
        Obx(
          () => Slider(
            value: ControllerMaps.to.raio.value,
            min: 0,
            max: 10,
            divisions: 10000,
            label: ControllerMaps.to.distancia,
            onChanged: (value) => ControllerMaps.to.raio.value = value,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 24, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => ControllerMaps.to.filtrarCafes(),
                child: Text('Filtrar'),
              ),
              TextButton(onPressed: () => Get.back(), child: Text('Cancelar')),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ControllerMaps());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.containerBlue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            top: true,
                      child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [

                  IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios_sharp, size: 35, color: Colors.white,)),
                  Text(
                    'Maps',
                    style: AppTextStyles.titlerose,
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    color: AppColors.titlerose,
                    iconSize: 35,
                    onPressed: () {
                      showDialog(
                          context: context, builder: (context) => filtro());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<ControllerMaps>(
        init: controller,
        builder: (value) => GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
            target: controller.position,
            zoom: 17,
          ),
          onMapCreated: controller.onMapCreated,
          myLocationEnabled: true,
          markers: controller.markers,
        ),
      ),
    );
  }
}

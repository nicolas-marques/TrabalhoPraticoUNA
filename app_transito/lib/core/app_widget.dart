

import 'package:app_transito/Maps/controllers/maps_controller.dart';
import 'package:app_transito/Maps/home_maps.dart';
import 'package:app_transito/categorias/categoria_contatos.dart';
import 'package:app_transito/categorias/categorias_geral.dart';

import 'package:app_transito/categorias/sub_categoria_primeirosSocorros.dart';
import 'package:app_transito/categorias/sub_categoria_texto.dart';
import 'package:app_transito/categorias/sub_categoria_veiculos.dart';
import 'package:app_transito/core/app_colors.dart';
import 'package:app_transito/simulado/home_simulado.dart';

import 'package:app_transito/simulado/splash_simulado.dart';
import 'package:get/get.dart';

import '../home/home_page.dart';
import '../splash/splash_page.dart';
import '../rotas/rotas.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "AppTransito",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      
      theme: ThemeData(
        primaryColor: AppColors.titlerose,
        primarySwatch: Colors.pink,
      ),
       routes: {
 RotasApp.Home: (context) => HomePage(),
 RotasApp.CategoriasGerais: (context) => CategoriasWidget(),
 RotasApp.SubCategoriaVeiculos: (context) => SubCategoriaVeiculo(),
 RotasApp.SubCategoriaPrimeirosSocorros: (context) => PrimeirosSocorros(),
 RotasApp.TextoComplementar: (context) => TextoComplementar(),
 RotasApp.Contatos: (context) => Contatos(),
 RotasApp.SplashSimulado: (context) => SplashPageSimulado(),
 RotasApp.Simulado: (context) => HomeSimulado(),
 RotasApp.Maps: (context) => PreMaps(),

 },
    );
  }
}

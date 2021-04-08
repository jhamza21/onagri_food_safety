import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget showTitle(String title) {
    return Text(title);
  }

  Widget showParagraph(String text) {
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          showTitle("SUIVI DE LA SECURITE ALIMENTAIRE DES MENAGES EN TUNISIE"),
          showParagraph(
              "La sécurité alimentaire est définie comme une situation dans laquelle tous les individus ont, à tout temps, un accès physique, social et économique à une nourriture suffisante, saine et nutritive qui satisfait leurs besoins et préférences alimentaires et leur permet de mener une vie saine et active."),
          showParagraph(
              "Un système de surveillance de la sécurité alimentaire ou Food Security Monitoring System (FSMS) est un outil permettant de suivre l’état de la sécurité alimentaire desménages vulnérables dans des régions géographiques spécifiques d’un pays afin de permettre au PAM et aux autres parties prenantes de mieux anticiper, préparer etrépondre aux crises futures."),
          showParagraph(
              "Les Systèmes d’information pour la sécurité alimentaire et nutritionnelle a pour but de développer des systèmes d’information qui répondent aux besoins des preneurs de décision. Cette Stratégie cherche à promouvoir des partenariats de longue durée au niveau national impliquant de nombreux acteurs et à répondre à la demande croissante d’analyse approfondie des facteurs structurels et émergents de l’insécurité alimentaire et nutritionnelle."),
          showParagraph(
              "L’enquête FSMS procède à la collecte des données primaires auprès des ménages-repères choisis de manière raisonnée pour garantir la représentativité des moyens d’existence. Les données primaires sont également complétées par les données secondaires des documents de référence récente.")
        ],
      ),
    );
  }
}

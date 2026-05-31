import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'identification_streaming.dart';

class partieGrilleImage extends StatelessWidget {
  const partieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      
      // 1. INDISPENSABLE : Empêche la grille d'occuper une hauteur infinie
      shrinkWrap: true,
      
      // 2. INDISPENSABLE : Délègue le défilement au SingleChildScrollView parent
      physics: const NeverScrollableScrollPhysics(),

      children: [
        const IdentificationStreaming(
          tagStream: 'stream_1',
          imageStream: 'assets/images/Radio.jpg',
          NomStream: 'Documentaires',
          ChaineRadio: 'Radio 4',
        ),
        const IdentificationStreaming(
          tagStream: 'stream_2',
          imageStream: 'assets/images/Tendances Modes.jpg',
          NomStream: 'Tendances Mode',
          ChaineRadio: 'Radio 3',
        ),
        const IdentificationStreaming(
          tagStream: 'stream_3',
          imageStream: 'assets/images/enquetes.jpg',
          NomStream: 'Enquêtes Criminelles',
          ChaineRadio: 'Radio 2',
        ),
        const IdentificationStreaming(
          tagStream: 'stream_4',
          imageStream: 'assets/images/Football.jpg',
          NomStream: 'Match de foot',
          ChaineRadio: 'Radio 5',
        ),
        const IdentificationStreaming(
          tagStream: 'stream_5',
          imageStream: 'assets/images/Streaming.jpg',
          NomStream: 'Streaming Météo',
          ChaineRadio: 'Radio 1',
        ),
        const IdentificationStreaming(
          tagStream: 'stream_6',
          imageStream: 'assets/images/Nouvelle.jpg',
          NomStream: 'Que des news',
          ChaineRadio: 'Radio 4',
        ),
      ],
    );
  }
}
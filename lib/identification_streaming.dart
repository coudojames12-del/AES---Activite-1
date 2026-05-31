import 'package:flutter/material.dart';
import 'album_streaming.dart'; // Import obligatoire de la page cible en mode classique

class IdentificationStreaming extends StatelessWidget {
  // Les 4 paramètres exigés par ton énoncé (respect strict de la casse)
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Le conteneur principal pour la forme et l'ombre en relief
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0), // Forme du widget
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15), // Ombre en relief
            blurRadius: 6.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // 2. Détecteur de gestes pour intercepter l'appui de l'utilisateur
      child: GestureDetector(
        onTap: () {
          // Utilisation de Navigator.push vers AlbumStreaming avec passage des données
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumStreaming(
                tagStream: tagStream,
                imageStream: imageStream,
                NomStream: NomStream,
                ChaineRadio: ChaineRadio,
              ),
            ),
          );
        },
        // 3. ClipRRect pour s'assurer que l'image supérieure épouse les coins arrondis
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          // 4. La colonne qui structure verticalement le contenu
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // * Élément 1 : L'image enveloppée dans un widget Hero pour la transition fluide
              Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  height: 130,
                  fit: BoxFit.cover,
                  // Sécurité : évite le crash si le chemin de l'image est incorrect pendant tes tests
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 130,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 40),
                  ),
                ),
              ),
              // * Élément 2 : Le conteneur pour les textes (Nom et Chaîne)
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      NomStream,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ChaineRadio,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

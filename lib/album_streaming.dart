import 'package:flutter/material.dart';

class AlbumStreaming extends StatelessWidget {
  // Les paramètres transmis depuis la page précédente
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fond violet foncé imposé par la capture d'écran du PDF (Page 2)
      backgroundColor: const Color(0xFF4A148C),
      body: CustomScrollView(
        slivers: [
          // AppBar rétractable avec l'image de l'émission
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            backgroundColor: const Color(0xFF4A148C),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: tagStream, // Même tag pour déclencher l'animation fluide
                child: Image.asset(
                  imageStream,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Contenu textuel et liste des diffusions
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NomStream,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ChaineRadio,
                    style: const TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Diffusions disponibles",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color: Colors.white24),

                  // Simulation d'une liste de diffusions en dur pour la version classique
                  _buildDiffusionTile("Diffusion 1", "2023-01-22"),
                  _buildDiffusionTile("Diffusion 2", "2023-09-28"),
                  _buildDiffusionTile("Diffusion 3", "2023-02-02"),
                  _buildDiffusionTile("Diffusion 4", "2023-01-22"),
                  _buildDiffusionTile("Diffusion 5", "2023-06-04"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget interne pour afficher chaque ligne de diffusion conformément au visuel
  Widget _buildDiffusionTile(String titre, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titre,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              const Icon(Icons.volume_up, color: Colors.amber, size: 20),
              const SizedBox(width: 8),
              Text(
                "Date: $date",
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.string(
              '''
  <svg
    width="40"
    height="40"
    viewBox="0 0 40 40"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
    className={className}
  >
    <path
      d="M20 5C11.7157 5 5 11.7157 5 20C5 28.2843 11.7157 35 20 35C28.2843 35 35 28.2843 35 20C35 11.7157 28.2843 5 20 5ZM20 7C27.1797 7 33 12.8203 33 20C33 27.1797 27.1797 33 20 33C12.8203 33 7 27.1797 7 20C7 12.8203 12.8203 7 20 7Z"
      fill="currentColor"
    />
    <path
      d="M20 9C13.9249 9 9 13.9249 9 20C9 26.0751 13.9249 31 20 31C26.0751 31 31 26.0751 31 20C31 13.9249 26.0751 9 20 9ZM20 11C24.9706 11 29 15.0294 29 20C29 24.9706 24.9706 29 20 29C15.0294 29 11 24.9706 11 20C11 15.0294 15.0294 11 20 11Z"
      fill="currentColor"
    />
    <path
      d="M20 15C17.2386 15 15 17.2386 15 20C15 22.7614 17.2386 25 20 25C22.7614 25 25 22.7614 25 20C25 17.2386 22.7614 15 20 15ZM20 17C21.6569 17 23 18.3431 23 20C23 21.6569 21.6569 23 20 23C18.3431 23 17 21.6569 17 20C17 18.3431 18.3431 17 20 17Z"
      fill="currentColor"
    />
    <path
      d="M19 2H21V7H19V2Z"
      fill="currentColor"
    />
    <path
      d="M19 33H21V38H19V33Z"
      fill="currentColor"
    />
    <path
      d="M38 19V21H33V19H38Z"
      fill="currentColor"
    />
    <path
      d="M7 19V21H2V19H7Z"
      fill="currentColor"
    />
  </svg>
              ''',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'iWorkout',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Add settings functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings pressed')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenue, Athlète!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prochain entraînement',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('Séance Jambes - 14:00'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Commencer'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Statistiques récentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildStatCard('Séances cette semaine', '3'),
                  _buildStatCard('Total de poids soulevé', '2500 kg'),
                  _buildStatCard('Exercice le plus fort', 'Squat - 100 kg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

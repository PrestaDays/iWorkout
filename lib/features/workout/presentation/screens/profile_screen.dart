import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/features/workout/presentation/bloc/user_display/user_display.cubit.dart';
import 'package:iworkout/features/workout/presentation/bloc/user_display/user_display_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: BlocProvider(
        create: (context) => UserDisplayCubit()..displayUser(),
        child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }

            if (state is UserLoaded) {
              return  Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(state.userEntity.image),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.userEntity.displayName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildInfoCard('Mes informations', [
                    _buildInfoRow('Nom', state.userEntity.displayName),
                  ]),
                  const SizedBox(height: 40),
                  _buildInfoCard('Mon objectif', [
                    _buildInfoRow('Prise de poids', 'Prendre 7kg'),
                  ]),

                ],
              );
            }

            if (state is LoadUserFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const Center(
              child: Text("An unexpected error occurred"),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}


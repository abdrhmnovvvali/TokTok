import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/ui/pages/profile/profile_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile duntayaudyahdkjshkdhksfhsm.fsklfjslkk')),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (state is ProfileSuccess) {
              return const Padding(
                padding: EdgeInsets.all(24.0),
                child: ProfileForm(),
              );
            }
        
            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
        
            return const Center(child: Text("Error loading profile"));
          },
        ),
      ),
    );
  }
}

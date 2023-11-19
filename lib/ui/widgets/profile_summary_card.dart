import 'package:flutter/material.dart';
import 'package:project/ui/screens/edit_profile_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text(
        "Murad",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text(
        "murad@gmail.com",
        style: TextStyle(color: Colors.white),
      ),
      trailing: enableOnTap? const Icon(
        Icons.arrow_right_alt_outlined,
        color: Colors.white,
      ):null,
      tileColor: Colors.green,
    );
  }
}

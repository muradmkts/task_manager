import 'package:flutter/material.dart';
import 'package:project/ui/screens/new_tasks_screen.dart';
import 'package:project/ui/widgets/body_background.dart';
import 'package:project/ui/widgets/profile_summary_card.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            Expanded(
              child: BodyBackground(
                child: SingleChildScrollView(
                  child: Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Add New Task",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Subject"),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          maxLines: 5,
                          decoration:
                              const InputDecoration(hintText: "Descriptions"),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewTasksScreen()));
                            },
                            child: const Icon(Icons.arrow_circle_right_rounded),
                          ),
                        )
                      ],
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

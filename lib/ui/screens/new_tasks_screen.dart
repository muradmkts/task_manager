import 'package:flutter/material.dart';
import 'package:project/ui/screens/add_new_task_screen.dart';
import 'package:project/ui/widgets/profile_summary_card.dart';
import 'package:project/ui/widgets/summary_card.dart';
import 'package:project/ui/widgets/task_item_card.dart';
import 'package:project/ui/widgets/task_item_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    SummaryCard(
                      count: "32",
                      title: "New",
                    ),
                    SummaryCard(
                      count: "92",
                      title: "In Progress",
                    ),
                    SummaryCard(
                      count: "42",
                      title: "Completed",
                    ),
                    SummaryCard(
                      count: "2",
                      title: "Cencled",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItemCard();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

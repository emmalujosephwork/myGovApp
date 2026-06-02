import 'package:flutter/material.dart';
import 'create_ticket_page.dart';
import 'my_tickets_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void goToCreateTicket(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateTicketPage()),
    );
  }

  void goToMyTickets(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MyTicketsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Citizen Dashboard"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => goToCreateTicket(context),
            child: const Text(
              "Create Ticket",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => goToMyTickets(context),
            child: const Text(
              "My Tickets",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome to GovConnect",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Submit, track and manage your public service requests in one place.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // STATS
            isMobile
                ? const Column(
                    children: [
                      StatCard(
                        title: "Total Tickets",
                        value: "12",
                        icon: Icons.confirmation_number,
                      ),
                      SizedBox(height: 15),
                      StatCard(
                        title: "Pending",
                        value: "4",
                        icon: Icons.pending_actions,
                      ),
                      SizedBox(height: 15),
                      StatCard(
                        title: "In Progress",
                        value: "5",
                        icon: Icons.autorenew,
                      ),
                      SizedBox(height: 15),
                      StatCard(
                        title: "Resolved",
                        value: "3",
                        icon: Icons.check_circle,
                      ),
                    ],
                  )
                : const Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          title: "Total Tickets",
                          value: "12",
                          icon: Icons.confirmation_number,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: StatCard(
                          title: "Pending",
                          value: "4",
                          icon: Icons.pending_actions,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: StatCard(
                          title: "In Progress",
                          value: "5",
                          icon: Icons.autorenew,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: StatCard(
                          title: "Resolved",
                          value: "3",
                          icon: Icons.check_circle,
                        ),
                      ),
                    ],
                  ),

            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // ACTION CARDS
            isMobile
                ? Column(
                    children: [
                      ActionCard(
                        icon: Icons.add_circle_outline,
                        title: "Create New Ticket",
                        description:
                            "Submit a request for licence, permit, road, health or transport services.",
                        buttonText: "Create Ticket",
                        onTap: () => goToCreateTicket(context),
                      ),
                      const SizedBox(height: 18),
                      ActionCard(
                        icon: Icons.list_alt,
                        title: "View My Tickets",
                        description:
                            "Track your submitted requests and view latest status updates.",
                        buttonText: "View Tickets",
                        onTap: () => goToMyTickets(context),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ActionCard(
                          icon: Icons.add_circle_outline,
                          title: "Create New Ticket",
                          description:
                              "Submit a request for licence, permit, road, health or transport services.",
                          buttonText: "Create Ticket",
                          onTap: () => goToCreateTicket(context),
                        ),
                      ),
                      const SizedBox(width: 22),
                      Expanded(
                        child: ActionCard(
                          icon: Icons.list_alt,
                          title: "View My Tickets",
                          description:
                              "Track your submitted requests and view latest status updates.",
                          buttonText: "View Tickets",
                          onTap: () => goToMyTickets(context),
                        ),
                      ),
                    ],
                  ),

            const SizedBox(height: 30),

            // RECENT ACTIVITY
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Recent Activity",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    ActivityItem(
                      title: "Driving licence renewal ticket is in progress.",
                      status: "In Progress",
                    ),
                    ActivityItem(
                      title: "Road damage complaint is pending review.",
                      status: "Pending",
                    ),
                    ActivityItem(
                      title: "Building permit enquiry was resolved.",
                      status: "Resolved",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: const Color(0xFFE0EAFF),
              child: Icon(icon, color: const Color(0xFF2563EB), size: 30),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF2563EB), size: 45),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: onTap,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String title;
  final String status;

  const ActivityItem({
    super.key,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Color(0xFFE0EAFF),
        child: Icon(Icons.notifications, color: Color(0xFF2563EB)),
      ),
      title: Text(title),
      trailing: Text(
        status,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2563EB),
        ),
      ),
    );
  }
}
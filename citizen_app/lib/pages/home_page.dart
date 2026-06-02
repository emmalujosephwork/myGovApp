import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void goToDashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DashboardPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                children: [
                  const Text(
                    "GovConnect",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  if (!isMobile) ...[
                    TextButton(onPressed: () {}, child: const Text("Services")),
                    TextButton(onPressed: () {}, child: const Text("Permits")),
                    TextButton(onPressed: () {}, child: const Text("Licences")),
                    TextButton(onPressed: () {}, child: const Text("Support")),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 42),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                      ),
                      onPressed: () => goToDashboard(context),
                      child: const Text("Go to Dashboard"),
                    ),
                  ] else ...[
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu),
                      onSelected: (value) {
                        if (value == "dashboard") {
                          goToDashboard(context);
                        }
                      },
                      itemBuilder:
                          (context) => const [
                            PopupMenuItem(
                              value: "services",
                              child: Text("Services"),
                            ),
                            PopupMenuItem(
                              value: "permits",
                              child: Text("Permits"),
                            ),
                            PopupMenuItem(
                              value: "licences",
                              child: Text("Licences"),
                            ),
                            PopupMenuItem(
                              value: "support",
                              child: Text("Support"),
                            ),
                            PopupMenuItem(
                              value: "dashboard",
                              child: Text("Go to Dashboard"),
                            ),
                          ],
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Digital Governance Platform",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 40 : 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Apply for permits, licences and public services online",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () => goToDashboard(context),
                    child: const Text("Go to Dashboard"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Popular Services",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20),
              child:
                  isMobile
                      ? const Column(
                        children: [
                          ServiceCard(
                            icon: Icons.badge,
                            title: "Driving Licence",
                            description: "Apply and renew licences online.",
                          ),
                          SizedBox(height: 20),
                          ServiceCard(
                            icon: Icons.home_work,
                            title: "Building Permit",
                            description: "Track permit approvals and requests.",
                          ),
                          SizedBox(height: 20),
                          ServiceCard(
                            icon: Icons.directions_bus,
                            title: "Transport",
                            description: "Transport complaints and services.",
                          ),
                        ],
                      )
                      : const Row(
                        children: [
                          Expanded(
                            child: ServiceCard(
                              icon: Icons.badge,
                              title: "Driving Licence",
                              description: "Apply and renew licences online.",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ServiceCard(
                              icon: Icons.home_work,
                              title: "Building Permit",
                              description:
                                  "Track permit approvals and requests.",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ServiceCard(
                              icon: Icons.directions_bus,
                              title: "Transport",
                              description: "Transport complaints and services.",
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Icon(icon, size: 60, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

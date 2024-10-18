import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.iconColor,
    required this.switchValue,
    required this.onSwitch,
  });

  final Color iconColor;
  final bool switchValue;
  final void Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ControlItem(icon: Icons.calendar_month, label: "April, 8"),
          const ControlItem(icon: Icons.access_alarms_sharp, label: "Time"),
          ToggleSwitch(
            switchValue: switchValue,
            onSwitch: onSwitch,
          ),
        ],
      ),
    );
  }
}

class ControlItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const ControlItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 42, color: const Color(0xFF637394)),
        Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key, required this.switchValue, this.onSwitch});

  final bool switchValue;

  final dynamic onSwitch;

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          activeTrackColor: const Color(0xFFFF8036),
          value: widget.switchValue,
          onChanged: widget.onSwitch,
        ),
        const Text(
          "By Cinemar",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}

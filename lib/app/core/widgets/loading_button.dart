import 'dart:async';

import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final FutureOr<void> Function() onTap;
  final bool enabled;
  final String label;
  final double? width;

  const LoadingButton({Key? key, required this.onTap, required this.enabled, required this.label, this.width}) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  Future<void> _onTap() async {
    setState(() {
      isLoading = true;
    });
    await widget.onTap();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 45,
      width: isLoading ? 45 : (widget.width ?? 80),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: widget.enabled ? Theme.of(context).colorScheme.primary : Theme.of(context).disabledColor,
        child: isLoading
            ? const Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(color: Colors.white))
            : InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: widget.enabled ? _onTap : null,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.label,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
      ),
    );
  }
}

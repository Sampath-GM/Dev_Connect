import 'package:flutter/material.dart';

class VideoCallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   title: Text('Video Call'),
      //   backgroundColor: Colors.teal,
      // ),
      body: Stack(
        children: <Widget>[
          _remoteVideoView(), // Remote video
          _localVideoView(),  // Local video
          _callControls(),    // Call controls
        ],
      ),
    );
  }

  // Remote video view (full screen)
  Widget _remoteVideoView() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child:const Center(
        child: Text(
          'Remote Video',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  // Local video view (small overlay)
  Widget _localVideoView() {
    return Positioned(
      top: 20.0,
      right: 20.0,
      width: 120.0,
      height: 160.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
        ),
        child: const Center(
          child: Text(
            'Local Video',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  // Call controls (bottom bar)
  Widget _callControls() {
    return Positioned(
      bottom: 20.0,
      left: 0.0,
      right: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _controlButton(Icons.switch_camera, 'Switch Camera'),
          _controlButton(Icons.mic_off, 'Mute'),
          _controlButton(Icons.call_end, 'End Call', color: Colors.red),
        ],
      ),
    );
  }

  // Control button widget
  Widget _controlButton(IconData icon, String label, {Color color = Colors.white}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: color,
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8.0),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

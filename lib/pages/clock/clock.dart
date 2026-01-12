import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _timer;
  int _countdown = 0;
  bool _isRinging = false;

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose(); // 记得销毁，释放内存
    super.dispose();
  }

  void _startAlarm(int seconds) {
    _audioPlayer.stop(); // 如果正在响，先停掉
    setState(() {
      _isRinging = false;
      _countdown = seconds;
    });

    // 创建一个秒计时的 Timer 更新 UI
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_countdown > 1) {
        setState(() => _countdown--);
      } else {
        timer.cancel();
        setState(() {
          _countdown = 0;
          _isRinging = true;
        });

        // 核心播放逻辑
        try {
          print("正在尝试播放: ../lib/assets/music/test.mp3");
          // 这里的路径必须和你 pubspec.yaml 中声明的完全一致
          await _audioPlayer.play(AssetSource('../lib/assets/music/test.mp3'));
        } catch (e) {
          print("播放失败，错误详情: $e");
          // 如果还是失败，建议 print(await _audioPlayer.source); 看看解析出的地址
        }
      }
    });
  }

  void _stopAlarm() async {
    await _audioPlayer.stop();
    _timer?.cancel();
    setState(() {
      _isRinging = false;
      _countdown = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 闹钟图标动画效果
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.all(_isRinging ? 30 : 10),
          decoration: BoxDecoration(
            color: _isRinging ? Colors.red.withOpacity(0.2) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            _isRinging ? Icons.notifications_active : Icons.notifications_none,
            size: 80,
            color: _isRinging ? Colors.red : Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _isRinging ? "起床啦！" : (_countdown > 0 ? "倒计时: $_countdown 秒" : "准备就绪"),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _startAlarm(5),
              icon: const Icon(Icons.timer),
              label: const Text("5秒闹钟"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),
            const SizedBox(width: 20),
            ElevatedButton.icon(
              onPressed: _stopAlarm,
              icon: const Icon(Icons.stop),
              label: const Text("停止"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
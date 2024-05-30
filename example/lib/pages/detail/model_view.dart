import 'package:flutter/material.dart';
import 'package:playx_3d_scene/playx_3d_scene.dart';

class ModelViewPage extends StatefulWidget {
  const ModelViewPage({super.key, required this.path});
  final String path;

  @override
  State<ModelViewPage> createState() => _ModelViewPageState();
}

class _ModelViewPageState extends State<ModelViewPage> {
  bool isModelLoading = false;
  bool isSceneLoading = false;
  late Playx3dSceneController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Hủy lắng nghe stream và giải phóng tài nguyên tại đây
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Playx3dScene(
              model: GlbModel.asset(
                widget.path,
                animation: PlayxAnimation.byIndex(0, autoPlay: true),
                fallback: GlbModel.asset(widget.path),
                centerPosition: PlayxPosition(x: 0, y: 0, z: -4),
                scale: 1.0,
              ),
              scene: Scene(
                skybox: HdrSkybox.asset("assets/envs/HDR_blue_nebulae-1.hdr"),
                indirectLight: HdrIndirectLight.asset(
                  "assets/envs/HDR_blue_nebulae-1.hdr",
                  intensity: 100000,
                ),
                light: Light(
                    type: LightType.sun,
                    colorTemperature: 6500,
                    intensity: 100000,
                    castShadows: true,
                    castLight: true,
                    position: PlayxPosition(x: 0, y: 0, z: -10),
                    direction: PlayxDirection(x: 0, y: 0, z: -10)),
                camera: Camera.orbit(
                  exposure: Exposure.formAperture(
                    aperture: 16.0,
                    shutterSpeed: 1 / 125,
                    sensitivity: 150,
                  ),
                  targetPosition: PlayxPosition(x: 0.0, y: 0.0, z: -4.0),
                  orbitHomePosition: PlayxPosition(x: 0.0, y: 1.0, z: 1.0),
                  upVector: PlayxPosition(x: 0.0, y: 1.0, z: 0.0),
                ),
              ),
              onCreated: (Playx3dSceneController controller) async {
                Future.delayed(const Duration(seconds: 5), () async {
                  Result<int?> result =
                      await controller.changeAnimationByIndex(1);

                  if (result.isSuccess()) {
                    final data = result.data;
                    print("success :$data");
                  } else {
                    print(result.message);
                  }
                });
              },
              onModelStateChanged: (state) {
                setState(() {
                  isModelLoading = state == ModelState.loading;
                });
              },
              onSceneStateChanged: (state) {
                setState(() {
                  isSceneLoading = state == SceneState.loading;
                });
              },
              onEachRender: (frameTimeNano) {},
            ),
            isModelLoading || isSceneLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

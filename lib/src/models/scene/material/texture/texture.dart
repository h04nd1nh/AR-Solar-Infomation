import 'package:playx_3d_scene/src/models/scene/material/texture/enums/texture_type.dart';
import 'package:playx_3d_scene/src/models/scene/material/texture/texture_sampler.dart';

/// An object represents textures to be loaded by the material.
class PlayxTexture {
  /// asset path of the texture.
  String? assetPath;

  /// url of the texture.
  String? url;

  /// type of the texture.
  TextureType? type;

  ///
  PlayxTextureSampler? sampler;

  PlayxTexture.asset(this.assetPath, {this.type, this.sampler});

  PlayxTexture.url(this.url, {this.type, this.sampler});

  Map<String, dynamic> toJson() => {
        'assetPath': assetPath,
        'url': url,
        'type': type?.toName(),
        'sampler': sampler?.toJson(),
      };
}

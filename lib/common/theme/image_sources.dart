abstract final class ImageSources {
  static const Map<int, String> _rockets = {
    15: 'soyuz_2_1b',
    26: 'electron',
    27: 'atlas_v_551',
    64: 'long_march_4c',
    84: 'long_march_2f_g',
    117: 'nuri',
    121: 'ariane_62',
    137: 'new_shepard',
    138: 'new_glenn',
    164: 'falcon_9',
    172: 'lvm_3',
    204: 'h3_24',
    461: 'ceres_1',
    479: 'vulcan_vc6l',
    483: 'kinetica_1',
    503: 'gravity_1',
    518: 'long_march_8a',
    522: 'starship_v3',
    527: 'starship_v2',
  };

  static String rocket(int configurationId) =>
      'assets/rockets/${_rockets[configurationId]}.jpg';
}

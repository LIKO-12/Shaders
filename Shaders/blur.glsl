float amount = 0.5;
float channelDiff = 1.0;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords);
  float blurH = amount / 192.0;
  float blurV = amount / 128.0;

  // Kernel
  vec2 offsets[8]; 
    
  offsets[0] = vec2(blurH, 0);
  offsets[1] = vec2(-blurH, 0);
  offsets[2] = vec2(0, blurV);
  offsets[3] = vec2(0, -blurV);
  offsets[4] = vec2(blurH, blurV);
  offsets[5] = vec2(blurH, -blurV);
  offsets[6] = vec2(-blurH, blurV);
  offsets[7] = vec2(-blurH, -blurV);

  // Scanlines
  if (mod(int(screen_coords.y), 3)!=0) {
     pixel.rgb *= 0.0;
   }

  // Blur
  for(int i=0; i<8; i++) {
    pixel.r += Texel(texture, texture_coords + offsets[i] + vec2(channelDiff/192.0, channelDiff/128.0)).r;
    pixel.gba += Texel(texture, texture_coords + offsets[i]).gba;
  }
   pixel /= 9.0;

   
  return pixel;
}

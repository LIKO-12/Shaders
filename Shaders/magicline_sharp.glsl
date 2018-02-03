float psx = 1.0 / 192.0;
float psy = 1.0 / 128.0;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords); //This is the current pixel color
  
  vec4 leftPixel = Texel(texture, vec2(texture_coords.x-psx,texture_coords.y));
  vec4 rightPixel = Texel(texture, vec2(texture_coords.x+psx,texture_coords.y));
  vec4 upPixel = Texel(texture, vec2(texture_coords.x,texture_coords.y-psy));
  vec4 downPixel = Texel(texture, vec2(texture_coords.x,texture_coords.y+psy));
  
  vec4 lDiff = pixel - leftPixel;
  vec4 rDiff = pixel - rightPixel;
  vec4 uDiff = pixel - upPixel;
  vec4 dDiff = pixel - downPixel;
  
  vec4 sum = lDiff + rDiff + uDiff + dDiff;
  vec3 clamped = clamp(pixel.rgb - sum.rgb, 0.0, 1.0);
  
  return vec4(clamped, 1.0);
}
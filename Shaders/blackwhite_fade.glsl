vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  number average = (pixel.r+pixel.b+pixel.g)/3.0;
  number factor = clamp(texture_coords.x*1.75,0.0,1.0);
  pixel.r = pixel.r + (average-pixel.r) * factor;
  pixel.g = pixel.g + (average-pixel.g) * factor;
  pixel.b = pixel.b + (average-pixel.b) * factor;
  return pixel;
}
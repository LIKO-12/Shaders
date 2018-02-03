vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  pixel.r = 1 - pixel.r;
  pixel.g = 1 - pixel.g;
  pixel.b = 1 - pixel.b;
  return pixel;
}
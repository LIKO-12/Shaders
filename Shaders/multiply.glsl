vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  number result = pixel.r*pixel.b*pixel.g;
  pixel.r = result;
  pixel.g = result;
  pixel.b = result;
  return pixel;
}
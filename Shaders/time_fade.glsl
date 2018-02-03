uniform int time;
number factor = abs(1 - mod(time, 1000)/500);
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  pixel.r = pixel.r*factor;
  pixel.g = pixel.g*factor;
  pixel.b = pixel.b*factor;
  return pixel;
}
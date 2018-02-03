vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  texture_coords.x = mod(texture_coords.x*2,1);
  texture_coords.y = abs(1-texture_coords.y*2);
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  return pixel;
}
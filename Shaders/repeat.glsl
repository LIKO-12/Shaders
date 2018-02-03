vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  texture_coords.xy = mod(texture_coords.xy*2,vec2(1,1));
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  return pixel;
}
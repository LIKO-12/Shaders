vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords);

  float y = screen_coords.y;
  pixel.rgb *= mod(int(y), 2);
  
  return pixel;
}
uniform int time;
float shift = abs(0.1-mod(time,500)/500);
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  float y = screen_coords.y;
  
  if (texture_coords.y < shift) {
    texture_coords.y = texture_coords.y + (1 - shift);
    vec4 pixel = Texel(texture, texture_coords);
    pixel.rgb *= mod(int(y), 2);
	return pixel;
  } else {
	texture_coords.y = texture_coords.y - shift;
    vec4 pixel = Texel(texture, texture_coords);
    pixel.rgb *= mod(int(y), 2);
	return pixel;
  }
}
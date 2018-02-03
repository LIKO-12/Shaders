vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  if (texture_coords.x < 0.5) {
    if (texture_coords.y < 0.5) {
	  //Top-Left
	  texture_coords.xy = mod(texture_coords.xy*2,vec2(1,1));
	  vec4 pixel = Texel(texture, texture_coords);
	  pixel.g = 0;
	  pixel.b = 0;
	  return pixel;
	} else {
	  //Bottom-Left
	  texture_coords.xy = mod(texture_coords.xy*2,vec2(1,1));
	  vec4 pixel = Texel(texture, texture_coords);
	  pixel.g = 0;
	  pixel.r = 0;
	  return pixel;
	}
  } else {
    if (texture_coords.y < 0.5) {
	  //Top-Right
	  texture_coords.xy = mod(texture_coords.xy*2,vec2(1,1));
	  vec4 pixel = Texel(texture, texture_coords);
	  pixel.r = 0;
	  pixel.b = 0;
	  return pixel;
	} else {
	  //Bottom-Left
	  texture_coords.xy = mod(texture_coords.xy*2,vec2(1,1));
	  vec4 pixel = Texel(texture, texture_coords);
	  return pixel;
	}
  }
  
  return vec4(0,0,0,0);
}
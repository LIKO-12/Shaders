float psx = 0.75 / 192.0;
float psy = 0.75 / 128.0;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords); //This is the current pixel color
  
  vec4 leftPixel = Texel(texture, vec2(texture_coords.x-psx,texture_coords.y));
  vec4 rightPixel = Texel(texture, vec2(texture_coords.x+psx,texture_coords.y));
  vec4 upPixel = Texel(texture, vec2(texture_coords.x,texture_coords.y-psy));
  vec4 downPixel = Texel(texture, vec2(texture_coords.x,texture_coords.y+psy));
  
  if (pixel != leftPixel || pixel != rightPixel || pixel != upPixel || pixel != downPixel) {
    pixel.rgb = pixel.rgb*0.9;
  }
  
  return pixel;
}
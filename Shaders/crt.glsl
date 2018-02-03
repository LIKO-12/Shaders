float pixelSize = 1.0;
float brightness = 1.0;
float crtfade = 0.75;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords);

  vec3 col;
  vec2 cor;
  cor.x = screen_coords.x/pixelSize;
  cor.y = (screen_coords.y+pixelSize*1.5*mod(int(cor.x), 2))/(pixelSize*3);

  vec2 ico = floor(cor);
  vec2 fco = fract(cor);

  vec3 pix;
  pix.x = step(1.5, mod(int(ico.x), 3));
  pix.y = step(1.5, mod(int(1.0 + ico.x), 3));
  pix.z = step(1.5, mod(int(2.0 + ico.x), 3));

  vec4 ima = Texel(texture, pixelSize*ico*vec2(1.0, 3.0)/vec2(576.0, 384.0));
  col = pix * dot(pix, ima.rgb);
  col *= step(abs(fco.x-0.5), 0.4);
  col *= step(abs(fco.y-0.5), 0.4);
  col *= (1.0 + brightness);

  if(col.r==0.0 && col.g==0.0 && col.b==0.0) {
  	col = mix(col, ima.rgb, crtfade);
  } 
  
  return vec4(col, 1.0);
}

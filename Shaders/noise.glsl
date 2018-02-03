uniform int time;
float tf = 0.5 + mod(time,1000)/2000.0;

float rand(vec2 co){
    return fract(sin(dot(co.xy*tf ,vec2(12.9898,78.233))) * 43758.5453);
}

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
  vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
  float random = rand(texture_coords);
  pixel.r = random * pixel.r;
  pixel.g = random * pixel.g;
  pixel.b = random * pixel.b;
  return pixel;
}
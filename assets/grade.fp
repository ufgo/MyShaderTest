varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D original;

const float u_sample_step = 1.0;
const int u_nsample = 0;
const vec2 u_center = vec2(0.5,0.5); // center in origional image, normalized to [0, 1]
uniform lowp vec4 prop;
void main()
{	
	vec2 resolution=vec2(800,600);

	vec2 coord = gl_FragCoord.xy / resolution.xy;

	vec2 cstep = u_sample_step/resolution.xy * normalize(u_center - coord);

	vec4 color = vec4(0.0);
	for(int i=0; i< u_nsample+int(prop.x); ++i) {
		color += texture2D(original, coord);
		coord += cstep;
	}
	gl_FragColor = color/float(float(u_nsample)+prop.x);
}
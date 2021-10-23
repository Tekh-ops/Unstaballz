#version 450 core

layout(location = 0) out vec4 o_Color;

in vec4 v_Color;
in vec2 v_TexCoord;
in vec4 srcRect; //r posX g posY b widthX a widthY
in float v_TexIndex;
uniform sampler2D u_Textures[32];
void main()
{
	if(v_TexIndex!=0)
	{
		vec2 newTexCoord = vec2((v_TexCoord.x*srcRect.b)+ srcRect.r,(v_TexCoord.y*srcRect.a)-(srcRect.g)+(-srcRect.a+1.0));
		int index = int(v_TexIndex);
		o_Color = texture(u_Textures[index],vec2(newTexCoord.x,newTexCoord.y)) * v_Color;
		if ( o_Color.a <= 0.1f)
		{
			discard;
		}
	}
	else
	{
		o_Color = v_Color;
	}
}

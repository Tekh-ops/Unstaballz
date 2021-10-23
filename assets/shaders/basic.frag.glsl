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
		if (v_TexCoord.x<srcRect.b && v_TexCoord.y >(-srcRect.a+1))
		{
			vec2 newTexCoord = vec2(v_TexCoord.x+ srcRect.r,v_TexCoord.y- srcRect.g);
			int index = int(v_TexIndex);
			o_Color = texture(u_Textures[index],newTexCoord) * v_Color;
			if ( o_Color.a <= 0.1f)
			{
				discard;
			}
		}
		else
		{
			discard;
		}
	}
	else
	{
		o_Color = v_Color;
	}
}

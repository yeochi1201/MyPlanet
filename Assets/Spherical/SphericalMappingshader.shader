Shader "Custom/SphericalMapping"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 pos : POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;

            v2f vert (appdata a)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(a.vertex);
                
                // Convert normal to spherical coordinates
                float3 norm = normalize(a.normal);
                float u = atan2(norm.z, norm.x) * 0.5 / 3.141592653589793 + 0.5;
                float v = norm.y * 0.5 + 0.5;
                
                o.uv = float2(u, v);
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                return tex2D(_MainTex, i.uv);
            }
            ENDCG
        }
    }
}
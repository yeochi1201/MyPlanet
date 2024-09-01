Shader "Custom/FisheyeLens"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Distortion ("Distortion", Range(0, 1)) = 0.5
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
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float _Distortion;

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv * 2.0 - 1.0; // Centered UV
                float r = length(uv);
                float theta = atan2(uv.y, uv.x);
                float2 uv_distorted = float2(cos(theta) * r * (1.0 + _Distortion), sin(theta) * r * (1.0 + _Distortion)) * 0.5 + 0.5;
                return tex2D(_MainTex, uv_distorted);
            }
            ENDCG
        }
    }
}
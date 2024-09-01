Shader "Custom/VertexBendingWithHorizon"
{
    Properties
    {
        _G1("G1", Float) = 1.0
        _G2("G2", Float) = 1.0
        _G3("G3", Float) = 1.0
        _G4("G4", Float) = 1.0
    }
    SubShader
    {
        Tags {"Queue" = "Geometry"}
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            // Properties
            float _G1;
            float _G2;
            float _G3;
            float _G4;

            // Vertex Shader
            struct appdata_t
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : POSITION;
            };

            v2f vert(appdata_t v)
            {
                v2f o;

                // Extract the original vertex coordinates
                float x = v.vertex.x;
                float y = v.vertex.y;
                float z = v.vertex.z;

                // Apply the transformation based on given equations
                float e_x = x + _G1 * x * y;
                float e_y = y - (_G3 * (x * x) + _G4 * (z * z));
                float e_z = y + _G2 * z * y;

                // Output the transformed vertex position
                o.pos = UnityObjectToClipPos(float4(e_x, e_y, e_z, 1.0));
                
                return o;
            }

            // Fragment Shader (simple pass-through)
            half4 frag(v2f i) : COLOR
            {
                return half4(1, 1, 1, 1); // White color
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
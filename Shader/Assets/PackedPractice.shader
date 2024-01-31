Shader "Holistic/PackedPractice"
{
    Properties{
        _myColour ("Example Colour", Color) = (1,1,1,1)
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        
        struct Input{
            float2 uvMainTex;
        };

        // 4 values 가 들어있다.
        // r g b a 
        fixed4 _myColour;
       
        void surf (Input IN, inout SurfaceOutputStandard o){
            o.Albedo.rg = _myColour.rg;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

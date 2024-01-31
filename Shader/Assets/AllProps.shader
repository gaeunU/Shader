Shader "Holistic/AllProps"
{
    Properties
    {
        _myColor ("Example Color", Color) = (1,1,1,1)
        _myRange("Example Range", Range(0,5)) =1
        _myTex("Example Texture", 2D) = "white" {}
        _myCube("Example Cube", CUBE)="" {}
        _myFloat("Example Float", Float) = 0.5
        _myVector("Example Vector", Vector) =(0.5, 1,1,1)
    }
    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        fixed4 _myColor;
        half _myRange;
        sampler2D _myTex;
        samplerCUBE _myCube;
        float _myFloat;
        float4 _myVector;

        struct Input {
            // uv 최대 2개
            float2 uv_myTex;
            float3 worldRefl;
        };

        void surf (Input IN, inout SurfaceOutput o){
            // Albedo comes from a texture tinted by color
            o.Albedo = (tex2D (_myTex, IN.uv_myTex) * _myRange).rgb;
            o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
        }
        
        ENDCG
    }
    FallBack "Diffuse"
}

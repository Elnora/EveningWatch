// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32429,y:32716|normal-118-RGB,emission-4311-OUT,custl-103-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2,x:33025,y:33241;n:type:ShaderForge.SFN_LightColor,id:3,x:33025,y:33092;n:type:ShaderForge.SFN_Multiply,id:103,x:32708,y:32945|A-4415-OUT,B-3-RGB,C-2-OUT;n:type:ShaderForge.SFN_Tex2d,id:118,x:32742,y:32455,ptlb:Normal,ptin:_Normal,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Add,id:453,x:32957,y:32821|A-557-OUT,B-649-OUT;n:type:ShaderForge.SFN_Multiply,id:557,x:33206,y:32622,cmnt:Diffuse Contrib|A-1038-RGB,B-1489-OUT;n:type:ShaderForge.SFN_Multiply,id:649,x:33206,y:32799,cmnt:Specular contrib|A-1750-OUT,B-1900-OUT;n:type:ShaderForge.SFN_Tex2d,id:1038,x:33465,y:32439,ptlb:Diffuse,ptin:_Diffuse,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Dot,id:1489,x:33575,y:32649,dt:1|A-3583-OUT,B-3339-OUT;n:type:ShaderForge.SFN_Power,id:1750,x:33400,y:32799|VAL-2228-OUT,EXP-2478-OUT;n:type:ShaderForge.SFN_Slider,id:1900,x:33206,y:32972,ptlb:Specularity,ptin:_Specularity,min:0,cur:1.691214,max:4;n:type:ShaderForge.SFN_Dot,id:2228,x:33575,y:32799,dt:1|A-3339-OUT,B-3175-OUT;n:type:ShaderForge.SFN_Exp,id:2478,x:33575,y:32961,et:1|IN-4056-OUT;n:type:ShaderForge.SFN_HalfVector,id:3175,x:33804,y:32877;n:type:ShaderForge.SFN_NormalVector,id:3339,x:33804,y:32731,pt:True;n:type:ShaderForge.SFN_LightVector,id:3583,x:33804,y:32603;n:type:ShaderForge.SFN_Slider,id:4056,x:33804,y:33052,ptlb:Glossiness,ptin:_Glossiness,min:0,cur:6.104486,max:30;n:type:ShaderForge.SFN_AmbientLight,id:4305,x:33508,y:32268;n:type:ShaderForge.SFN_Multiply,id:4311,x:33179,y:32380|A-4305-RGB,B-1038-RGB;n:type:ShaderForge.SFN_Color,id:4386,x:33008,y:32546,ptlb:Color,ptin:_Color,glob:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:4415,x:32799,y:32630|A-4386-RGB,B-453-OUT;proporder:118-1038-1900-4056-4386;pass:END;sub:END;*/

Shader "Shader Forge/BlinnPhong" {
    Properties {
        _Normal ("Normal", 2D) = "bump" {}
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Specularity ("Specularity", Range(0, 4)) = 1.691214
        _Glossiness ("Glossiness", Range(0, 30)) = 6.104486
        _Color ("Color", Color) = (1,0,0,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _Specularity;
            uniform float _Glossiness;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_4422 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_4422.rg, _Normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 node_1038 = tex2D(_Diffuse,TRANSFORM_TEX(node_4422.rg, _Diffuse));
                float3 emissive = (UNITY_LIGHTMODEL_AMBIENT.rgb*node_1038.rgb);
                float3 node_3339 = normalDirection;
                float3 finalColor = emissive + ((_Color.rgb*((node_1038.rgb*max(0,dot(lightDirection,node_3339)))+(pow(max(0,dot(node_3339,halfDirection)),exp2(_Glossiness))*_Specularity)))*_LightColor0.rgb*attenuation);
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _Specularity;
            uniform float _Glossiness;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_4423 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_4423.rg, _Normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 node_1038 = tex2D(_Diffuse,TRANSFORM_TEX(node_4423.rg, _Diffuse));
                float3 node_3339 = normalDirection;
                float3 finalColor = ((_Color.rgb*((node_1038.rgb*max(0,dot(lightDirection,node_3339)))+(pow(max(0,dot(node_3339,halfDirection)),exp2(_Glossiness))*_Specularity)))*_LightColor0.rgb*attenuation);
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

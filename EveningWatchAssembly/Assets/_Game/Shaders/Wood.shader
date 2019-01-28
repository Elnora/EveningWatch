// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32219,y:32910|spec-8-RGB,normal-14-RGB,custl-104-OUT;n:type:ShaderForge.SFN_Tex2d,id:8,x:32913,y:33023,ptlb:Specular,ptin:_Specular,tex:dde52513796863547a57d38ceeb676ee,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:14,x:32928,y:33212,ptlb:Normal,ptin:_Normal,tex:8c0ccffdb1ed5304690c49f77a6c0cb1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:68,x:33205,y:32538,ptlb:Texture,ptin:_Texture,tex:fb982b65dfea8a84ea9b723ad9db87a5,ntxv:0,isnm:False|UVIN-84-OUT;n:type:ShaderForge.SFN_Color,id:76,x:33205,y:32726,ptlb:Color,ptin:_Color,glob:False,c1:1,c2:0.6509804,c3:0.4352941,c4:1;n:type:ShaderForge.SFN_TexCoord,id:83,x:33650,y:32543,uv:0;n:type:ShaderForge.SFN_Multiply,id:84,x:33433,y:32596|A-83-UVOUT,B-87-OUT;n:type:ShaderForge.SFN_Slider,id:87,x:33650,y:32710,ptlb:Tile,ptin:_Tile,min:0,cur:3,max:10;n:type:ShaderForge.SFN_LightVector,id:95,x:32977,y:33544;n:type:ShaderForge.SFN_NormalVector,id:96,x:32977,y:33688,pt:False;n:type:ShaderForge.SFN_Dot,id:97,x:32790,y:33610,dt:0|A-95-OUT,B-96-OUT;n:type:ShaderForge.SFN_LightColor,id:101,x:32789,y:33316;n:type:ShaderForge.SFN_LightAttenuation,id:102,x:32789,y:33453;n:type:ShaderForge.SFN_Multiply,id:104,x:32393,y:33349|A-128-OUT,B-101-RGB,C-102-OUT;n:type:ShaderForge.SFN_Multiply,id:128,x:32889,y:32642|A-68-RGB,B-97-OUT;proporder:8-14-68-76-87;pass:END;sub:END;*/

Shader "Shader Forge/Wood" {
    Properties {
        _Specular ("Specular", 2D) = "white" {}
        _Normal ("Normal", 2D) = "white" {}
        _Texture ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,0.6509804,0.4352941,1)
        _Tile ("Tile", Range(0, 10)) = 3
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Tile;
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
/////// Normals:
                float2 node_143 = i.uv0;
                float3 normalLocal = tex2D(_Normal,TRANSFORM_TEX(node_143.rg, _Normal)).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_84 = (i.uv0.rg*_Tile);
                float4 node_68 = tex2D(_Texture,TRANSFORM_TEX(node_84, _Texture));
                float3 node_96 = i.normalDir;
                float node_97 = dot(lightDirection,node_96);
                float3 finalColor = ((node_68.rgb*node_97)*_LightColor0.rgb*attenuation);
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Tile;
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
/////// Normals:
                float2 node_144 = i.uv0;
                float3 normalLocal = tex2D(_Normal,TRANSFORM_TEX(node_144.rg, _Normal)).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_84 = (i.uv0.rg*_Tile);
                float4 node_68 = tex2D(_Texture,TRANSFORM_TEX(node_84, _Texture));
                float3 node_96 = i.normalDir;
                float node_97 = dot(lightDirection,node_96);
                float3 finalColor = ((node_68.rgb*node_97)*_LightColor0.rgb*attenuation);
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

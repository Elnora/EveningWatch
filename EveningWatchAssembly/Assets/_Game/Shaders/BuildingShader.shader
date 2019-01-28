// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32719,y:32712|emission-197-OUT,custl-2-RGB;n:type:ShaderForge.SFN_Tex2d,id:2,x:33500,y:32697,ptlb:node_2,ptin:_node_2,tex:3613a30782e21604c84759e938588486,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7,x:33567,y:32858,ptlb:node_7,ptin:_node_7,tex:3c7e341a8ab91f3459f0ba30aa47be95,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:8,x:33328,y:33260;n:type:ShaderForge.SFN_Multiply,id:9,x:33249,y:32795|A-7-RGB,B-100-OUT;n:type:ShaderForge.SFN_Append,id:15,x:32985,y:33118;n:type:ShaderForge.SFN_ValueProperty,id:19,x:33496,y:33389,ptlb:node_19,ptin:_node_19,glob:False,v1:0.4;n:type:ShaderForge.SFN_Slider,id:100,x:33447,y:33062,ptlb:node_100,ptin:_node_100,min:0,cur:0,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:113,x:32967,y:32675,ptlb:node_113,ptin:_node_113,on:False;n:type:ShaderForge.SFN_NormalVector,id:181,x:34000,y:32698,pt:False;n:type:ShaderForge.SFN_ViewVector,id:182,x:33989,y:32316;n:type:ShaderForge.SFN_Multiply,id:183,x:33500,y:32543|A-196-RGB,B-188-OUT;n:type:ShaderForge.SFN_Dot,id:188,x:33804,y:32628,dt:0|A-189-OUT,B-181-OUT;n:type:ShaderForge.SFN_LightVector,id:189,x:34000,y:32544;n:type:ShaderForge.SFN_NormalVector,id:191,x:34300,y:33075,pt:False;n:type:ShaderForge.SFN_ViewVector,id:193,x:34300,y:32850;n:type:ShaderForge.SFN_Dot,id:195,x:34069,y:32953,dt:0|A-193-OUT,B-191-OUT;n:type:ShaderForge.SFN_Tex2d,id:196,x:33791,y:32420,ptlb:node_196,ptin:_node_196,tex:271f5ee3273dd7f4fae6e204d4f8c4bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:197,x:33217,y:32576|A-9-OUT,B-183-OUT;n:type:ShaderForge.SFN_ValueProperty,id:198,x:33379,y:32490,ptlb:node_198,ptin:_node_198,glob:False,v1:1.25;proporder:2-7-19-100-113-196;pass:END;sub:END;*/

Shader "Shader Forge/BuildingShader" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_7 ("node_7", 2D) = "white" {}
        _node_19 ("node_19", Float ) = 0.4
        _node_100 ("node_100", Range(0, 1)) = 0
        [MaterialToggle] _node_113 ("node_113", Float ) = 0
        _node_196 ("node_196", 2D) = "white" {}
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
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_7; uniform float4 _node_7_ST;
            uniform float _node_100;
            uniform sampler2D _node_196; uniform float4 _node_196_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float2 node_202 = i.uv0;
                float4 node_7 = tex2D(_node_7,TRANSFORM_TEX(node_202.rg, _node_7));
                float3 node_9 = (node_7.rgb*_node_100);
                float3 emissive = (node_9*(tex2D(_node_196,TRANSFORM_TEX(node_202.rg, _node_196)).rgb*dot(lightDirection,i.normalDir)));
                float3 finalColor = emissive + tex2D(_node_2,TRANSFORM_TEX(node_202.rg, _node_2)).rgb;
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
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_7; uniform float4 _node_7_ST;
            uniform float _node_100;
            uniform sampler2D _node_196; uniform float4 _node_196_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float2 node_203 = i.uv0;
                float3 finalColor = tex2D(_node_2,TRANSFORM_TEX(node_203.rg, _node_2)).rgb;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

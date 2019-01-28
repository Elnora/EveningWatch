// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32328,y:33071|diff-23-OUT,spec-59-OUT,gloss-71-OUT,normal-174-RGB,amdfl-111-OUT,amspl-207-OUT,olwid-588-OUT,olcol-608-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:8,x:32832,y:32769,ptlb:normal,ptin:_normal,glob:False,tex:592385f9fedce4844b680655538e8875;n:type:ShaderForge.SFN_Add,id:23,x:34497,y:32100|A-25-OUT,B-27-OUT;n:type:ShaderForge.SFN_Multiply,id:25,x:35216,y:32055|A-31-RGB,B-35-RGB;n:type:ShaderForge.SFN_Multiply,id:27,x:34800,y:32242|A-29-OUT,B-44-OUT;n:type:ShaderForge.SFN_Multiply,id:29,x:35018,y:32180|A-25-OUT,B-37-OUT;n:type:ShaderForge.SFN_Tex2d,id:31,x:35502,y:31984,tex:cf46abd480da9e54693e4ae08f490469,ntxv:0,isnm:False|TEX-95-TEX;n:type:ShaderForge.SFN_Color,id:35,x:35502,y:32180,ptlb:Diffuse Color,ptin:_DiffuseColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Fresnel,id:37,x:35216,y:32255|EXP-42-OUT;n:type:ShaderForge.SFN_Slider,id:42,x:35424,y:32373,ptlb:Diffuse Fresnel,ptin:_DiffuseFresnel,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:44,x:35018,y:32375|A-42-OUT,B-47-OUT;n:type:ShaderForge.SFN_Vector1,id:47,x:35233,y:32431,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:59,x:34383,y:32764|A-61-OUT,B-67-OUT;n:type:ShaderForge.SFN_Multiply,id:61,x:35237,y:32803|A-63-RGB,B-78-OUT;n:type:ShaderForge.SFN_Color,id:63,x:35623,y:32827,ptlb:Specular Color,ptin:_SpecularColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Fresnel,id:67,x:34702,y:32858|EXP-69-OUT;n:type:ShaderForge.SFN_Slider,id:69,x:34903,y:32869,ptlb:Specular Fresnel,ptin:_SpecularFresnel,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:71,x:34489,y:32924|A-67-OUT,B-72-OUT;n:type:ShaderForge.SFN_Multiply,id:72,x:35042,y:32988|A-31-A,B-75-OUT;n:type:ShaderForge.SFN_Multiply,id:73,x:35042,y:33133|A-31-A,B-63-A;n:type:ShaderForge.SFN_Multiply,id:74,x:35042,y:33277|A-63-RGB,B-78-OUT;n:type:ShaderForge.SFN_Multiply,id:75,x:35402,y:33042|A-63-A,B-76-OUT;n:type:ShaderForge.SFN_Vector1,id:76,x:35682,y:33096,v1:1.5;n:type:ShaderForge.SFN_Vector1,id:78,x:35663,y:33346,v1:0.5;n:type:ShaderForge.SFN_Tex2dAsset,id:95,x:35683,y:32020,ptlb:fuseMap Gloss,ptin:_fuseMapGloss,glob:False,tex:cf46abd480da9e54693e4ae08f490469;n:type:ShaderForge.SFN_Lerp,id:111,x:32984,y:33267|A-113-RGB,B-116-OUT,T-123-OUT;n:type:ShaderForge.SFN_AmbientLight,id:113,x:33240,y:33118;n:type:ShaderForge.SFN_Multiply,id:116,x:33336,y:33255|A-118-OUT,B-120-OUT;n:type:ShaderForge.SFN_Slider,id:118,x:33524,y:33182,ptlb:IBL strengtha,ptin:_IBLstrengtha,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:120,x:33663,y:33313|A-125-OUT,B-135-OUT;n:type:ShaderForge.SFN_Slider,id:123,x:33238,y:33517,ptlb:Ambient vs IBL,ptin:_AmbientvsIBL,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:125,x:33872,y:33119|A-44-OUT,B-127-OUT;n:type:ShaderForge.SFN_Multiply,id:127,x:34054,y:33149|A-37-OUT,B-135-OUT;n:type:ShaderForge.SFN_Multiply,id:135,x:34281,y:33269|A-140-RGB,B-149-OUT;n:type:ShaderForge.SFN_Cubemap,id:140,x:34560,y:33240,ptlb:Diffuse IBL,ptin:_DiffuseIBL,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0|DIR-154-OUT;n:type:ShaderForge.SFN_Multiply,id:149,x:34454,y:33454|A-140-A,B-177-OUT;n:type:ShaderForge.SFN_NormalVector,id:154,x:34758,y:33240,pt:False;n:type:ShaderForge.SFN_Tex2d,id:174,x:32613,y:32810,tex:592385f9fedce4844b680655538e8875,ntxv:3,isnm:True|TEX-8-TEX;n:type:ShaderForge.SFN_Vector1,id:177,x:34719,y:33425,v1:5;n:type:ShaderForge.SFN_Multiply,id:207,x:33060,y:33640|A-67-OUT,B-209-OUT;n:type:ShaderForge.SFN_Multiply,id:209,x:33316,y:33737|A-74-OUT,B-213-OUT;n:type:ShaderForge.SFN_Multiply,id:213,x:33594,y:33793|A-218-RGB,B-219-OUT;n:type:ShaderForge.SFN_Cubemap,id:218,x:34021,y:33804,ptlb:Specular IBL,ptin:_SpecularIBL,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0|DIR-220-OUT,MIP-247-OUT;n:type:ShaderForge.SFN_Multiply,id:219,x:33817,y:33952|A-218-A,B-225-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:220,x:34315,y:33677;n:type:ShaderForge.SFN_Vector1,id:225,x:34066,y:34046,v1:5;n:type:ShaderForge.SFN_Multiply,id:247,x:34288,y:33965|A-248-OUT,B-249-OUT;n:type:ShaderForge.SFN_OneMinus,id:248,x:34474,y:33827|IN-250-OUT;n:type:ShaderForge.SFN_Vector1,id:249,x:34857,y:33940,v1:8;n:type:ShaderForge.SFN_Multiply,id:250,x:34650,y:33819|A-73-OUT,B-249-OUT;n:type:ShaderForge.SFN_ValueProperty,id:481,x:32446,y:34615,ptlb:Max Outline Width,ptin:_MaxOutlineWidth,glob:False,v1:5;n:type:ShaderForge.SFN_Min,id:588,x:32246,y:34400|A-589-OUT,B-481-OUT;n:type:ShaderForge.SFN_Multiply,id:589,x:32446,y:34400|A-594-OUT,B-592-OUT;n:type:ShaderForge.SFN_ValueProperty,id:592,x:32647,y:34615,ptlb:Base Border Wid,ptin:_BaseBorderWid,glob:False,v1:2;n:type:ShaderForge.SFN_Clamp01,id:594,x:32693,y:34374|IN-595-OUT;n:type:ShaderForge.SFN_Divide,id:595,x:32630,y:34053|A-597-OUT,B-596-OUT;n:type:ShaderForge.SFN_ValueProperty,id:596,x:32843,y:34160,ptlb:Max distance,ptin:_Maxdistance,glob:False,v1:800;n:type:ShaderForge.SFN_Subtract,id:597,x:32778,y:33968|A-598-OUT,B-601-NEAR;n:type:ShaderForge.SFN_Distance,id:598,x:33051,y:33964|A-599-XYZ,B-600-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:599,x:33299,y:34023;n:type:ShaderForge.SFN_ViewPosition,id:600,x:33299,y:34164;n:type:ShaderForge.SFN_ProjectionParameters,id:601,x:33051,y:34126;n:type:ShaderForge.SFN_Color,id:608,x:32496,y:33586,ptlb:Outline Color,ptin:_OutlineColor,glob:False,c1:1,c2:1,c3:1,c4:1;proporder:8-35-42-63-69-95-118-123-140-218-481-592-596-608;pass:END;sub:END;*/

Shader "Shader Forge/Outline" {
    Properties {
        _normal ("normal", 2D) = "bump" {}
        _DiffuseColor ("Diffuse Color", Color) = (0.5,0.5,0.5,1)
        _DiffuseFresnel ("Diffuse Fresnel", Range(0, 1)) = 0
        _SpecularColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
        _SpecularFresnel ("Specular Fresnel", Range(0, 1)) = 0
        _fuseMapGloss ("fuseMap Gloss", 2D) = "white" {}
        _IBLstrengtha ("IBL strengtha", Range(0, 1)) = 0
        _AmbientvsIBL ("Ambient vs IBL", Range(0, 1)) = 0
        _DiffuseIBL ("Diffuse IBL", Cube) = "_Skybox" {}
        _SpecularIBL ("Specular IBL", Cube) = "_Skybox" {}
        _MaxOutlineWidth ("Max Outline Width", Float ) = 5
        _BaseBorderWid ("Base Border Wid", Float ) = 2
        _Maxdistance ("Max distance", Float ) = 800
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers d3d11 opengl gles xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float _MaxOutlineWidth;
            uniform float _BaseBorderWid;
            uniform float _Maxdistance;
            uniform float4 _OutlineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*min((saturate(((distance(mul(unity_ObjectToWorld, v.vertex).rgb,_WorldSpaceCameraPos.rgb)-_ProjectionParams.g)/_Maxdistance))*_BaseBorderWid),_MaxOutlineWidth),1));
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
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
            #pragma exclude_renderers d3d11 opengl gles xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform float4 _DiffuseColor;
            uniform float _DiffuseFresnel;
            uniform float4 _SpecularColor;
            uniform float _SpecularFresnel;
            uniform sampler2D _fuseMapGloss; uniform float4 _fuseMapGloss_ST;
            uniform float _IBLstrengtha;
            uniform float _AmbientvsIBL;
            uniform samplerCUBE _DiffuseIBL;
            uniform samplerCUBE _SpecularIBL;
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
                float2 node_657 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(node_657.rg, _normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
///////// Gloss:
                float node_67 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_SpecularFresnel);
                float4 node_31 = tex2D(_fuseMapGloss,TRANSFORM_TEX(node_657.rg, _fuseMapGloss));
                float gloss = (node_67*(node_31.a*(_SpecularColor.a*1.5)));
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_78 = 0.5;
                float node_249 = 8.0;
                float4 node_218 = texCUBElod(_SpecularIBL,float4(viewReflectDirection,((1.0 - ((node_31.a*_SpecularColor.a)*node_249))*node_249)));
                float3 specularColor = ((_SpecularColor.rgb*node_78)*node_67);
                float3 specularAmb = (node_67*((_SpecularColor.rgb*node_78)*(node_218.rgb*(node_218.a*5.0)))) * specularColor;
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor + specularAmb;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float node_44 = (_DiffuseFresnel*0.1);
                float node_37 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_DiffuseFresnel);
                float4 node_140 = texCUBE(_DiffuseIBL,i.normalDir);
                float3 node_135 = (node_140.rgb*(node_140.a*5.0));
                diffuseLight += lerp(UNITY_LIGHTMODEL_AMBIENT.rgb,(_IBLstrengtha*((node_44*(node_37*node_135))+node_135)),_AmbientvsIBL); // Diffuse Ambient Light
                float3 node_25 = (node_31.rgb*_DiffuseColor.rgb);
                finalColor += diffuseLight * (node_25+((node_25*node_37)*node_44));
                finalColor += specular;
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
            #pragma exclude_renderers d3d11 opengl gles xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform sampler2D _normal; uniform float4 _normal_ST;
            uniform float4 _DiffuseColor;
            uniform float _DiffuseFresnel;
            uniform float4 _SpecularColor;
            uniform float _SpecularFresnel;
            uniform sampler2D _fuseMapGloss; uniform float4 _fuseMapGloss_ST;
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
                float2 node_658 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_normal,TRANSFORM_TEX(node_658.rg, _normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float node_67 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_SpecularFresnel);
                float4 node_31 = tex2D(_fuseMapGloss,TRANSFORM_TEX(node_658.rg, _fuseMapGloss));
                float gloss = (node_67*(node_31.a*(_SpecularColor.a*1.5)));
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_78 = 0.5;
                float3 specularColor = ((_SpecularColor.rgb*node_78)*node_67);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float3 node_25 = (node_31.rgb*_DiffuseColor.rgb);
                float node_37 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_DiffuseFresnel);
                float node_44 = (_DiffuseFresnel*0.1);
                finalColor += diffuseLight * (node_25+((node_25*node_37)*node_44));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"
    CustomEditor "ShaderForgeMaterialInspector"
}

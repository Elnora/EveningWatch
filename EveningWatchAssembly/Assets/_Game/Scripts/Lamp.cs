using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Lamp : MonoBehaviour {
	[HideInInspector]
	public bool started;
	public GameObject supremeObject;

	private List<Transform> allChildren;
	[HideInInspector]
	public List<GameObject> textureChange;
//	[HideInInspector]
	public List<GameObject> animated;
	[HideInInspector]
	public List<GameObject> lights;
	[HideInInspector]
	public List<GameObject> alphaChange;

	void Start () 
	{
		if(supremeObject != null)
		{
			allChildren = new List<Transform>(supremeObject.GetComponentsInChildren<Transform>());
			foreach(Transform child in allChildren)
			{
				if(child.CompareTag("TextureChange"))
				{
					textureChange.Add(child.gameObject);
				}
				if(child.CompareTag("AnimationStart"))
				{
					animated.Add(child.gameObject);
				}
				if(child.CompareTag("LightOn"))
				{
					lights.Add(child.gameObject);
				}
				if(child.CompareTag("AlphaChange"))
				{
					alphaChange.Add(child.gameObject);
				}
			}
		}
	}

	void Update () 
	{
		if(started)
		{
			if(textureChange.Count > 0)
			{
				for(int i = 0; i < textureChange.Count; i++)
				{
					textureChange[i].GetComponent<ChangeMatSimon>().start = true;
				}
			}
			if(alphaChange.Count > 0)
			{
				for(int i = 0; i < alphaChange.Count - 1;i++)
				{
					alphaChange[i].GetComponent<ChangeAlphaGlass>().start = true;
				}
			}
			if(lights.Count > 0)
			{
				for(int i = 0; i < lights.Count; i++)
				{
					lights[i].GetComponent<LightsFade>().start = true;
				}
			}
			if(animated.Count > 0)
			{
				for(int i = 0; i < animated.Count; i++)
				{
					if(animated[i].GetComponent<AnimationStart>())
					{
						animated[i].GetComponent<AnimationStart>().start = true;
					}
				}
			}

		}
	}

	void OnDrawGizmos()
	{
		Gizmos.color = Color.yellow;
		Gizmos.DrawSphere (transform.position, 1);
	}
}

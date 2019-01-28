using UnityEngine;
using System.Collections;

public class UvScrollScript : MonoBehaviour {

	public float scrollSpeed = 1;
	public bool scrollX = true;
	public bool scrollY;
	private float offsetX = 0;
	private float offsetY = 0;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if(scrollX)
		{
			offsetX = offsetX + Time.deltaTime * scrollSpeed;
		}
		if(scrollY)
		{
			offsetY = offsetY + Time.deltaTime * scrollSpeed;
		}
		GetComponent<Renderer>().material.SetTextureOffset("_MainTex", new Vector2(offsetX, offsetY));
		GetComponent<Renderer>().material.SetTextureOffset("_BumpMap", new Vector2(offsetX, offsetY));

	}
}

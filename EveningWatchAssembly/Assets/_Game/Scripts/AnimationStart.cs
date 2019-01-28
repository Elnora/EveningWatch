using UnityEngine;
using System.Collections;

public class AnimationStart : MonoBehaviour {
	[HideInInspector]
	public bool start;
	private bool started;
	private Animator anim;
	// Use this for initialization
	void Start () {
		anim = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(start && !started)
		{
			anim.SetBool("moving", true);
			started = true;
		}
	}
}

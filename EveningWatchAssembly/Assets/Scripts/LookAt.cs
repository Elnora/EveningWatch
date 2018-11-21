using UnityEngine;
using System.Collections;

public class LookAt : MonoBehaviour {
	public Transform target;
	// Use this for initialization
	void Start () {
		target = GameObject.Find("FPSCamera").transform;
	}
	
	// This complete script can be attached to a camera to make it 
	// continuously point at another object.
	
	// The target variable shows up as a property in the inspector. 
	// Drag another object onto it to make the camera look at it.
	 
	
	// Rotate the camera every frame so it keeps looking at the target 
	void Update() {
		transform.LookAt(2 * transform.position - target.position);
	}
}

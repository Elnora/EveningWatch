using UnityEngine;
using System.Collections;

public class ChangeMatSimon : MonoBehaviour {
	public float duration = 1;
	private GameObject wickStick;
	public KeyCode inputButton = KeyCode.G;
	private GameObject player;
	private float dist;
	public float distance = 20;
	private bool turntOn;
	[HideInInspector]
	public bool start;
	private bool started;
	void Start () 
	{
		player = GameObject.Find("AdvancedPlayer");
		wickStick = GameObject.Find("1WickStick");
	}

	void Update () 
	{
//		if(wickStick.activeSelf)
//		{
//			dist = Vector3.Distance(player.transform.position, this.transform.position);
////			Debug.Log (dist);
//			if(dist < distance)
//			{
//				if(Input.GetKeyDown(inputButton) && !turntOn)
//				{
//					StartCoroutine("Fade");
//				}
//			}
//		}
		if(start && !started)
		{
			StartCoroutine("Fade");
			started = true;
		}

	}

	IEnumerator Fade()
	{
		bool onOff = true;
		float mTime = 0;
		while(onOff)
		{
			if(mTime < 1)
			{
//				Debug.Log ("Test");

				mTime += Time.deltaTime / duration;
				for(int i = 0; i < this.GetComponent<Renderer>().materials.Length; i++)
				{
					this.GetComponent<Renderer>().materials[i].SetFloat("_Blend", Mathf.SmoothStep(0, 1, mTime));
				}
//				this.renderer.material.Lerp(startMat, endMat, mTime);
//				float lerp = Mathf.PingPong (Time.time, duration) / duration;
//				renderer.material.Lerp (startMat, endMat, lerp);
			}
			else
			{
				turntOn = true;
				onOff = false;
				yield break;
			}
			yield return null;
		}
	}
}

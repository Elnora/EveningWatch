using UnityEngine;
using System.Collections;

public class ChangeAlphaGlass : MonoBehaviour {
	public float duration = 1;
	private GameObject wickStick;
	public KeyCode inputButton = KeyCode.F;
	private GameObject player;
	private float dist;
	public float distance = 30;
	private bool turntOn;
	private Color startColor;
	public float endAlpha;
	public bool startOff;
    private CaroPetrol cPetrol;
	[HideInInspector]
	public bool start;
	private bool started;
	void Start () 
	{
        cPetrol = GameObject.FindObjectOfType<CaroPetrol>();
		startColor = this.GetComponent<Renderer>().material.color;
		player = GameObject.Find("AdvancedPlayer");
		wickStick = GameObject.Find("1WickStick");
		if(startOff)
		{
			this.GetComponent<Renderer>().material.color = new Color(startColor.r, startColor.g, startColor.b, 0);
		}
	}
	
	void Update () 
	{
//		if(wickStick.activeSelf)
//		{
//			dist = Vector3.Distance(player.transform.position, this.transform.position);
//			//			Debug.Log (dist);
//			if(dist < distance)
//			{
//				if(Input.GetKeyDown(inputButton) && !turntOn)
//				{
//					StartCoroutine("Fade");
//                    if(cPetrol.petrolium >= cPetrol.petroliumRemove)
//                    {
//                        cPetrol.petrolium -= cPetrol.petroliumRemove;
//                    }
//                    if(cPetrol.petrolium < cPetrol.petroliumRemove)
//                    {
//                        cPetrol.petrolium = 0;
//                    }
//
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
				Debug.Log ("Test");
				
				mTime += Time.deltaTime / duration;
				this.GetComponent<Renderer>().material.SetColor("_Color", new Color(startColor.r,startColor.g,startColor.b, Mathf.SmoothStep(0,endAlpha, mTime)));
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

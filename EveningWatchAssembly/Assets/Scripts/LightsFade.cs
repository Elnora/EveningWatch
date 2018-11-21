using UnityEngine;
using System.Collections;

public class LightsFade : MonoBehaviour {

	[HideInInspector]
	public bool start;
	private bool started;
	public float fadeDuration = 1;
	private Light pLight;
	public float endIntensity;
	// Use this for initialization
	void Start () {
		pLight = GetComponent<Light>();
	}
	
	// Update is called once per frame
	void Update () {
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
				
				mTime += Time.deltaTime / fadeDuration;
				pLight.intensity = Mathf.SmoothStep(0, endIntensity, mTime);
				//				this.renderer.material.Lerp(startMat, endMat, mTime);
				//				float lerp = Mathf.PingPong (Time.time, duration) / duration;
				//				renderer.material.Lerp (startMat, endMat, lerp);
			}
			else
			{

				onOff = false;
				yield break;
			}
			yield return null;
		}
	}
}

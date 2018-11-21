using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LampClick : MonoBehaviour {
	private Lamp closestLamp;
	private Lamp[] allLamps;
	public float clickDistance = 10;
	public KeyCode inputButton = KeyCode.G;
	private float dist;
	private CaroPetrol petrol;
	// Use this for initialization
	void Start () 
	{
		petrol = GetComponent<CaroPetrol>();
		allLamps = GameObject.FindObjectsOfType<Lamp>();
		StartCoroutine("CheckClosest");
	}
	
	// Update is called once per frame
	void Update () 
	{
		dist = Vector3.Distance(transform.position, closestLamp.transform.position);
		//			Debug.Log (dist);
		if(dist < clickDistance)
		{
			if(Input.GetKeyDown(inputButton))
			{
				if(petrol.petrolium >= petrol.petroliumRemove)
				{
					petrol.usePetrol = true;
					closestLamp.started = true;	
				}
			}
		}

	}

	IEnumerator CheckClosest()
	{
		while(true)
		{
			Transform tMin = null;
			float minDist = Mathf.Infinity;
			Vector3 currentPos = transform.position;
			for(int i = 0; i < allLamps.Length; i++)
			{
//				Vector3 lampPos = allLamps[i].transform.position;
//				float distanceSqr = (lampPos - transform.position).sqrMagnitude;
//
//				if (distanceSqr < nearestDistanceSqr) {
//					closestLamp = allLamps[i];
//					nearestDistanceSqr = distanceSqr;
//				}
					float dist = Vector3.Distance(allLamps[i].transform.position, currentPos);
					if (dist < minDist)
					{
						closestLamp = allLamps[i];
						minDist = dist;
					}
			}
			yield return new WaitForSeconds(0.5f);
		}
	}
}

using UnityEngine;
using System.Collections;

public class AudioPlay : MonoBehaviour {

    public AudioSource aSource;
    public float waitTime = 15f;
	void Start () 
    {
        StartCoroutine("WaitAndPlay");
	}
	

    //public void PlaySource(bool delay)
    //{
    //    if (delay) StartCoroutine("WaitTime");
    //    else aSource.Play();
    //}

    IEnumerator WaitAndPlay()
    {
        yield return new WaitForSeconds(waitTime);
        aSource.Play();
    }
}

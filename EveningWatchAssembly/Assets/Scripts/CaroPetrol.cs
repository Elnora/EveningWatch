using UnityEngine;
using System.Collections;

public class CaroPetrol : MonoBehaviour {

    public int petrolium;
    public int maxPetrolium = 100;
    public int petroliumAdd = 20;
    public int petroliumRemove = 20;
    public int startPetroluim = 35;
    public Texture progressBackground;
    public Texture progressForeground;
    public int guiBarWidth = 200;
    public int guiBarHeight = 30;
    public Vector2 guiBarPosition = new Vector3(50, 50);
	public bool usePetrol;
	void Start () 
    {
        
        petrolium = startPetroluim;
	}
	
	void Update () 
    {
	    if(usePetrol)
		{
			usePetrol = false;
			petrolium -= petroliumRemove;
		}
	}

    

    public void OnControllerColliderHit(ControllerColliderHit col)
    {
        if (col.gameObject.CompareTag("Petrolium"))
        {

            if (petrolium >= (maxPetrolium - petroliumAdd))
            {
                petrolium = maxPetrolium;
            }
            if (petrolium < (maxPetrolium - petroliumAdd))
            {
                petrolium += petroliumAdd;
            }
            Destroy(col.gameObject);
        }        
    }

    public void OnGUI()
    {
        GUI.DrawTexture(new Rect(guiBarPosition.x, guiBarPosition.y, guiBarWidth, guiBarHeight), progressBackground);
        GUI.DrawTexture(new Rect(guiBarPosition.x, guiBarPosition.y, guiBarWidth * petrolium / 100, guiBarHeight), progressForeground);
    }



}

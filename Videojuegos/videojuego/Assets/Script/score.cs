/*almacena los puntos*/
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class score : MonoBehaviour
{
    int point;
    // Start is called before the first frame update
    void Start()
    {
        point = 0;
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter2D(Collider2D col){
        point += 1;
        print("Points: "+point);
    }
}

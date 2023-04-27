using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class sinmovement : MonoBehaviour
{
    [SerializeField] float amplitud;
    [SerializeField] float speed;

    float angle;
    Vector3 origin;

    // Start is called before the first frame update
    void Start()
    {
        origin = transform.position;        
    }

    // Update is called once per frame
    void Update()
    {

        transform.position = origin + 
                                        new Vector3(Mathf.Sin(angle) * amplitud,0,0);
        angle += speed * Time.deltaTime;
    }
}

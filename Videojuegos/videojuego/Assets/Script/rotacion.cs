using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rotacion : MonoBehaviour
{
    [SerializeField] float anglelimit;
    [SerializeField] float speed;
    [SerializeField] float ringduration;

    float angle;
    int direction = 1;
    float t = 0.5f;
    bool isRinging = false;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}

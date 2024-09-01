using UnityEngine;

public class CameraController : MonoBehaviour
{
    public Transform target;
    public float heightOffset = 0.0f;
    public float sideOffset = 0.0f;

    void Update()
    {
        Vector3 position = target.position;
        position.y -= heightOffset;
        position.x -= sideOffset;
        transform.position = position;
    }
}
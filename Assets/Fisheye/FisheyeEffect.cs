using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(Camera))]
public class FisheyeEffect : MonoBehaviour
{
    public Shader fisheyeShader;
    public Material fisheyeMaterial;

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (fisheyeShader != null)
        {
            if (fisheyeMaterial == null)
            {
                fisheyeMaterial = new Material(fisheyeShader);
            }
            Graphics.Blit(source, destination, fisheyeMaterial);
        }
        else
        {
            Graphics.Blit(source, destination);
        }
    }
}
using UnityEngine;

public class HorizonEffect : MonoBehaviour
{
    public Material material; // 쉐이더가 적용된 Material
    public int targetLayer; // 변형을 적용할 타겟 레이어

    void Update()
    {
        if (material != null)
        {
            // 화면의 중심 좌표를 얻기
            Vector2 screenCenter = new Vector2(0.5f, 0.5f);

            // 화면 좌표를 월드 좌표로 변환
            Vector3 worldCenter = Camera.main.ScreenToWorldPoint(new Vector3(screenCenter.x * Screen.width, screenCenter.y * Screen.height, Camera.main.nearClipPlane));

            // 화면의 수평 중앙을 지평선으로 설정
            material.SetVector("_Horizon", new Vector4(worldCenter.x, worldCenter.y, worldCenter.z, 0));

            // 오브젝트의 레이어에 따른 플래그 설정
            if (gameObject.layer == targetLayer)
            {
                material.SetFloat("_LayerFlag", 1.0f); // 레이어가 일치하면 효과 적용
            }
            else
            {
                material.SetFloat("_LayerFlag", 0.0f); // 일치하지 않으면 효과 비적용
            }
        }
    }
}
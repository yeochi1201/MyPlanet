using UnityEngine;

public class HorizonEffect : MonoBehaviour
{
    public Material material; // ���̴��� ����� Material
    public int targetLayer; // ������ ������ Ÿ�� ���̾�

    void Update()
    {
        if (material != null)
        {
            // ȭ���� �߽� ��ǥ�� ���
            Vector2 screenCenter = new Vector2(0.5f, 0.5f);

            // ȭ�� ��ǥ�� ���� ��ǥ�� ��ȯ
            Vector3 worldCenter = Camera.main.ScreenToWorldPoint(new Vector3(screenCenter.x * Screen.width, screenCenter.y * Screen.height, Camera.main.nearClipPlane));

            // ȭ���� ���� �߾��� �������� ����
            material.SetVector("_Horizon", new Vector4(worldCenter.x, worldCenter.y, worldCenter.z, 0));

            // ������Ʈ�� ���̾ ���� �÷��� ����
            if (gameObject.layer == targetLayer)
            {
                material.SetFloat("_LayerFlag", 1.0f); // ���̾ ��ġ�ϸ� ȿ�� ����
            }
            else
            {
                material.SetFloat("_LayerFlag", 0.0f); // ��ġ���� ������ ȿ�� ������
            }
        }
    }
}
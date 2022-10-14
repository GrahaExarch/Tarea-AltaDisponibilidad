from django.http import JsonResponse
from rest_framework import status
from rest_framework.views import APIView
from reviews.models import Tipo
from reviews.serializers import TipoSerializer


class GetTiposName(APIView):
    def get(self, request):
        try:
            data = Tipo.objects.all()
        except Exception:
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True, "contenido": TipoSerializer(data, many=True).data},
            status=status.HTTP_200_OK,
        )

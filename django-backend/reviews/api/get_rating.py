from pickle import TRUE

from django.http import JsonResponse
from rest_framework import status
from rest_framework.views import APIView
from reviews.models import Contenido
from reviews.serializers import ContenidoSerializer


class GetRating(APIView):
    def get(self, request):
        print(request.query_params)
        idContenido = request.query_params.get('id')
        try:
            data = Contenido.objects.get(id=idContenido)
        except Exception:
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True, "contenido": ContenidoSerializer(data).data}, status=status.HTTP_200_OK
        )
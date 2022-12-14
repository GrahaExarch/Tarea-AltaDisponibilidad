from django.http import JsonResponse
from rest_framework import status
from rest_framework.views import APIView
from reviews.models import Contenido
from reviews.models import Tipo
from reviews.serializers import ContenidoSerializer


class GetRating(APIView):
    def get(self, request):
        idContenido = request.query_params.get('id')
        try:
            data = Contenido.objects.get(id=idContenido)
        except Exception:
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True, "contenido": ContenidoSerializer(data).data}, status=status.HTTP_200_OK
        )


class GetContents(APIView):
    def get(self, request):
        try:
            data = Contenido.objects.all()
        except Exception:
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True, "contenido": ContenidoSerializer(data, many=True).data},
            status=status.HTTP_200_OK,
        )


class NewContent(APIView):
    def post(self, request):
        try:
            nuevotipo = Tipo.objects.get(id=request.data.get('type'))
            nuevocontenido = Contenido.objects.create(
                nombre=request.data.get('name'),
                idtipo=nuevotipo,
                urlimagen=request.data.get('imgroute'),
                rating=request.data.get('rating'),
                detalle=request.data.get('detail'),
            )
            nuevocontenido.save()
        except Exception as e:
            print(e)
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True},
            status=status.HTTP_200_OK,
        )


class DeleteContent(APIView):
    def delete(self, request):
        try:
            idContenido = request.data.get('id')
            borrarcontenido = Contenido.objects.get(id=idContenido)
            borrarcontenido.delete()
        except Exception as e:
            print(e)
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True},
            status=status.HTTP_200_OK,
        )


class UpdateContent(APIView):
    def put(self, request):
        try:
            idContenido = request.data.get('id')
            updatecontenido = Contenido.objects.get(id=idContenido)
            tipo = Tipo.objects.get(id=request.data.get('type'))
            updatecontenido.nombre = request.data.get('name')
            updatecontenido.idtipo = tipo
            updatecontenido.urlimagen = request.data.get('imgroute')
            updatecontenido.rating = request.data.get('rating')
            updatecontenido.detalle = request.data.get('detail')
            updatecontenido.save()
        except Exception as e:
            print(e)
            return JsonResponse({"status": False}, status=status.HTTP_200_OK)
        return JsonResponse(
            {"status": True},
            status=status.HTTP_200_OK,
        )

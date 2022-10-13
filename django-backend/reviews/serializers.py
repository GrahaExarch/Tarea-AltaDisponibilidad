from rest_framework.serializers import ModelSerializer
from reviews.models import Contenido
from reviews.models import Tipo


class ContenidoSerializer(ModelSerializer):
    class Meta:
        model = Contenido
        fields = '__all__'


class TipoSerializer(ModelSerializer):
    class Meta:
        model = Tipo
        fields = '__all__'

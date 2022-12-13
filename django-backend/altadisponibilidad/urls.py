"""altadisponibilidad URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from reviews.api import DeleteContent
from reviews.api import GetContents
from reviews.api import GetRating
from reviews.api import GetTiposName
from reviews.api import NewContent
from reviews.api import NewTipo
from reviews.api import UpdateContent

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/rating/get', GetRating.as_view()),
    path('api/lista', GetContents.as_view()),
    path('api/tipos', GetTiposName.as_view()),
    path('api/nuevotipo', NewTipo.as_view()),
    path('api/nuevocontenido', NewContent.as_view()),
    path('api/actualizar', UpdateContent.as_view()),
    path('api/borrar', DeleteContent.as_view()),
]

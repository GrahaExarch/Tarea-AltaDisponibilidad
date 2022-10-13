# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Contenido(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    idtipo = models.ForeignKey('Tipo', models.DO_NOTHING, db_column='idtipo')
    urlimagen = models.CharField(max_length=200, blank=True, null=True)
    rating = models.FloatField(blank=True, null=True)
    detalle = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'contenido'


class Tipo(models.Model):
    nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'tipo'

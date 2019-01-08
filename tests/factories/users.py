import factory
from django.contrib.auth import get_user_model
from faker import Factory as FakerFactory
from pytest_factoryboy import register

faker = FakerFactory.create()


@register
class UserFactory(factory.django.DjangoModelFactory):
    """User factory."""
    username = factory.LazyAttribute(lambda x: faker.name())

    class Meta:
        model = get_user_model()
        django_get_or_create = ('username',)

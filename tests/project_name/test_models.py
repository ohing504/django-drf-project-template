import pytest

from tests.factories.users import UserFactory


@pytest.mark.django_db
def test_factory_fixture():
    user = UserFactory(username="Charles Dickens")
    assert user.username == "Charles Dickens"

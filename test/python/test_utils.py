from app.python.utils import get_datetime


def test_get_datetime():
    assert isinstance(get_datetime(), str)

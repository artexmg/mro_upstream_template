from datetime import datetime
from transform_utils.common import date_to_str


def test_demo():
        
    start_dt = datetime.strptime("2020-11-20", "%Y-%m-%d")
    current_value = date_to_str(start_dt, format="short")
    expected_value = "2020-11-20"
    
    assert expected_value == current_value

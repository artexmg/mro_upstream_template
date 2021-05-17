from unittest import TestCase
from datetime import datetime
from transform_utils.common import date_to_str


class DemoTest(TestCase):
    
    def test_demo(self):
        
        start_dt = datetime.strptime("2020-11-20", "%Y-%m-%d")
        current_value = date_to_str(start_dt, format="short")
        expected_value = "2020-11-20"

        self.assertEqual(expected_value, current_value)

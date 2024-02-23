"""This module contains tests for the BasicBuilder class."""
import unittest
from basic.payload import builder 

class TestBuilder(unittest.TestCase):
    """Tests for Builder Class"""
    def setUp(self):
        """Set up resources."""
        pass

    def tearDown(self):
        """Clean up resources."""
        pass

    def testEncode(self):
        """Test that encoding and decoding."""
        n = "fred"
        g = "dogs"
        t = "hello"

        b = builder.BasicBuilder()
        r = b.encode(n,g,t)
        print(f"encoded: {r}")

        parts = b.decode(r)

        self.assertEqual(n,parts[0])
        self.assertEqual(g,parts[1])
        self.assertEqual(t,parts[2])

if __name__ == '__main__':
    unittest.main()
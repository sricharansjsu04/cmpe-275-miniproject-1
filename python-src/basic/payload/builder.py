"""Module for building and parsing messages."""

class BasicBuilder:
    """Handles encoding and decoding of messages."""

    def encode(self, name, group, text):
        """Encode the given name, group, and text into a single string."""
        payload = (f"{group},{name},{text}") 
        return (f"{len(payload):04d},{payload}")
    

    def decode(self, message):
        """Decode the given message string into its components."""
        parts = message.split(",", 4)
        if len(parts) != 4:
            raise ValueError(f"message format error: {message}")
        else:
            return parts[2],parts[1],parts[3] 

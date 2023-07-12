"""Chatbot model."""
import os
import openai

openai.api_type = os.getenv("OPENAI_API_TYPE") 
openai.api_version = os.getenv("OPENAI_API_VERSION")
openai.api_base = os.getenv("OPENAI_API_ENDPOINT")
openai.api_key = os.getenv("OPENAI_API_KEY")
MODEL_NAME = os.getenv("OPENAI_COMPLETIONS_ENGINE")

conversation = [{
    "role": "system",
    "content": "Eres un asistente para una empresa llamada The Cocktail."
    }]

class Chat():
    """A class for our chatbot."""
    def conversate(self,query: str = None):
        """Generate a response to a user-inputted query."""
        if query is None or len(query) == 0:
            return "Lo siento, no te he entendido. ¿Podrías repetirlo?"
        user_input = query
        conversation.append(
            {"role": "assistant", "content": "Muy buenas cocktelero, ¿en qué puedo ayudarte"},
            {"role": "user", "content": user_input}
            )

        response = openai.ChatCompletion.create(
            engine = MODEL_NAME,
            messages = conversation
        )

        generated_text = response.choices[0]['message']['content']
        conversation.append({"role": "assistant", "content": generated_text})

        return generated_text

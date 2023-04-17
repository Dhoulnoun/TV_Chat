package camix.service;

import camix.communication.ProtocoleChat;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.io.IOException;

public class ServiceChatTestExo2Mockito {

    private ClientChat clientChat;

    @BeforeEach
    public void setUp() {
        this.clientChat = Mockito.mock(ClientChat.class);
    }

    @Test
    public void informeDepartClientTest() throws IOException {
        String test = "test";
        // Configure le mock lors de l'appelle a donneSurnom
        Mockito.when(
                this.clientChat.donneSurnom()
        ).thenReturn(
                test
        );

        String message = String.format(ProtocoleChat.MESSAGE_DEPART_CHAT, test);

        // Confiuration lors de l'envoie du message et pour ne rien en faire
        Mockito.doNothing().when(this.clientChat).envoieContacts(message);

        // Création d'un service de chat et la méthode "informeDepartClient" est appelée avec le client fictif
        ServiceChat serviceChat = new ServiceChat("test_service", 1234);
        serviceChat.informeDepartClient(this.clientChat);
        //Vérification du surnom donné
        Mockito.verify(clientChat, Mockito.times(1)).donneSurnom();
        //appel une seule fois la méthode
        Mockito.verify(clientChat, Mockito.times(1)).envoieContacts(message);
    }
}
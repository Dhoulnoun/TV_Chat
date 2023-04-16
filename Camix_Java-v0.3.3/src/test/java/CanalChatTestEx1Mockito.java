import camix.service.CanalChat;
import camix.service.ClientChat;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class CanalChatTestEx1Mockito {
    private ClientChat clientChatMock;

    private CanalChat canalChat;

    @BeforeEach
    public void setUp() {
        this.clientChatMock = Mockito.mock(ClientChat.class);
    }

    @Test
    public void testAjouteClient()
    {
        final String message = "Canal chat ajoute client : ";


        final CanalChat canalChat = new CanalChat("Canal chat 1");

        Mockito.when(this.clientChatMock.donneId()).thenReturn("Client chat 1");

        try {
            canalChat.ajouteClient(this.clientChatMock);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void testAjouteClient_non_present_v2(){
        String id = "id_client";

        Mockito.when(this.clientChatMock.donneId()).thenReturn(id);

        canalChat.ajouteClient(this.clientChatMock);

        canalChat.ajouteClient(this.clientChatMock);

        Assertions.assertTrue(canalChat.estPresent(this.clientChatMock));
        Assertions.assertEquals(1, canalChat.donneNombreClients());

        Mockito.verify(clientChatMock, Mockito.times(3)).donneId();
        Mockito.verifyNoMoreInteractions(clientChatMock);
    }
    public void testAjouteClient_present_v2(){
        String id = "id_client";

        Mockito.when(this.clientChatMock.donneId()).thenReturn(id);

        canalChat.ajouteClient(this.clientChatMock);

        canalChat.ajouteClient(this.clientChatMock);

        Assertions.assertTrue(canalChat.estPresent(this.clientChatMock));
        Assertions.assertEquals(1, canalChat.donneNombreClients());

        Mockito.verify(clientChatMock, Mockito.times(3)).donneId();
        Mockito.verifyNoMoreInteractions(clientChatMock);
    }



}

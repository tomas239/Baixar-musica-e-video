package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 🚀 VideoServlet - Permite baixar vídeos do YouTube de forma rápida e fácil.
 * 📅 Criado em: Fevereiro de 2025
 * 📜 Copyright © 2025 SeuNome. Todos os direitos reservados.
 * ✅ Este código pode ser usado livremente, mas sempre dê créditos ao criador.
 */

@WebServlet("/Baixar")
public class VideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Obtém o parâmetro 'videoUrl' enviado pelo formulário
        String videoUrl = request.getParameter("videoUrl");

        // Verifica se o campo está vazio
        if (videoUrl == null || videoUrl.trim().isEmpty()) {
            response.sendRedirect("erro.jsp?msg=URL do vídeo não pode estar vazia.");
            return;
        }

        // Extrai o ID do vídeo do YouTube
        String videoId = extractYouTubeId(videoUrl);
        if (videoId == null) {
            response.sendRedirect("erro.jsp?msg=URL inválida. Use um link válido do YouTube.");
            return;
        }

        // Cria o link de download via SaveFrom.net
        String downloadUrl = "https://en.savefrom.net/18/" + videoUrl;

        // Redireciona o usuário para a página de download
        response.sendRedirect(downloadUrl);
    }

    /**
     * Método para extrair o ID do vídeo do YouTube a partir de diferentes formatos de URL.
     */
    private String extractYouTubeId(String url) {
        try {
            if (url.contains("youtu.be/")) {
                return url.split("youtu.be/")[1].split("\\?")[0];
            } else if (url.contains("youtube.com/watch?v=")) {
                return url.split("v=")[1].split("&")[0];
            } else if (url.contains("youtube.com/embed/")) {
                return url.split("embed/")[1].split("\\?")[0];
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}

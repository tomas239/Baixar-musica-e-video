<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Baixe vídeos do YouTube de forma rápida, segura e gratuita! Sem necessidade de instalação. Insira a URL do vídeo e comece o download agora mesmo.">
    <meta name="keywords" content="baixar vídeos do YouTube, download de vídeos, YouTube downloader, baixar vídeo online grátis, converter vídeo YouTube">
    <meta name="author" content="SeuNome">
    <title>Baixar Vídeos do YouTube | Rápido, Seguro e Grátis</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f8f9fa;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        .container {
            background: white;
            padding: 20px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #218838;
        }
        .info {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }
        #thumbnail {
            width: 100%;
            max-width: 400px;
            display: none;
            margin: 10px auto;
            border-radius: 8px;
        }
    </style>
    
    <script>
        function mostrarThumbnail() {
            let url = document.getElementById("videoUrl").value;
            let videoId = extrairIdVideo(url);
            
            if (videoId) {
                document.getElementById("thumbnail").src = "https://img.youtube.com/vi/" + videoId + "/hqdefault.jpg";
                document.getElementById("thumbnail").style.display = "block";
            } else {
                document.getElementById("thumbnail").style.display = "none";
            }
        }

        function extrairIdVideo(url) {
            let match = url.match(/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/);
            return match ? match[1] : null;
        }
    </script>
</head>
<body>

    <div class="container">
        <h2>Baixar Vídeo do YouTube</h2>
        <p>Baixe vídeos do YouTube com alta qualidade e rapidez. Sem necessidade de instalação, basta inserir a URL e iniciar o download.</p>
        
        <form action="Baixar" method="post">
            <input type="text" id="videoUrl" name="videoUrl" placeholder="Cole a URL do YouTube aqui..." required oninput="mostrarThumbnail()">
            <img id="thumbnail" alt="Thumbnail do vídeo">
            <button type="submit">Baixar Agora</button>
        </form>
        
        <p class="info">
            Este serviço é gratuito e seguro, sem necessidade de instalação ou cadastro. 
            Suporte para vídeos em diferentes resoluções e formatos.<br>
            <strong>Copyright © 2025 TCBBR.</strong> Todos os direitos reservados.
        </p>
    </div>

</body>
</html>

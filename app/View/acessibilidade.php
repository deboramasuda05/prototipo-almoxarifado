<style>
    /* Container principal no canto inferior */
    #wrapper-ace-clean {
        position: fixed !important;
        bottom: 20px !important;
        right: 20px !important;
        z-index: 9999999 !important;
        display: flex !important;
        flex-direction: column-reverse !important; /* Botões aparecem para cima */
        align-items: center !important;
        gap: 12px !important;
    }

    /* Botão do Bonequinho */
    #btn-ativador {
        width: 60px !important;
        height: 60px !important;
        background: #0056b3 !important;
        border-radius: 50% !important;
        border: 2px solid #fff !important;
        cursor: pointer !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3) !important;
    }

    /* Grupo de botões que fica escondido */
    #grupo-botoes-ace {
        display: none; /* Inicia escondido */
        flex-direction: column !important;
        gap: 10px !important;
    }

    /* Estilo dos botões A+, A- e Contraste */
    .btn-ace-acao {
        width: 45px !important;
        height: 45px !important;
        background: #fff !important;
        border: 2px solid #0056b3 !important;
        border-radius: 50% !important;
        cursor: pointer !important;
        font-weight: bold !important;
        color: #0056b3 !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2) !important;
    }

    /* Ajustes para o Alto Contraste */
    body.alto-contraste { background-color: #000 !important; color: #ffff00 !important; }
    body.alto-contraste .card, body.alto-contraste table, body.alto-contraste .navbar { 
        background-color: #000 !important; color: #ffff00 !important; border: 1px solid #ffff00 !important; 
    }
</style>

<div id="wrapper-ace-clean">
    <button id="btn-ativador" onclick="toggleBotoes()">
        <svg width="30" height="30" viewBox="0 0 24 24" fill="white">
            <path d="M12 2C13.1 2 14 2.9 14 4C14 5.1 13.1 6 12 6C10.9 6 10 5.1 10 4C10 2.9 10.9 2 12 2M21 9H15V22H13V16H11V22H9V9H3V7H21V9Z"/>
        </svg>
    </button>

    <div id="grupo-botoes-ace">
        <button class="btn-ace-acao" onclick="ajustarFonte('mais')" title="Aumentar Texto">A+</button>
        <button class="btn-ace-acao" onclick="ajustarFonte('menos')" title="Diminuir Texto">A-</button>
        <button class="btn-ace-acao" onclick="toggleContraste()" title="Contraste">🌓</button>
        </div>
</div>

<div vw class="enabled"><div vw-access-button class="active"></div><div vw-plugin-wrapper></div></div>

<script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
<script>
    new window.VLibras.Widget('https://vlibras.gov.br/app');

    function toggleBotoes() {
        const g = document.getElementById('grupo-botoes-ace');
        g.style.display = (g.style.display === 'flex') ? 'none' : 'flex';
    }

    let p = 100;
    function ajustarFonte(t) {
        if(t==='mais' && p<150) p+=10;
        if(t==='menos' && p>80) p-=10;
        document.body.style.fontSize = p + '%';
    }

    function toggleContraste() {
        document.body.classList.toggle('alto-contraste');
        localStorage.setItem('c_ativo', document.body.classList.contains('alto-contraste'));
    }

    if(localStorage.getItem('c_ativo') === 'true') document.body.classList.add('alto-contraste');
</script>
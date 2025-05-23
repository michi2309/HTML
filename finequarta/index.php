<!DOCTYPE html>
<html class="main" data-bs-theme="light">
<head>
    <meta charset="UTF-8">
    <title>MikeCSTMS - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="blocco.css">
    <link rel="icon" type="image/x-icon" href="./icona.ico">
</head>
<body>
    <div class="container">
        <p class="titolo">MikeCSTMS</p>
        <p class="sottotitolo">Database che raccoglie spunti, appunti e riflessioni su modelli in stirene, spaziando dai blindati agli aerei, dai carri armati ai vascelli storici. Ogni scheda è frutto di lavoro, passione e ricerca, con un’attenzione particolare alla resa realistica e alla coerenza storica del mezzo riprodotto. Ogni modello è accompagnato da una foto d'archivio reale a cui si ispira, permettendo un confronto diretto tra il kit finito e il mezzo originale. Insieme alla descrizione, si trovano considerazioni tecniche, difficoltà incontrate in fase di montaggio, note sulla qualità del kit e impressioni personali sul risultato finale. L’obiettivo non è solo documentare, ma anche offrire spunti utili ad altri modellisti: che si tratti di scegliere un nuovo kit, capire quali miglioramenti apportare o semplicemente trovare ispirazione per un nuovo progetto.</p>
        <p class="sottotitolo">Ogni modello racconta una storia – e ogni pagina è un piccolo contributo alla memoria storica, attraverso la lente del modellismo.</p>
        <p class="sottotitolo"><a href='inserimento.php'>Puoi contribuire al database pubblico caricando i tuoi progetti</a> o <a href='https://www.paypal.com/paypalme/m1ki2309'>donando</a></p>
<?php
    $db_host = "localhost";
    $db_user = "root";
    $db_password = "root";
    $db_name = "modellismo";

    $myconn = new mysqli($db_host, $db_user, $db_password, $db_name);
    if ($myconn->connect_errno) {
        echo "<p>Failed to connect to MySQL: $myconn->connect_error</p>";
        exit();
    }
?>
        <h3 class="sottotitolo">Ultimi modelli inseriti</h3>
        <div class="card-container">
<?php
    // Query per gli ultimi modelli inseriti
    $mia_query = "SELECT id, nome, immagine1 FROM modello ORDER BY id DESC LIMIT 3";
    $result = $myconn->query($mia_query);
    if ($result && $result->num_rows > 0) {
        while ($resrow = $result->fetch_row()) {
            $id = $resrow[0];
            $nome = $resrow[1];
            $foto = $resrow[2];
            echo '<div class="card">';
            echo "<a href='modello.php?id=$id'>";
            echo "<img src='assets/$foto' alt='$nome'>";
            echo "<h3>$nome</h3>";
            echo "</a>";
            echo "</div>";
        }
    } else {
        echo "<p>Nessun modello trovato.</p>";
    }
    $result->free_result();
    $myconn->close();
?>
        </div>
        <p></p>
        <p></p>
        <p></p>
                <h3 class="sottotitolo">Naviga tutti i modelli</h3>
        <div class="card-container">
<?php
    $myconn = new mysqli($db_host, $db_user, $db_password, $db_name);
    if ($myconn->connect_errno) {
        echo "<p>Failed to connect to MySQL: $myconn->connect_error</p>";
        exit();
    }
    // Recupera tutte le categorie
    $categorie = [];
    $res = $myconn->query("SELECT id, nome FROM categoria");
    while ($row = $res->fetch_assoc()) {
        $categorie[] = $row;
    }
    $res->free();

    // Categoria selezionata
    $categoria_scelta = isset($_GET['categoria']) ? intval($_GET['categoria']) : 0;

    // Menu a tendina categorie
    echo '<form method="GET" action="index.php" class="mb-4">';
    echo '<label for="categoria" class="form-label">Filtra per categoria:</label> ';
    echo '<select name="categoria" id="categoria" class="form-select w-auto d-inline" onchange="this.form.submit()">';
    echo '<option value="0">Tutte le categorie</option>';
    foreach ($categorie as $cat) {
        $selected = ($cat['id'] == $categoria_scelta) ? 'selected' : '';
        echo "<option value=\"{$cat['id']}\" $selected>{$cat['nome']}</option>";
    }
    echo '</select>';
    echo '</form>';

    // Query modelli in base alla categoria scelta
    if ($categoria_scelta > 0) {
        $mia_query = "SELECT m.id, m.nome, m.immagine1
                      FROM modello m
                      JOIN catalogo c ON m.id = c.id_modello
                      WHERE c.id_categoria = $categoria_scelta";
    } else {
        $mia_query = "SELECT id, nome, immagine1 FROM modello";
    }

    $result = $myconn->query($mia_query);
    if ($result && $result->num_rows > 0) {
        echo '<div class="card-container">';
        while ($resrow = $result->fetch_row()) {
            $id = $resrow[0];
            $nome = $resrow[1];
            $foto = $resrow[2];
            echo '<div class="card">';
            echo "<a href='modello.php?id=$id'>";
            echo "<img src='assets/$foto' alt='$nome'>";
            echo "<h3>$nome</h3>";
            echo "</a>";
            echo "</div>";
        }
        echo '</div>';
    } else {
        echo "<p>Nessun modello trovato per questa categoria.</p>";
    }
    $result->free_result();
    $myconn->close();
?>
        </div>
    </div>
</body>
</html>
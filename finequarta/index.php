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
<p class="sottotitolo">Database che raccoglie spunti, appunti e riflessioni su modelli in stirene, spaziando dai blindati agli aerei, dai carri armati ai vascelli storici. Ogni scheda è frutto di lavoro, passione e ricerca, con un’attenzione particolare alla resa realistica e alla coerenza storica del mezzo riprodotto. Ogni modello è accompagnato da una foto d'archivio reale a cui si ispira, permettendo un confronto diretto tra il kit finito e il mezzo originale. Insieme alla descrizione, si trovano considerazioni tecniche, difficoltà incontrate in fase di montaggio, note sulla qualità del kit e impressioni personali sul risultato finale. L’obiettivo non è solo documentare, ma anche offrire spunti utili ad altri modellisti: che si tratti di scegliere un nuovo kit, capire quali miglioramenti apportare o semplicemente trovare ispirazione per un nuovo progetto.</p> <p class="sottotitolo"> Ogni modello racconta una storia – e ogni pagina è un piccolo contributo alla memoria storica, attraverso la lente del modellismo.</p>
<?php
    $db_host = "localhost"; // stesso host nel quale sta girando l’applicazione php
    $db_user = "root"; 
    $db_password = "root"; 
    $db_name = "modellismo"; //il nome del database interessato

        $myconn = new mysqli($db_host, $db_user, $db_password, $db_name); // eseguo la connessione
                if ($myconn -> connect_errno) { // controllo la connessione
                    echo "<p>Failed to connect to MySQL: $myconn->connect_error</p>";
                    exit();
                }else{                    
                        //* 1) scrivo/preparo una query sql
                    $mia_query = "SELECT id, nome, immagine1 FROM modello"; //mi prendo quello che mi interessa dal database               
                        //* 2) eseguo la query
                    $result = $myconn->query($mia_query); //metodo per eseguire la query
                        //* 3) controllo di quante righe è costituita la query
                    $numrows = $result->num_rows; // conto le righe trovate
                        //* 4) controllo che la tabella non sia vuota\nulla
                    if ($result) { // eseguo la query
                        echo '<div class="card-container">'; // apro una sola volta il div per la card-container
                        for ($i=0; $i<$numrows; $i++){ // ciclo for che ripete per il numero di occorrenze trovate
                            $resrow = $result->fetch_row(); // recupero un record alla volta dalla tabella restituita dalla query

                            $id = $resrow[0]; //* il record è trattato come un array, ogni colonna ha l’indice corrispondente, questo è l'ID
                            $nome = $resrow[1];
                            $foto = $resrow[2];
                            echo '<div class="card">';
                            echo "<a href='modello.php?id=$id'>";
                            echo "<img src='assets/$foto' alt='$nome'>";
                            echo "<h3>$nome</h3>";
                            echo "</a>";
                            echo "</div>";    
                        }
                                    echo '</div>'; // chiudo il div per la card-container
                    }
                    $result -> free_result(); // libero la memoria, cosa buona da fare quando si termina
                    
                }
                $myconn -> close(); // chiudo la connessione
    ?>
        </div>
</body>
</html>

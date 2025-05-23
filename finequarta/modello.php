<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MikeCSTMS</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
                    <?php
                    $db_host = "localhost"; // stesso host nel quale sta girando l’applicazione php
                    $db_user = "root"; 
                    $db_password = "root"; 
                    $db_name = "modellismo"; //il nome del database interessato

                $id_modello = isset($_GET['id']) ? intval($_GET['id']) : 0;

                $myconn = new mysqli($db_host, $db_user, $db_password, $db_name);
                if ($myconn->connect_errno) {
                    echo "<p>Failed to connect to MySQL: $myconn->connect_error</p>";
                    exit();
                } else {
                    //* 1) scrivo/preparo una query sql SOLO per l'id richiesto
                    $mia_query = "SELECT id, nome, dati, descrizione, immagine1, immagine2, user FROM modello WHERE id = $id_modello";
                    // echo $mia_query; // opzionale: stampa la query
                
                    //* 2) eseguo la query
                    $result = $myconn->query($mia_query);
                
                    if ($result && $result->num_rows > 0) {
                        $resrow = $result->fetch_row();
                    
                        $id = $resrow[0];
                        $nome = $resrow[1];
                        $dati = $resrow[2];
                        $descrizione = $resrow[3];
                        $modellino = $resrow[4];
                        $storica = $resrow[5];
                        $user = $resrow[6];
                    } else {
                        echo "<p>Modello non trovato.</p>";
                    }
                    $result->free_result();
                }
                $myconn->close();
                    ?>

    <div class="container">
        <?php
        echo "<h1 style='display: flex; align-items: center; justify-content: center; gap: 12px;'>";
        echo "<a href='index.php' style='text-decoration: none; color: inherit; font-size: 2rem; display: flex; align-items: center;' title='Torna alla home'>&larr;</a>";
        echo "<span>$nome</span>";
        echo "</h1>";
        echo "<h2>$dati</h2>";
        ?>
        <div class="image-main">
            <?php
                echo "<img src='./assets/$modellino' >";
            ?>
        </div>

        <div class="content">
            <div class="text">
                <?php
                    echo "<p>$descrizione</p>";
                ?>
                                <?php
                    echo "<p class='mostrautente'>aggiunto da: $user</p>";
                ?>
            </div>
            <div class="image-secondary"><?php
                        echo "<img src='./assets/$storica' >";
                ?>
            </div>
        </div>
            <!--<div class="text">
                <?php
                    echo "<p class='mostrautente'>aggiunto da: $user</p>";
                ?>
            </div>-->
    </div>
    
</body>
</html>
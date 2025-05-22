<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php
function uploadImmagine(){
    // Cartella in cui caricare i file
    $target_dir = "./assets/";
    $target_file = $target_dir . basename($_FILES["fileToUploadOwn"]["name"]); // nome del file
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    // Controllo che si stia caricando un file di tipo immagine
    if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUploadOwn"]["tmp_name"]);
    if($check !== false) {
    echo "Il file è una immagine - " . $check["mime"] . ".";
    $uploadOk = 1;
    } else {
    echo "Il file non è una immagine.";
    $uploadOk = 0;
    }
    }
    // Controlla se c'è già un file con lo stesso nome
    if (file_exists($target_file)) {
    echo "Mi dispiace, il file esiste già.";
    $uploadOk = 0;
    }
    // Controllo la dimensione, che non sia più grande di 500MB
    if ($_FILES["fileToUploadOwn"]["size"] > 500000) {
    echo "Mi dispiace, il file è troppo grande.";
    $uploadOk = 0;
    }
    // Consenti solo alcuni tipi di file
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
    echo "Mi dispiace, sono consentiti solo file JPG, JPEG, PNG e GIF.";
    $uploadOk = 0;
    }
    // Controlla che siano stati superati tutti i controlli
    if ($uploadOk == 0) {
    echo "Mi dispiace, il tuo file non è stato caricato.";
    // Se sono stati superati i controlli si prova a caricare il file
    } else {
    if (move_uploaded_file($_FILES["fileToUploadOwn"]["tmp_name"], $target_file)) {
    echo "Il file ". basename( $_FILES["fileToUploadOwn"]["name"]). " è stato caricato.";
    } else {
    echo "Mi dispiace, c'è stato un problema nel caricamento del file.";
    }
    }
    }
    ?>    
</head>
<body>
    <?php
    $nome_modello = $_POST['nome'];
    $dati_modello = $_POST['dati'];
    $descrizione_modello = $_POST['descrizione'];
    $img1 = basename($_FILES["fileToUploadOwn"]["name"]);

    echo "<p>$nome_modello</p>";
    echo "<p>$dati_modello</p>";
    echo "<p>$descrizione_modello</p>";

    $db_host = "localhost"; // stesso host nel quale sta girando l’applicazione php
    $db_user = "root"; // il vostro utente
    $db_password = "root"; // la vostra password
    $db_name = "modellismo";

    $myconn = new mysqli($db_host, $db_user, $db_password, $db_name); // eseguo la connessione
    if ($myconn -> connect_errno) { // controllo la connessione
        echo "<p>Failed to connect to MySQL: $myconn->connect_error</p>";
        exit();
    }else{
        echo "<p>Connessione eseguita correttamente a MySQL</p>";

        // 1) scrivo/preparo una query sql
        $mia_query = "INSERT INTO modello (nome, dati, descrizione, immagine1) VALUE ('$nome_modello','$dati_modello','$descrizione_modello','$img1')"; // query di inserimento
        echo $mia_query; // stampo a video la mia query

        // 2) eseguo la query
        $result = $myconn->query($mia_query); // metodo per eseguire la query 
        
        if($result){
            echo "<p>Inserimento avvenuto</p>";
            uploadImmagine();
        }else{
            echo "<p>Errore</p>";
        }
    }

    ?>
</body>
</html>
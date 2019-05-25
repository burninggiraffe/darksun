<?php
    include_once("dBug.php");

    if($_REQUEST['action'] == 'test')
    {
        $servername = "localhost";
        $username = "root";
        $password = "";

        // Create connection
        $conn = mysqli_connect($servername, $username, $password);

        // Check connection
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
        $sql = "SELECT * FROM darksun.athas_locations_v2";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // output data of each row
            $result = array();
            echo new dBug($result->num_rows);die;
            while($row = $result->fetch_assoc()) {
                //$result.array_push($row);
                echo json_encode($$row->num_rows);
    
            }
        } else {
            echo "0 results";
        }
        $conn->close();
        exit;
    }

    echo 'false';
    exit;




?>
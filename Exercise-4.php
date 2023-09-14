<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

 

function test($s) {

    $crt_aa = 0;

    $i = 0;

    while ($i < (strlen($s) - 1)) {

        if (substr($s, $i, 2) == "aa") {

            $crt_aa++;  

            $i += 1;

        } else {

            $i++;

        }

    }

    return $crt_aa;

}

echo test("bbaaccaag");echo"<br>";

echo test("jjkiaaasew");echo"<br>";

echo test("JSaaakoiaa");echo"<br>";





?>
</body>
</html>
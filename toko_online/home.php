<?php
include "header.php";
?>
<!DOCTYPE html>
<html class="htmlHome" lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <!-- Custom CSS -->
  <link href="style.css" rel="stylesheet">
  <style>
h1 {
  position : relative;
  left: 1000px;
  top: -254px;
}
</style>
</head>

<body>
  <div class="home">
  
    <!-- <center>
      <h2 style="font-family: selidon; color:black;"  class="h3">Selamat datang <?= $_SESSION['level'] ?> <?= $_SESSION['nama_user'] ?> di NOXEL Shop</h2>
</center> -->

<section id="carousel" style="display: flex; align-items: center">
      <div class="wrapper" style="position: relative; top: -100px; left: 0">
        <div class="carousel d-flex owl-carousel" style="max-width: 1520px">
          <div class="main" style="width: 320px; height: 182px; background-image: url(assets/Background_produk.jpeg); background-size: 320px 182px; margin-left: -100px" href ="produk.php" ></div>
          <div class="main" style="width: 320px; height: 182px; background-image: url(); background-size: 320px 182px; margin-left: -100px"></div>
          <div class="main" style="width: 320px; height: 182px; background-image: url(); background-size: 320px 182px; margin-left: -100px"></div>
          <div class="main" style="width: 320px; height: 182px; background-image: url(); background-size: 320px 182px; margin-left: -100px"></div>
          <div class="main" style="width: 320px; height: 182px; background-image: url(); background-size: 320px 182px; margin-left: -100px"></div>
        </div>
      </div>
    </section>
    <script>
      $(".carousel").owlCarousel({
        margin: 1,
        loop: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
          0: {
            items: 1,
            nav: false,
          },
          600: {
            items: 2,
            nav: false,
          },
          1000: {
            items: 3,
            nav: false,
          },
        },
      });
    </script>


</body>
</div>

</html>
<?php
include "footer.php";
?>
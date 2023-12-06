<div  style="background-image: url(assets/Bacground_produk.jpeg);" class="bgProduk">
<?php 
    include "header.php";
?>
<div>
<br><h2 style="font-family: selidon;"><center>Daftar Produk<center></h2><br>
<?php
    if($_SESSION['level'] == "petugas"){
        ?>
        <div style="margin-bottom: 3%;">
            <a href="tampil_produk.php" class="btn btn-primary">Daftar Produk</a>
            <a href="tambah_produk.php" class="btn btn-primary">Tambah Produk</a>
            
        </div>
        <?php
    }
?>

<div class="row">
    <?php 
    include "koneksi.php";
    $qry_produk=mysqli_query($conn,"select * from produk");
    ?>

    <?php
        while($dt_produk=mysqli_fetch_array($qry_produk)){
    ?>
        <div class="col-md-3">
            <div class="card" style="margin-bottom: 4%;">

            <!-- "foto_produk" adalah file baru diluar assets -->
            <img src="assets/foto_produk/<?=$dt_produk['foto']?>" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title"><?=$dt_produk['nama_produk']?></h5>
                <p class="card-text"><?=substr($dt_produk['deskripsi'], 0,100)?></p>
                <p class="card-text">IDR <?=substr($dt_produk['harga'], 0,10000000)?></p>
                <?php
                if($_SESSION['level'] == "petugas"){
                ?>
                <a href="beli_produk.php?id_produk=<?=$dt_produk['id_produk']?>" class="btn btn-primary">Beli</a>
                <a href="ubah_produk.php?id_produk=<?=$dt_produk['id_produk']?>" class="btn btn-primary">Ubah</a>
                <a href="hapus_produk.php?id_produk=<?=$dt_produk['id_produk']?>" class="btn btn-danger">Hapus</a>
                <?php
                }
                ?>

            <?php

            if($_SESSION['level']=="pelanggan"){
                ?>
                    <a href="beli_produk.php?id_produk=<?=$dt_produk['id_produk']?>" class="btn btn-primary">Beli</a>
                <?php
            } 
            ?>
            </div>
            </div>
        </div>
        <?php
    }
    ?>
</div>
</div>
<?php 
    include "footer.php";
?>
</div>
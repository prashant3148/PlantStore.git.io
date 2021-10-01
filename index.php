<?php 
include_once("includes/header.php"); 
include_once("includes/db_connect.php"); 
global $SERVER_PATH;
?> 
	<div id="banner">
    	<div class="left">
        	<div class="anythingSlider">
        
          <div class="wrapper">
            <ul>
               <li><a href="#"><img src="./images/banner2.jpg" alt="" /></a></li>
               <li><a href="#"><img src="./images/banner2.jpg" alt="" /></a></li>
               <li><a href="#"><img src="./images/banner2.jpg" alt="" /></a></li>
            </ul>        
          </div>
          
        </div>
        </div>
    </div>
    <div class="clear"></div>
  <script type="text/javascript" src="./js/cont_slide.js"></script>
  <div id="content_sec">
     <div class="col1">
		<h4 class="heading colr">All Avialbale Nursery Plants</h4>
    <div class="static">
      <?php
        $SQL="SELECT * FROM `product`, `company`, `type` WHERE product_type_id = type_id AND product_company_id = company_id";
        $rs=mysqli_query($con,$SQL) or die(mysqli_error($con));
      ?>
      <?php 
					$sr_no=1;
					while($data = mysqli_fetch_assoc($rs))
					{
					?>
					<div style="float:left; border:1px solid; margin:8px; padding:8px">
						<a href="product-details.php?product_id=<?php echo $data[product_id] ?>"><img src="<?=$SERVER_PATH.'uploads/'.$data[product_image]?>" style="height:180px; width:150px"></a><br>
						<div style="text-align:center; border-top:2px solid; padding: 5px 0px; font-weight:bold; font-size:14px;"><?=$data[product_name]?></div>
					</div>
					<?php } ?>
			</div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
</div>
<?php include_once("includes/footer.php"); ?> 

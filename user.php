<?php 
	include_once("includes/header.php"); 
	if($_REQUEST[user_id])
	{
		$SQL="SELECT * FROM user WHERE user_id = $_REQUEST[user_id]";
		$rs=mysqli_query($con,$SQL) or die(mysqli_error($con));
		$data=mysqli_fetch_assoc($rs);
	}
	if($_REQUEST['type'])
	{
		$data[user_level_id] = $_REQUEST['type'];
	}
	if($data['user_level_id'] == 1) $heading = "System User";
	if($data['user_level_id'] == 2) $heading = "Customer";
?> 
<script>

jQuery(function() {
	jQuery( "#user_dob" ).datepicker({
	  changeMonth: true,
	  changeYear: true,
	   yearRange: "-65:-10",
	   dateFormat: 'd MM,yy'
	});
	jQuery('#frm_user').validate({
		rules: {
			user_confirm_password: {
				equalTo: '#user_password'
			}
		}
	});
});
function validateForm(obj) {
	if(obj.user_password.value != obj.user_confirm_password.value) {
		alert("Password and confirm password doesnot match. ");
		return false;
	}
	if(validateEmail(obj.user_email.value))
		return true;
	jQuery('#error-msg').show();
	return false;
}
</script>
	<div class="crumb">
    </div>
    <div class="clear"></div>
	<div id="content_sec">
		<div class="col1">
			<div class="contact">
				<h4 class="heading colr">User Registration Form</h4>
				<?php
				if($_REQUEST['msg']) { 
				?>
				<div class="msg"><?=$_REQUEST['msg']?></div>
				<?php
				}
				?>
				<div class="msg" style="display:none" id="error-msg">Enter valid EmailID !!!</div>
				<form action="lib/user.php" enctype="multipart/form-data" method="post" name="frm_user" onsubmit="return validateForm(this)">
					<ul class="forms">
						<li class="txt">Name</li>
						<li class="inputfield"><input name="user_name" type="text" class="bar" required value="<?=$data[user_name]?>"/></li>
					</ul>
					<?php if($_SESSION['user_details']['user_level_id'] == 1) {?>
					
					<?php } if(!(isset($_REQUEST['user_id'])) || $_REQUEST['user_id'] == "")  { ?>
					<ul class="forms">
						<li class="txt">Username</li>
						<li class="inputfield"><input name="user_username" type="text" class="bar" required value="<?=$data[user_username]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Password</li>
						<li class="inputfield"><input name="user_password" id="user_password" type="password" class="bar" required value="<?=$data[user_password]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Confirm Password</li>
						<li class="inputfield"><input name="user_confirm_password" id="user_confirm_password" type="password" class="bar" required value="<?=$data[user_password]?>"/></li>
					</ul>
					<?php } ?>
					<ul class="forms">
						<li class="txt">Mobile</li>
						<li class="inputfield"><input onKeypress="goods='0123456789'; return limitchar(event)" name="user_mobile" type="text" class="bar" required value="<?=$data[user_mobile]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Email</li>
						<li class="inputfield"><input name="user_email" id="user_email" type="text" class="bar" required value="<?=$data[user_email]?>" onchange="validateEmail(this)" /></li>
					</ul>
					<ul class="forms">
						<li class="txt">Date of Birth</li>
						<li class="inputfield"><input name="user_dob" id="user_dob" type="text" class="bar" required value="<?=$data[user_dob]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Address Line 1</li>
						<li class="inputfield"><input name="user_add1" type="text" class="bar" required value="<?=$data[user_add1]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">Address Line 2</li>
						<li class="inputfield"><input name="user_add2" type="text" class="bar" required value="<?=$data[user_add2]?>"/></li>
					</ul>
					<ul class="forms">
						<li class="txt">City</li>
						<li class="inputfield">
							<select name="user_city" class="bar" required/>
								<?php echo get_new_optionlist("city","city_id","city_name",$data[user_city]); ?>
							</select>
						</li>
					</ul>
					<ul class="forms">
						<li class="txt">State</li>
						<li class="inputfield">
							<select name="user_state" class="bar" required/>
								<?php echo get_new_optionlist("state","state_id","state_name",$data[user_state]); ?>
							</select>
						</li>
					</ul>
					<ul class="forms">
						<li class="txt">Country</li>
						<li class="inputfield">
							<select name="user_country" class="bar" required/>
								<?php echo get_new_optionlist("country","country_id","country_name",$data[user_country]); ?>
							</select>
						</li>
					</ul>
					<ul class="forms">
						<li class="txt">Photo</li>
						<li class="inputfield"><input name="user_image" type="file" class="bar"/></li>
					</ul>
					<div class="clear"></div>
					<ul class="forms">
						<li class="txt">&nbsp;</li>
						<li class="textfield"><input type="submit" value="Submit" class="simplebtn"></li>
						<li class="textfield"><input type="reset" value="Reset" class="resetbtn"></li>
					</ul>
					<input type="hidden" name="act" value="save_user">
					<input type="hidden" name="avail_image" value="<?=$data[user_image]?>">
					<input type="hidden" name="user_id" value="<?=$data[user_id]?>">
				</form>
			</div>
		</div>
		<div class="col2">
			<?php if($_REQUEST[user_id]) { ?>
			<div class="contactfinder">
				<h4 class="heading colr">Profile of <?=$data['user_name']?></h4>
				<div><img src="<?=$SERVER_PATH.'uploads/'.$data[user_image]?>" style="width: 250px"></div><br>
			</div> 
			<?php } ?>
		</div>
	</div>
<?php
	if($_SESSION['user_details']['user_level_id'] != 1)
	{
?>
	<script>
		jQuery( "#user_level_id" ).val(3);
		jQuery( "#user_level" ).hide();
	</script>
<?php		
	}
?>
<?php include_once("includes/footer.php"); ?> 

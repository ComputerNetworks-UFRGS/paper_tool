<?php /* Smarty version Smarty-3.1.13, created on 2015-01-08 16:25:53
         compiled from "./templates/classification.tpl" */ ?>
<?php /*%%SmartyHeaderCode:15053577455480ea5c36cef4-23210671%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '100bdb6d54b5e46831672c7460214922b8361f18' => 
    array (
      0 => './templates/classification.tpl',
      1 => 1420741200,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '15053577455480ea5c36cef4-23210671',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5480ea5c5086e0_47443107',
  'variables' => 
  array (
    'JS_LIBS_PATH' => 0,
    'SYS_TITLE' => 0,
    'classification' => 0,
    'count' => 0,
    'item' => 0,
    'background' => 0,
    'line' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5480ea5c5086e0_47443107')) {function content_5480ea5c5086e0_47443107($_smarty_tpl) {?><!doctype html>
<html>
<head>

	<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
	
	<meta charset="utf-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
application.js" type="text/javascript"></script>

	<!-- Use title if it's in the page YAML frontmatter -->
	<title><?php echo $_smarty_tpl->tpl_vars['SYS_TITLE']->value;?>
</title>
  
	<style>
    .tg  {
      border-collapse:collapse;
      border-spacing:0;
      margin: auto;
    }
    .tg td{
      font-family:Arial, sans-serif;
      font-size:11px;padding: 5px 5px;
      border-style:solid;
      border-width:1px;
      border-color: white;
      overflow:hidden;
      word-break:normal;
      text-align: center;
    }
    .tg th{
      font-family:Arial, sans-serif;
      font-size:14px;font-weight:normal;
      padding: 5px 5px;
      border-style:solid;
      border-width:1px;
      overflow:hidden;
      word-break:normal;
    }
    .tg .tg-s6z2{
      text-align:center
    }
    td.textRotate{
      -webkit-transform: rotate(270deg);
      -moz-transform: rotate(270deg);
      -o-transform: rotate(270deg);
      writing-mode: bt-rl;
    }
  </style>
  
</head>

<body>

<table class="tg" style="undefined;table-layout: fixed; width: 810px">
  <colgroup>
  <!-- <col style="width: 50px"> -->
  <col style="width: 290px">
  <!-- <col style="width: 195px">
  <col style="width: 195px">
  <col style="width: 195px">
  <col style="width: 195px">
  <col style="width: 195px"> -->
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">

  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">

  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">

  </colgroup>
  <tr>
    <th class="tg-031e" style="border: none;" ></th>
    <th class="tg-s6z2" style="border: none;" colspan="8">Dataset types</th>
    <th class="tg-s6z2" style="border: none;" colspan="5">Visualization Techniques</th>
    <th class="tg-s6z2" style="border: none;" colspan="9">Task/Interactions</th>
  </tr>
  <tr>
    <td class="tg-s6z2" style=" border-top: none; border-left: none; border-right: 5px solid white;"></td>
    <!-- <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">Standard 2D/3D displays</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">Geometrically transformed display</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">Icon-based displays</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">Dense pixel displays</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">Stacked displays</td> -->

    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 1</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 2</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 3</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 4</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 5</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 6</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">DS 7</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold; border-right: 5px solid;">DS 8</td>

    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">VT1</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">VT2</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">VT3</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold;">VT4</td>
    <td class="tg-s6z2" style=" color: white; background-color: #777; font-weight: bold; border-right: 5px solid;">VT5</td>

    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 1</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 2</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 3</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 4</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 5</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 6</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 7</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 8</td>
    <td class="tg-s6z2" style=" color: white; background-color: #001; font-weight: bold;">T/I 9</td>
  </tr>

  <?php $_smarty_tpl->tpl_vars["count"] = new Smarty_variable(0, null, 0);?>

  <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['classification']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>

    <?php if ($_smarty_tpl->tpl_vars['count']->value%2==0){?>
      <?php $_smarty_tpl->tpl_vars["background"] = new Smarty_variable("#E0E0E0", null, 0);?>
    <?php }else{ ?>
      <?php $_smarty_tpl->tpl_vars["background"] = new Smarty_variable("#F4F4F4", null, 0);?>  
    <?php }?>

    <?php  $_smarty_tpl->tpl_vars['line'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['line']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['item']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['line']->key => $_smarty_tpl->tpl_vars['line']->value){
$_smarty_tpl->tpl_vars['line']->_loop = true;
?>
      <tr>
        <td class="tg-031e" style=" background-color: <?php echo $_smarty_tpl->tpl_vars['background']->value;?>
; border-right: 5px solid white;"><?php echo $_smarty_tpl->tpl_vars['line']->key;?>
</td>
        
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[1];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[2];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[3];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[4];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[5];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[6];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[7];?>
</td>
        <td class="tg-031e tg-content" style="border-right: 5px solid;"><?php echo $_smarty_tpl->tpl_vars['line']->value[8];?>
</td>

        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[9];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[10];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[11];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[12];?>
</td>
        <td class="tg-031e tg-content" style="border-right: 5px solid;"><?php echo $_smarty_tpl->tpl_vars['line']->value[13];?>
</td>

        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[14];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[15];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[16];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[17];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[18];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[19];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[20];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[25];?>
</td>
        <td class="tg-031e tg-content"><?php echo $_smarty_tpl->tpl_vars['line']->value[29];?>
</td>

      </tr>
    <?php } ?>

    <?php $_smarty_tpl->tpl_vars['count'] = new Smarty_variable($_smarty_tpl->tpl_vars['count']->value+1, null, 0);?>

  <?php } ?>

</table>

<br>

<table class="tg" style="undefined;table-layout: fixed; width: 364px">
  <colgroup>
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  <col style="width: 40px">
  </colgroup>
  <tr>
    <th style="border: 1px solid white; background-color: #fff5f0;"></th>
    <th style="border: 1px solid white; background-color: #fee0d2;"></th>
    <th style="border: 1px solid white; background-color: #fcbba1;"></th>
    <th style="border: 1px solid white; background-color: #fc9272;"></th>
    <th style="border: 1px solid white; background-color: #fb6a4a;"></th>
    <th style="border: 1px solid white; background-color: #ef3b2c;"></th>
    <th style="border: 1px solid white; background-color: #cb181d;"></th>
    <th style="border: 1px solid white; background-color: #a50f15;"></th>
    <th style="border: 1px solid white; background-color: #67000d;"></th>
  </tr>
  <tr>
    <td class="tg-031e">&lt; 5</td>
    <td class="tg-031e">&gt; 5</td>
    <td class="tg-031e">&gt; 15</td>
    <td class="tg-031e">&gt; 20</td>
    <td class="tg-031e">&gt; 25</td>
    <td class="tg-031e">&gt; 40</td>
    <td class="tg-031e">&gt; 65</td>
    <td class="tg-031e">&gt; 200</td>
    <td class="tg-031e">&gt; 250</td>
  </tr>
</table>


  <script type="text/javascript">
    $(document).ready(function() {
      
      var color;
      
      $('.tg-content').each(function(index, val) {
        var weight = parseInt(this.innerHTML);
        console.log(weight);
        if(weight > 250){
          bgcolor = "#67000d";
          color = "white";
        }
        else if (weight > 200){
          bgcolor = "#a50f15";
          color = "white";
        }
        else if (weight > 65){
          bgcolor = "#cb181d";
          color = "white";
        }
        else if (weight > 40){
          bgcolor = "#ef3b2c";
          color = "#4A4A4A";
        }
        else if (weight > 25){
          bgcolor = "#fb6a4a";
          color = "#4A4A4A";
        }
        else if (weight > 20){
          bgcolor = "#fc9272";
          color = "#4A4A4A";
        }
        else if (weight > 15){
          bgcolor = "#fcbba1";
          color = "#4A4A4A";
        }
        else if (weight > 5){
          bgcolor = "#fee0d2";
          color = "#4A4A4A";
        }
        else{
          bgcolor = "#fff5f0";
          color = "#4A4A4A";
        }

        console.log(this);
        this.style.backgroundColor = bgcolor;
        //this.style.color = color;
        this.style.color = "transparent";
      });
    });
  </script>


</body>
</html>
<?php }} ?>
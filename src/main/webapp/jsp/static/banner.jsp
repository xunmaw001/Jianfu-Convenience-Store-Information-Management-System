<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">

	    <div class="conjtainer">
	      <!-- Menu button for smallar screens -->
	      <div class="navbar-header">
			  <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
				<span>Menu</span>
			  </button>
			  <!-- Site name for smallar screens -->
			  <a href="index.html" class="navbar-brand hidden-lg">MacBeth</a>
		  </div>



	      <!-- Navigation starts -->
	      <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">

	        <!-- Links -->
	        <ul class="nav navbar-nav pull-right">
	          <li class="dropdown pull-right">
	            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
	              <i class="icon-user"></i> Admin <b class="caret"></b>
	            </a>

	            <!-- Dropdown menu -->
	            <ul class="dropdown-menu">
	             	
	              <li onclick="logout()"><a href="#"><i class="icon-off"></i> 退出</a></li>
	            </ul>
	          </li>

	        </ul>
	      </nav>

	    </div>
	  </div>
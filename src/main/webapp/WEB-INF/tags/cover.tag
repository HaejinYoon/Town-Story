<%@ tag language="java" pageEncoding="EUC-KR"%>
<style>
.under-cover-img{
background-color:#264d73;
color:white;
position:relative;}

#cover{
    object-fit: cover;
    width: 100%;
    height: 250px;

}

#cover-head-font, #cover-font{
  font-family: 'Jua', sans-serif;
}


</style>

<div class="under-cover-img">
	<img id="cover"
		src= "${coverImg}" 
		alt="aaaa"
	></img>
	<div class="h2 ml-5 mt-4 mb-2" id="cover-head-font">${coverHeader}</div>
	<div class="h5 ml-5 mt-4 pb-2" id="cover-font">${coverText}</div>
</div>
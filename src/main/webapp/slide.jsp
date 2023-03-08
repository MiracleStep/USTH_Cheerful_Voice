<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Swiper demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="./css/swiper-bundle.min.css"/>

    <!-- Demo styles -->
    <style>
        html,
        body {
            /*position: relative;*/
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
        }

        .swiper {
            /*position: absolute;*/
            /*left:50%;*/
            /*top:0%;*/
            /*transform: translate(-50%, -50%);*/
            /* --------------------------------- */
            width: 100%;
            height: 66%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>

<body>
<!-- Swiper -->

<div class="swiper mySwiper" style="height: 93%;">
    <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="images/img_8.jpg" alt=""></div>
        <div class="swiper-slide"><img src="images/img_1.png" alt=""></div>
        <div class="swiper-slide"><img src="images/img_2.png" alt=""></div>
        <div class="swiper-slide"><img src="images/img_3.png" alt=""></div>
        <div class="swiper-slide"><img src="images/img_7.jpg" alt=""></div>
        <div class="swiper-slide"><img src="images/img_6.jpg" alt=""></div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script src="./js/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        autoplay: true,
        pagination: {
            el: ".swiper-pagination",
            type: "fraction",
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>
</body>
</html>

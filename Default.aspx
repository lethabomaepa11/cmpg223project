<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cmpg223project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="bg-secondary-emphasis d-flex flex-column justify-content-center align-items-center -mt-5 w-100 h-100 text-white"> 
        <video class=" d-lg-inline h-100 w-100  " autoplay loop muted playsinline style="object-fit:cover;">
            <source src="Exterior/home.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div id="gallery" class="relative w-full mt-5" data-carousel="slide">
            <!-- Added this for you bafo, you can edit it...-->
            <div class="relative h-56 overflow-hidden rounded-lg md:h-96">
                 <!-- Pic 1 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/luxury-classic-modern-bedroom-suite-hotel.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 2 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item="active">
                    <img src="interior/0bf59d4c15b7790319815501f33c0be7.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 3 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/exterior of hotel.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 4 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/exterior 3.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 5 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/exterior 2.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
            </div>
            <!-- The Slider controls -->
            <button type="button" class="absolute top-0 start-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-prev>
                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                    <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 1 1 5l4 4"/>
                    </svg>
                    <span class="sr-only">Previous</span>
                </span>
            </button>
            <button type="button" class="absolute top-0 end-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-next>
                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                    <svg class="w-4 h-4 text-white dark:text-gray-800 rtl:rotate-180" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                    </svg>
                    <span class="sr-only">Next</span>
                </span>
            </button>
        </div>

            <h1 class="position-absolute top-0 fs-1" style="margin-top: 15rem;">
                Welcome to Potch Stream Hotel 
            </h1>
           <div class="w-75 text-black">
               
            <p>Welcome to Portch Stream, your serene sanctuary nestled in the heart of nature's beauty. At Portch Stream, we pride ourselves on offering an unparalleled blend of luxury and comfort, ensuring that every moment of your stay is a memorable experience. Our elegantly designed rooms, world-class amenities, and exceptional service create a perfect retreat for relaxation and rejuvenation. Whether you’re here for a romantic getaway, a family vacation, or a business trip, Portch Stream provides the ideal setting to unwind and enjoy the tranquil surroundings. Discover the charm of our hotel, where sophistication meets tranquility, and create lasting memories with us </p>

           </div>
      </main>   
                    
</asp:Content>

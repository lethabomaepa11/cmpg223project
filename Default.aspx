<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="cmpg223project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <main class="bg-secondary-emphasis bg-slate-50 pb-20 d-flex flex-column justify-content-center align-items-center -mt-5 w-100 h-100 text-white"> 
        <video class=" d-lg-inline h-70 w-100  " autoplay loop muted playsinline style="object-fit:fill;">
            <source src="Exterior/final version.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <section class="min-h-screen bg-slate-50 w-screen flex flex-col justify-center items-center">
            <h1 class="text-5xl text-black font-bold">Making bookings is always <span class="line-through text-red-500">tough</span> easy with us.</h1>
            <p class="text-black text-lg mt-2">Your booking experience has been over-simplified</p>
            <a runat="server" href="~/booking"><button type="button" class="py-3 px-10  rounded-md bg-blue-500">Get Started now.</button></a>
            <h1 class="mt-5 text-3xl text-black font-bold">Your lost items are safe with us, you can come and claim anytime</h1>
            <a runat="server" href="~/lost-found.aspx"><button type="button" class="py-3 px-10  rounded-md bg-blue-500 mt-3">Click here to make a claim.</button></a>
        </section>
        <div id="gallery" class="relative w-full mt-5" data-carousel="slide" style="object-fit:fill;">
            <div class="relative h-56 overflow-hidden rounded-lg md:h-96">
                 <!-- Pic 1 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/african-businessman_resized.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 2 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item="active">
                    <img src="Exterior/luxury-classic-modern-bedroom-suite-hotel_resized.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2"  alt="">
                </div>
                <!-- Pic 3 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/luxury-classic-modern-bedroom-suite-hotel_1025864-2673.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 4 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <img src="Exterior/luxury-classic-modern-bedroom-suite-hotel-with-king-size-bed_resized.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
                </div>
                <!-- Pic 5 -->
                <div class="hidden duration-700 ease-in-out" data-carousel-item>
                    <<<img src="Exterior/luxury-classic-modern-bedroom-suite-hotel_resized.jpg" class="absolute block max-w-full h-auto -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="">
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
            

      </main>   
                    
</asp:Content>

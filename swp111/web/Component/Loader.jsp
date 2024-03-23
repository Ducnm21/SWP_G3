<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Loading ...</title>
        <style>
            .Loader {
                position: relative;
                width: 100%;
                height: 100vh;
            }

            .shapes-5 {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 100px;
                height: 100px;
                color:orange;
                background:
                    linear-gradient(currentColor 0 0),
                    linear-gradient(currentColor 0 0),
                    linear-gradient(currentColor 0 0),
                    linear-gradient(currentColor 0 0);
                background-size: 29px 29px;
                background-repeat:no-repeat;
                animation: sh5 1.5s infinite cubic-bezier(0.3,1,0,1);
            }
            @keyframes sh5 {
                0%   {
                    background-position: 0    0,100% 0   ,100% 100%,0 100%
                }
                33%  {
                    background-position: 0    0,100% 0   ,100% 100%,0 100%;
                    width:60px;
                    height: 60px
                }
                66%  {
                    background-position: 100% 0,100% 100%,0    100%,0 0   ;
                    width:60px;
                    height: 60px
                }
                100% {
                    background-position: 100% 0,100% 100%,0    100%,0 0
                }
            }
        </style>
    </head>

    <body>
        <div class="Loader">
            <div class="shapes-5"></div>
        </div>
    </body>
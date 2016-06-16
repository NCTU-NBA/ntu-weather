<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://overpass-30e2.kxcdn.com/overpass.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css" />

    <title>天氣 – 國立臺灣大學, 台灣</title>
    <meta name="description" content="究竟公館現在有沒有在下雨呢？臺大即時氣象資訊（氣溫、風向、氣壓、降雨），讓第 28 屆臺大學生會福利部告訴你！" />
    <meta property="og:site_name" content="臺大學生會" />
    <meta property="og:title" content="國立臺灣大學, 台灣 — NTUSA 氣象" />
    <meta property="og:image" content="https://sparks.ntustudents.org/wp-content/uploads/2015/11/11088549_1652198295008976_5229878804731284088_n-870x418.jpg" />
    <meta property="og:url" content="http://weather.ntustudents.org" />


    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        a:hover, a:active {
            color: #777;
        }

        html, body {
            background: #f9f9f9;
            color: #2b2b2b;
            font-family: Overpass, 'Pingfang TC', 'Source Han Sans TW', 'Microsoft Jhenghei', sans-serif;
        }

        .section {
            max-width: 62rem;
            margin: auto;
            padding: 1rem 1rem;
        }

        .logo {
            width: 20rem;
            height: auto;
        }

        .weather {
            background: #61a4b3 url('https://c2.staticflickr.com/8/7356/9144879696_a0e9305430_h.jpg') center / cover;
            color: rgba(255, 255, 255, .95);
            text-shadow: rgba(0, 0, 0, .1) 0 0 5px;
        }

        .weather .section {
            min-height: 30rem;
            position: relative;
        }

        .weather h3 {
            font-weight: inherit;
            margin: 0;

        }

        .temperature span {
            display: inline-block;
        }

        .temperature .current {
            font-size: 8rem;
            line-height: 10rem;
        }

        .temperature .unit {
            font-size: 3rem;
            font-weight: 200;
            padding-top: 1.15rem;
            vertical-align: top;
        }

        .dashboard ul {
            color: rgba(255, 255, 255, .6);
            letter-spacing: 0.05rem;
            list-style: none;
            font-size: .875rem;
            margin: 0;
            max-width: 24rem;
            padding: 0;
        }

        .dashboard li {
            display: inline-block;
            width: 48%;
        }

        .dashboard ul em {
            color: white;
            font-style: normal;
            font-weight: 500;
        }

        .dashboard .wind {
            color: white;
            display: inline-block;
            margin: 0 .25rem;
            text-align: center;
            width: 1em;
            vertical-align: middle;
        }

        .source {
            bottom: 1rem;
            color: rgba(255, 255, 255, .5);
            font-size: .75rem;
            position: absolute;
        }

        footer {
            font-size: .75rem;
            font-weight: 600;
        }

        .hide {
            color: #777;
            opacity: 0;
            transition: opacity .2s ease;
        }

        .section:hover .hide {
            opacity: 1;
        }

        footer .social {
            float: right;
            text-align: right;
            width: 200px;
        }
    </style>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-79166280-1', 'auto');
        ga('send', 'pageview');
    </script>
<%
    def value(text, digits=0, default='N/A'):
        try:
            float_value = float(text)
            if digits < 1:
                return round(float_value)
            else:
                return round(float_value, digits)
            end
        except ValueError:
            return default
        end
    end
%>
</head>
<body>
    <header class="section">
        <img alt="國立臺灣大學學生會" class="vendor logo" src="http://rschiang.github.io/student-weekly-themes/assets/logo.png" />
    </header>
    <section class="weather">
        <div class="section">
            <h3>國立臺灣大學, 台灣</h3>
% if defined('error'):
            <div class="temperature">
                <span class="current">--</span>
                <span class="unit">--</span>
            </div>
            <div class="dashboard">
                <ul>
                    <li>資訊暫時無法使用。</li>
                </ul>
            </div>
% else:
            <div class="temperature">
                <span class="current">{{ value(temperature, default='--') }}</span>
                <span class="unit">°C</span>
            </div>
            <div class="dashboard">
                <ul>
                    <li>本日氣溫 <em>{{ value(temp_min) }} – {{ value(temp_max) }} °C</em></li>
                    <li>風向 <span class="wind" style="transform: rotate({{ value(wind_direction, 1) - 90 }}deg)">➤</span> <em>{{ value(wind_speed, 1) }} m/s</em></li>
                    <li>氣壓 <em>{{ value(pressure, 1) }} hPa</em></li>
                    <li>降雨強度 <em>{{ value(rain, 1) }} mm/h</em></li>
                    <li>濕度 <em>{{ value(humidity, 1) }}%</em></li>
                    <li>本日降雨 <em>{{ value(rain_day, 1) }} mm</em></li>
                </ul>
            </div>
            <div class="source">
                資料來源：{{ provider }}
            </div>
% end
        </div>
    </section>
    <footer class="section">
        <div class="social">
            <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2FNTUWelfare&width=92&layout=button_count&action=like&show_faces=false&share=false&height=21&appId=599411893573946" width="92" height="21" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
            <iframe src="https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2Fweather.ntustudents.org%2F&layout=button&mobile_iframe=true&appId=599411893573946&width=58&height=21" width="58" height="21" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
        </div>
        <div class="meta">
            第 28 屆<a href="https://www.facebook.com/NTUWelfare" rel="external nofollow">國立臺灣大學學生會福利部</a>
            <span class="hide">「總是為你撐起一把傘。」</span><br />
            National Taiwan University Student Association, 2016
        </div>
    </footer>
</body>
</html>

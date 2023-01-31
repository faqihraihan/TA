$(function(){
    // Sidebar
    $('#sidebar-btn').click(function(e) {
        e.preventDefault();
        $('#view-sidebar').addClass("active")
        $('#sidebar').addClass("active")
    });

    $('#view-sidebar').click(function(e) {
        $('#view-sidebar').removeClass("active")
        $('#sidebar').removeClass("active")
    });

    $('#close-btn').click(function(e) {
        $('#view-sidebar').removeClass("active")
        $('#sidebar').removeClass("active")
    });

    $('#profile-btn').click(function(e) {
        window.location.href = "/profil/me";
        e.preventDefault();
    });

    $('#profile-btn').hover(function(){
        $('#info-img').addClass('active');
        $('#right-img').addClass('active');
    }, function(){
        $('#info-img').removeClass('active');
        $('#right-img').removeClass('active');
    });

    $('#beranda').click(function(e) {
        window.location.href = "/";
        e.preventDefault();
    });

    $('#beranda').hover(function(){
        $('#label-beranda').addClass('active');
    }, function(){
        $('#label-beranda').removeClass('active');
    });

    $('#dashboard').click(function(e) {
        window.location.href = "/dashboard";
        e.preventDefault();
    });

    $('#dashboard').hover(function(){
        $('#label-dashboard').addClass('active');
    }, function(){
        $('#label-dashboard').removeClass('active');
    });

    $('#inputdata').click(function(e) {
        window.location.href = "/input-data";
        e.preventDefault();
    });

    $('#inputdata').hover(function(){
        $('#label-inputdata').addClass('active');
    }, function(){
        $('#label-inputdata').removeClass('active');
    });

    // Mesin pencari peta
    $('#search').keyup(function() {
        $.ajax({
            type: "POST",
            url: "/gis/live-search",
            data: {
                'search_text' : $('#search').val()
            },
            success: searchSuccess,
        });
    });

    function searchSuccess(data){
        if($('#search').val()){
            $('#result-list').addClass('active');
            $('#search-list').html(data);
            $('#search-list').append(data.htmlresponse);
            var n = $('#search-list li').length;
            if (!n){   
                $('#search-list').append('<li class="result" id="resultdata"><div class="icons-search"></div><div class="result-text">Data tidak ditemukan</div></li>');
            }
        } else {
            $('#search-list li').remove();
            $('#result-list').removeClass('active');
        }
    }

    $('#search').blur(function(event){
        if(event.relatedTarget.type != "submit"){
            if($(this).val()) {
                $('#result-list').removeClass('active');
            }
        }
    });

    $('#search').focus(function(){
        if($(this).val()) {
            $('#result-list').addClass('active');
        }
    });

    $('#search').keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
            var id = $('#search-list li button:first-child').attr('id');
            if(id){
                window.location.href = '/gis/desa/' + id;
                event.preventDefault();
            } else {
                event.preventDefault();
            }
        }
    });

    $('#search-btn').click(function(event) {
        var id = $('#search-list li:first-child button').attr('id');
        if(id){
            window.location.href = '/gis/desa/' + id;
            event.preventDefault();
        } else {
            event.preventDefault();
        }
    });

    $('#reset-btn').click(function(event) {
        event.preventDefault();
        $('#reset-btn').remove();
        $('#nav-btn').append('<button name="search-btn" id="search-btn" class="search-btn" value="search"><div></div></button>');
        $('#search').removeClass('active').removeAttr('value').prop('disabled', false).focus();
    });

    // Dragable feature

    // Dragable feature layers
    var offsetA = [0,0];
    var divOverlayA = document.getElementById("overlay-info");
    var divOverlayDownA = document.getElementById("title-overlay-info");
    var isDownA = false;

    divOverlayDownA.addEventListener('mousedown', function(e) {
        isDownA = true;
        offsetA = [
        divOverlayA.offsetLeft - e.clientX,
        divOverlayA.offsetTop - e.clientY
        ];
    }, true);
    divOverlayDownA.addEventListener('mouseup', function() {
        isDownA = false;
    }, true);
    
    divOverlayDownA.addEventListener('mousemove', function(e) {
        e.preventDefault();
        if (isDownA) {
            divOverlayA.style.left = (e.clientX + offsetA[0]) + 'px';
            divOverlayA.style.top  = (e.clientY + offsetA[1]) + 'px';
        }
    }, true);

    var offsetB = [0,0];
    var divOverlayB = document.getElementById("overlay-layers");
    var divOverlayDownB = document.getElementById("title-overlay-layers");
    var isDownB = false;

    divOverlayDownB.addEventListener('mousedown', function(e) {
        isDownB = true;
        offsetB = [
        divOverlayB.offsetLeft - e.clientX,
        divOverlayB.offsetTop - e.clientY
        ];
    }, true);
    divOverlayDownB.addEventListener('mouseup', function() {
        isDownB = false;
    }, true);
    
    divOverlayDownB.addEventListener('mousemove', function(e) {
        e.preventDefault();
        if (isDownB) {
            divOverlayB.style.left = (e.clientX + offsetB[0]) + 'px';
            divOverlayB.style.top  = (e.clientY + offsetB[1]) + 'px';
        }
    }, true);

    // Bottom Widget
    var activeInfo = false;
    $('#wg-info').click(function() {
        if(activeInfo){
            $(this).removeClass('active');
            $('#overlay-info').removeClass('active');
            activeInfo = false;
        } else {
            $(this).addClass('active');
            $('#overlay-info').addClass('active');
            activeInfo = true;
        }
    });

    $('#minimize-info').click(function() {
        $('#wg-info').removeClass('active');
        $('#overlay-info').removeClass('active');
        activeInfo = false;
    });

    var activeLayers = false;
    $('#wg-layers').click(function() {
        if(activeLayers){
            $(this).removeClass('active');
            $('#overlay-layers').removeClass('active');
            activeLayers = false;
        } else {
            $(this).addClass('active');
            $('#overlay-layers').addClass('active');
            activeLayers = true;
        }
    });

    $('#minimize-layers').click(function() {
        $('#wg-layers').removeClass('active');
        $('#overlay-layers').removeClass('active');
        activeLayers = false;
    });

    // Color Convertion Black to target HEX Color
    'use strict';

    class Color {
        constructor(r, g, b) {
            this.set(r, g, b);
        }
        
        toString() {
            return `rgb(${Math.round(this.r)}, ${Math.round(this.g)}, ${Math.round(this.b)})`;
        }

        set(r, g, b) {
            this.r = this.clamp(r);
            this.g = this.clamp(g);
            this.b = this.clamp(b);
        }

        hueRotate(angle = 0) {
            angle = angle / 180 * Math.PI;
            const sin = Math.sin(angle);
            const cos = Math.cos(angle);

            this.multiply([
                0.213 + cos * 0.787 - sin * 0.213,
                0.715 - cos * 0.715 - sin * 0.715,
                0.072 - cos * 0.072 + sin * 0.928,
                0.213 - cos * 0.213 + sin * 0.143,
                0.715 + cos * 0.285 + sin * 0.140,
                0.072 - cos * 0.072 - sin * 0.283,
                0.213 - cos * 0.213 - sin * 0.787,
                0.715 - cos * 0.715 + sin * 0.715,
                0.072 + cos * 0.928 + sin * 0.072,
            ]);
        }

        grayscale(value = 1) {
            this.multiply([
                0.2126 + 0.7874 * (1 - value),
                0.7152 - 0.7152 * (1 - value),
                0.0722 - 0.0722 * (1 - value),
                0.2126 - 0.2126 * (1 - value),
                0.7152 + 0.2848 * (1 - value),
                0.0722 - 0.0722 * (1 - value),
                0.2126 - 0.2126 * (1 - value),
                0.7152 - 0.7152 * (1 - value),
                0.0722 + 0.9278 * (1 - value),
            ]);
        }

        sepia(value = 1) {
            this.multiply([
                0.393 + 0.607 * (1 - value),
                0.769 - 0.769 * (1 - value),
                0.189 - 0.189 * (1 - value),
                0.349 - 0.349 * (1 - value),
                0.686 + 0.314 * (1 - value),
                0.168 - 0.168 * (1 - value),
                0.272 - 0.272 * (1 - value),
                0.534 - 0.534 * (1 - value),
                0.131 + 0.869 * (1 - value),
            ]);
        }

        saturate(value = 1) {
            this.multiply([
                0.213 + 0.787 * value,
                0.715 - 0.715 * value,
                0.072 - 0.072 * value,
                0.213 - 0.213 * value,
                0.715 + 0.285 * value,
                0.072 - 0.072 * value,
                0.213 - 0.213 * value,
                0.715 - 0.715 * value,
                0.072 + 0.928 * value,
            ]);
        }

        multiply(matrix) {
            const newR = this.clamp(this.r * matrix[0] + this.g * matrix[1] + this.b * matrix[2]);
            const newG = this.clamp(this.r * matrix[3] + this.g * matrix[4] + this.b * matrix[5]);
            const newB = this.clamp(this.r * matrix[6] + this.g * matrix[7] + this.b * matrix[8]);
            this.r = newR;
            this.g = newG;
            this.b = newB;
        }

        brightness(value = 1) {
            this.linear(value);
        }

        contrast(value = 1) {
            this.linear(value, -(0.5 * value) + 0.5);
        }

        linear(slope = 1, intercept = 0) {
            this.r = this.clamp(this.r * slope + intercept * 255);
            this.g = this.clamp(this.g * slope + intercept * 255);
            this.b = this.clamp(this.b * slope + intercept * 255);
        }

        invert(value = 1) {
            this.r = this.clamp((value + this.r / 255 * (1 - 2 * value)) * 255);
            this.g = this.clamp((value + this.g / 255 * (1 - 2 * value)) * 255);
            this.b = this.clamp((value + this.b / 255 * (1 - 2 * value)) * 255);
        }

        hsl() {
            const r = this.r / 255;
            const g = this.g / 255;
            const b = this.b / 255;
            const max = Math.max(r, g, b);
            const min = Math.min(r, g, b);
            let h, s, l = (max + min) / 2;

            if (max === min) {
                h = s = 0;
            } else {
                const d = max - min;
                s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
                switch (max) {
                case r:
                    h = (g - b) / d + (g < b ? 6 : 0);
                    break;

                case g:
                    h = (b - r) / d + 2;
                    break;

                case b:
                    h = (r - g) / d + 4;
                    break;
                }
                h /= 6;
            }

            return {
                h: h * 100,
                s: s * 100,
                l: l * 100,
            };
        }

        clamp(value) {
            if (value > 255) {
                value = 255;
            } else if (value < 0) {
                value = 0;
            }
            return value;
        }
    }

    class Solver {
        constructor(target, baseColor) {
            this.target = target;
            this.targetHSL = target.hsl();
            this.reusedColor = new Color(0, 0, 0);
        }

        solve() {
            const result = this.solveNarrow(this.solveWide());
            return {
                values: result.values,
                loss: result.loss,
                filter: this.css(result.values),
            };
        }

        solveWide() {
            const A = 5;
            const c = 15;
            const a = [60, 180, 18000, 600, 1.2, 1.2];

            let best = { loss: Infinity };
            for (let i = 0; best.loss > 25 && i < 3; i++) {
                const initial = [50, 20, 3750, 50, 100, 100];
                const result = this.spsa(A, a, c, initial, 1000);
                if (result.loss < best.loss) {
                    best = result;
                }
            }
            return best;
        }

        solveNarrow(wide) {
            const A = wide.loss;
            const c = 2;
            const A1 = A + 1;
            const a = [0.25 * A1, 0.25 * A1, A1, 0.25 * A1, 0.2 * A1, 0.2 * A1];
            return this.spsa(A, a, c, wide.values, 500);
        }

        spsa(A, a, c, values, iters) {
            const alpha = 1;
            const gamma = 0.16666666666666666;

            let best = null;
            let bestLoss = Infinity;
            const deltas = new Array(6);
            const highArgs = new Array(6);
            const lowArgs = new Array(6);

            for (let k = 0; k < iters; k++) {
                const ck = c / Math.pow(k + 1, gamma);
                for (let i = 0; i < 6; i++) {
                    deltas[i] = Math.random() > 0.5 ? 1 : -1;
                    highArgs[i] = values[i] + ck * deltas[i];
                    lowArgs[i] = values[i] - ck * deltas[i];
                }

                const lossDiff = this.loss(highArgs) - this.loss(lowArgs);
                for (let i = 0; i < 6; i++) {
                    const g = lossDiff / (2 * ck) * deltas[i];
                    const ak = a[i] / Math.pow(A + k + 1, alpha);
                    values[i] = fix(values[i] - ak * g, i);
                }

                const loss = this.loss(values);
                if (loss < bestLoss) {
                    best = values.slice(0);
                    bestLoss = loss;
                }
            }
            return { values: best, loss: bestLoss };

            function fix(value, idx) {
                let max = 100;
                if (idx === 2 /* saturate */) {
                    max = 7500;
                } else if (idx === 4 /* brightness */ || idx === 5 /* contrast */) {
                    max = 200;
                }

                if (idx === 3 /* hue-rotate */) {
                    if (value > max) {
                        value %= max;
                    } else if (value < 0) {
                        value = max + value % max;
                    }
                } else if (value < 0) {
                    value = 0;
                } else if (value > max) {
                    value = max;
                }
                return value;
            }
        }

        loss(filters) {
            const color = this.reusedColor;
            color.set(0, 0, 0);

            color.invert(filters[0] / 100);
            color.sepia(filters[1] / 100);
            color.saturate(filters[2] / 100);
            color.hueRotate(filters[3] * 3.6);
            color.brightness(filters[4] / 100);
            color.contrast(filters[5] / 100);

            const colorHSL = color.hsl();
            return (
                Math.abs(color.r - this.target.r) +
                Math.abs(color.g - this.target.g) +
                Math.abs(color.b - this.target.b) +
                Math.abs(colorHSL.h - this.targetHSL.h) +
                Math.abs(colorHSL.s - this.targetHSL.s) +
                Math.abs(colorHSL.l - this.targetHSL.l)
            );
        }

        css(filters) {
            function fmt(idx, multiplier = 1) {
                return Math.round(filters[idx] * multiplier);
            }
            return `filter: invert(${fmt(0)}%) sepia(${fmt(1)}%) saturate(${fmt(2)}%) hue-rotate(${fmt(3, 3.6)}deg) brightness(${fmt(4)}%) contrast(${fmt(5)}%);`;
        }
    }

    function hexToRgb(hex) {
        const shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
        hex = hex.replace(shorthandRegex, (m, r, g, b) => {
            return r + r + g + g + b + b;
        });

        const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
        return result
        ? [
            parseInt(result[1], 16),
            parseInt(result[2], 16),
            parseInt(result[3], 16),
        ]
        : null;
    }

    $(document).ready(() => {
        const element = document.querySelector('svg.leaflet-zoom-animated g path.leaflet-interactive');
        let fill = element.getAttribute("fill");
        const rgb = hexToRgb(fill);

        const color = new Color(rgb[0], rgb[1], rgb[2]);
        const solver = new Solver(color);
        const result = solver.solve();

        $('#overlay .polygon').attr('style', result.filter);
    });

    // Focus Button
    // $('#focus-btn').click(function() {
    //     id = $('.folium-map').attr('id');
    //     console.log(id);
    //     // id.fitBounds(
    //     //     [[-3.801332717999969, 120.00356292700008], [-3.678889450999975, 120.1543521750001]],
    //     //     {}
    //     // ); 
    // });

    $('#focus-btn').click(function() {
        maps = $('.folium-map').attr('id');

        m = eval(maps);
        m.fitBounds(
            [[-3.801332717999969, 120.00356292700008], [-3.678889450999975, 120.1543521750001]],
            {}
        );
    });
});
 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="vi" katalonextensionid="ljdobmomdgdljniojadhoplhkpialdid" class="bprogress-busy" style="">
   <head>
      <meta http-equiv="origin-trial" content="A7vZI3v+Gz7JfuRolKNM4Aff6zaGuT7X0mf3wtoZTnKv6497cVMnhy03KDqX7kBz/q/iidW7srW31oQbBt4VhgoAAACUeyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGUuY29tOjQ0MyIsImZlYXR1cmUiOiJEaXNhYmxlVGhpcmRQYXJ0eVN0b3JhZ2VQYXJ0aXRpb25pbmczIiwiZXhwaXJ5IjoxNzU3OTgwODAwLCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
      <link rel="stylesheet" href="https://cdn-static.smember.com.vn/_next/static/css/caa55ffef1c9dcc3.css" data-precedence="next">
      <link rel="stylesheet" href="https://cdn-static.smember.com.vn/_next/static/css/3ea64ba4fb4b5a07.css" data-precedence="next">
      <title>Smember | Tri ân khách hàng thân thiết - Tích điểm đổi quà</title>
      <style type="text/css">[data-vaul-drawer]{touch-action:none;will-change:transform;transition:transform .5s cubic-bezier(.32, .72, 0, 1);animation-duration:.5s;animation-timing-function:cubic-bezier(0.32,0.72,0,1)}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=bottom][data-state=open]{animation-name:slideFromBottom}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=bottom][data-state=closed]{animation-name:slideToBottom}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=top][data-state=open]{animation-name:slideFromTop}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=top][data-state=closed]{animation-name:slideToTop}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=left][data-state=open]{animation-name:slideFromLeft}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=left][data-state=closed]{animation-name:slideToLeft}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=right][data-state=open]{animation-name:slideFromRight}[data-vaul-drawer][data-vaul-snap-points=false][data-vaul-drawer-direction=right][data-state=closed]{animation-name:slideToRight}[data-vaul-drawer][data-vaul-snap-points=true][data-vaul-drawer-direction=bottom]{transform:translate3d(0,var(--initial-transform,100%),0)}[data-vaul-drawer][data-vaul-snap-points=true][data-vaul-drawer-direction=top]{transform:translate3d(0,calc(var(--initial-transform,100%) * -1),0)}[data-vaul-drawer][data-vaul-snap-points=true][data-vaul-drawer-direction=left]{transform:translate3d(calc(var(--initial-transform,100%) * -1),0,0)}[data-vaul-drawer][data-vaul-snap-points=true][data-vaul-drawer-direction=right]{transform:translate3d(var(--initial-transform,100%),0,0)}[data-vaul-drawer][data-vaul-delayed-snap-points=true][data-vaul-drawer-direction=top]{transform:translate3d(0,var(--snap-point-height,0),0)}[data-vaul-drawer][data-vaul-delayed-snap-points=true][data-vaul-drawer-direction=bottom]{transform:translate3d(0,var(--snap-point-height,0),0)}[data-vaul-drawer][data-vaul-delayed-snap-points=true][data-vaul-drawer-direction=left]{transform:translate3d(var(--snap-point-height,0),0,0)}[data-vaul-drawer][data-vaul-delayed-snap-points=true][data-vaul-drawer-direction=right]{transform:translate3d(var(--snap-point-height,0),0,0)}[data-vaul-overlay][data-vaul-snap-points=false]{animation-duration:.5s;animation-timing-function:cubic-bezier(0.32,0.72,0,1)}[data-vaul-overlay][data-vaul-snap-points=false][data-state=open]{animation-name:fadeIn}[data-vaul-overlay][data-state=closed]{animation-name:fadeOut}[data-vaul-animate=false]{animation:none!important}[data-vaul-overlay][data-vaul-snap-points=true]{opacity:0;transition:opacity .5s cubic-bezier(.32, .72, 0, 1)}[data-vaul-overlay][data-vaul-snap-points=true]{opacity:1}[data-vaul-drawer]:not([data-vaul-custom-container=true])::after{content:'';position:absolute;background:inherit;background-color:inherit}[data-vaul-drawer][data-vaul-drawer-direction=top]::after{top:initial;bottom:100%;left:0;right:0;height:200%}[data-vaul-drawer][data-vaul-drawer-direction=bottom]::after{top:100%;bottom:initial;left:0;right:0;height:200%}[data-vaul-drawer][data-vaul-drawer-direction=left]::after{left:initial;right:100%;top:0;bottom:0;width:200%}[data-vaul-drawer][data-vaul-drawer-direction=right]::after{left:100%;right:initial;top:0;bottom:0;width:200%}[data-vaul-overlay][data-vaul-snap-points=true]:not([data-vaul-snap-points-overlay=true]):not(
         [data-state=closed]
         ){opacity:0}[data-vaul-overlay][data-vaul-snap-points-overlay=true]{opacity:1}[data-vaul-handle]{display:block;position:relative;opacity:.7;background:#e2e2e4;margin-left:auto;margin-right:auto;height:5px;width:32px;border-radius:1rem;touch-action:pan-y}[data-vaul-handle]:active,[data-vaul-handle]:hover{opacity:1}[data-vaul-handle-hitarea]{position:absolute;left:50%;top:50%;transform:translate(-50%,-50%);width:max(100%,2.75rem);height:max(100%,2.75rem);touch-action:inherit}@media (hover:hover) and (pointer:fine){[data-vaul-drawer]{user-select:none}}@media (pointer:fine){[data-vaul-handle-hitarea]:{width:100%;height:100%}}@keyframes fadeIn{from{opacity:0}to{opacity:1}}@keyframes fadeOut{to{opacity:0}}@keyframes slideFromBottom{from{transform:translate3d(0,var(--initial-transform,100%),0)}to{transform:translate3d(0,0,0)}}@keyframes slideToBottom{to{transform:translate3d(0,var(--initial-transform,100%),0)}}@keyframes slideFromTop{from{transform:translate3d(0,calc(var(--initial-transform,100%) * -1),0)}to{transform:translate3d(0,0,0)}}@keyframes slideToTop{to{transform:translate3d(0,calc(var(--initial-transform,100%) * -1),0)}}@keyframes slideFromLeft{from{transform:translate3d(calc(var(--initial-transform,100%) * -1),0,0)}to{transform:translate3d(0,0,0)}}@keyframes slideToLeft{to{transform:translate3d(calc(var(--initial-transform,100%) * -1),0,0)}}@keyframes slideFromRight{from{transform:translate3d(var(--initial-transform,100%),0,0)}to{transform:translate3d(0,0,0)}}@keyframes slideToRight{to{transform:translate3d(var(--initial-transform,100%),0,0)}}
      </style>
      <style type="text/css">[data-sonner-toaster][dir=ltr],html[dir=ltr]{--toast-icon-margin-start:-3px;--toast-icon-margin-end:4px;--toast-svg-margin-start:-1px;--toast-svg-margin-end:0px;--toast-button-margin-start:auto;--toast-button-margin-end:0;--toast-close-button-start:0;--toast-close-button-end:unset;--toast-close-button-transform:translate(-35%, -35%)}[data-sonner-toaster][dir=rtl],html[dir=rtl]{--toast-icon-margin-start:4px;--toast-icon-margin-end:-3px;--toast-svg-margin-start:0px;--toast-svg-margin-end:-1px;--toast-button-margin-start:0;--toast-button-margin-end:auto;--toast-close-button-start:unset;--toast-close-button-end:0;--toast-close-button-transform:translate(35%, -35%)}[data-sonner-toaster]{position:fixed;width:var(--width);font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;--gray1:hsl(0, 0%, 99%);--gray2:hsl(0, 0%, 97.3%);--gray3:hsl(0, 0%, 95.1%);--gray4:hsl(0, 0%, 93%);--gray5:hsl(0, 0%, 90.9%);--gray6:hsl(0, 0%, 88.7%);--gray7:hsl(0, 0%, 85.8%);--gray8:hsl(0, 0%, 78%);--gray9:hsl(0, 0%, 56.1%);--gray10:hsl(0, 0%, 52.3%);--gray11:hsl(0, 0%, 43.5%);--gray12:hsl(0, 0%, 9%);--border-radius:8px;box-sizing:border-box;padding:0;margin:0;list-style:none;outline:0;z-index:999999999;transition:transform .4s ease}[data-sonner-toaster][data-lifted=true]{transform:translateY(-8px)}@media (hover:none) and (pointer:coarse){[data-sonner-toaster][data-lifted=true]{transform:none}}[data-sonner-toaster][data-x-position=right]{right:var(--offset-right)}[data-sonner-toaster][data-x-position=left]{left:var(--offset-left)}[data-sonner-toaster][data-x-position=center]{left:50%;transform:translateX(-50%)}[data-sonner-toaster][data-y-position=top]{top:var(--offset-top)}[data-sonner-toaster][data-y-position=bottom]{bottom:var(--offset-bottom)}[data-sonner-toast]{--y:translateY(100%);--lift-amount:calc(var(--lift) * var(--gap));z-index:var(--z-index);position:absolute;opacity:0;transform:var(--y);touch-action:none;transition:transform .4s,opacity .4s,height .4s,box-shadow .2s;box-sizing:border-box;outline:0;overflow-wrap:anywhere}[data-sonner-toast][data-styled=true]{padding:16px;background:var(--normal-bg);border:1px solid var(--normal-border);color:var(--normal-text);border-radius:var(--border-radius);box-shadow:0 4px 12px rgba(0,0,0,.1);width:var(--width);font-size:13px;display:flex;align-items:center;gap:6px}[data-sonner-toast]:focus-visible{box-shadow:0 4px 12px rgba(0,0,0,.1),0 0 0 2px rgba(0,0,0,.2)}[data-sonner-toast][data-y-position=top]{top:0;--y:translateY(-100%);--lift:1;--lift-amount:calc(1 * var(--gap))}[data-sonner-toast][data-y-position=bottom]{bottom:0;--y:translateY(100%);--lift:-1;--lift-amount:calc(var(--lift) * var(--gap))}[data-sonner-toast][data-styled=true] [data-description]{font-weight:400;line-height:1.4;color:#3f3f3f}[data-rich-colors=true][data-sonner-toast][data-styled=true] [data-description]{color:inherit}[data-sonner-toaster][data-sonner-theme=dark] [data-description]{color:#e8e8e8}[data-sonner-toast][data-styled=true] [data-title]{font-weight:500;line-height:1.5;color:inherit}[data-sonner-toast][data-styled=true] [data-icon]{display:flex;height:16px;width:16px;position:relative;justify-content:flex-start;align-items:center;flex-shrink:0;margin-left:var(--toast-icon-margin-start);margin-right:var(--toast-icon-margin-end)}[data-sonner-toast][data-promise=true] [data-icon]>svg{opacity:0;transform:scale(.8);transform-origin:center;animation:sonner-fade-in .3s ease forwards}[data-sonner-toast][data-styled=true] [data-icon]>*{flex-shrink:0}[data-sonner-toast][data-styled=true] [data-icon] svg{margin-left:var(--toast-svg-margin-start);margin-right:var(--toast-svg-margin-end)}[data-sonner-toast][data-styled=true] [data-content]{display:flex;flex-direction:column;gap:2px}[data-sonner-toast][data-styled=true] [data-button]{border-radius:4px;padding-left:8px;padding-right:8px;height:24px;font-size:12px;color:var(--normal-bg);background:var(--normal-text);margin-left:var(--toast-button-margin-start);margin-right:var(--toast-button-margin-end);border:none;font-weight:500;cursor:pointer;outline:0;display:flex;align-items:center;flex-shrink:0;transition:opacity .4s,box-shadow .2s}[data-sonner-toast][data-styled=true] [data-button]:focus-visible{box-shadow:0 0 0 2px rgba(0,0,0,.4)}[data-sonner-toast][data-styled=true] [data-button]:first-of-type{margin-left:var(--toast-button-margin-start);margin-right:var(--toast-button-margin-end)}[data-sonner-toast][data-styled=true] [data-cancel]{color:var(--normal-text);background:rgba(0,0,0,.08)}[data-sonner-toaster][data-sonner-theme=dark] [data-sonner-toast][data-styled=true] [data-cancel]{background:rgba(255,255,255,.3)}[data-sonner-toast][data-styled=true] [data-close-button]{position:absolute;left:var(--toast-close-button-start);right:var(--toast-close-button-end);top:0;height:20px;width:20px;display:flex;justify-content:center;align-items:center;padding:0;color:var(--gray12);background:var(--normal-bg);border:1px solid var(--gray4);transform:var(--toast-close-button-transform);border-radius:50%;cursor:pointer;z-index:1;transition:opacity .1s,background .2s,border-color .2s}[data-sonner-toast][data-styled=true] [data-close-button]:focus-visible{box-shadow:0 4px 12px rgba(0,0,0,.1),0 0 0 2px rgba(0,0,0,.2)}[data-sonner-toast][data-styled=true] [data-disabled=true]{cursor:not-allowed}[data-sonner-toast][data-styled=true]:hover [data-close-button]:hover{background:var(--gray2);border-color:var(--gray5)}[data-sonner-toast][data-swiping=true]::before{content:'';position:absolute;left:-100%;right:-100%;height:100%;z-index:-1}[data-sonner-toast][data-y-position=top][data-swiping=true]::before{bottom:50%;transform:scaleY(3) translateY(50%)}[data-sonner-toast][data-y-position=bottom][data-swiping=true]::before{top:50%;transform:scaleY(3) translateY(-50%)}[data-sonner-toast][data-swiping=false][data-removed=true]::before{content:'';position:absolute;inset:0;transform:scaleY(2)}[data-sonner-toast][data-expanded=true]::after{content:'';position:absolute;left:0;height:calc(var(--gap) + 1px);bottom:100%;width:100%}[data-sonner-toast][data-mounted=true]{--y:translateY(0);opacity:1}[data-sonner-toast][data-expanded=false][data-front=false]{--scale:var(--toasts-before) * 0.05 + 1;--y:translateY(calc(var(--lift-amount) * var(--toasts-before))) scale(calc(-1 * var(--scale)));height:var(--front-toast-height)}[data-sonner-toast]>*{transition:opacity .4s}[data-sonner-toast][data-x-position=right]{right:0}[data-sonner-toast][data-x-position=left]{left:0}[data-sonner-toast][data-expanded=false][data-front=false][data-styled=true]>*{opacity:0}[data-sonner-toast][data-visible=false]{opacity:0;pointer-events:none}[data-sonner-toast][data-mounted=true][data-expanded=true]{--y:translateY(calc(var(--lift) * var(--offset)));height:var(--initial-height)}[data-sonner-toast][data-removed=true][data-front=true][data-swipe-out=false]{--y:translateY(calc(var(--lift) * -100%));opacity:0}[data-sonner-toast][data-removed=true][data-front=false][data-swipe-out=false][data-expanded=true]{--y:translateY(calc(var(--lift) * var(--offset) + var(--lift) * -100%));opacity:0}[data-sonner-toast][data-removed=true][data-front=false][data-swipe-out=false][data-expanded=false]{--y:translateY(40%);opacity:0;transition:transform .5s,opacity .2s}[data-sonner-toast][data-removed=true][data-front=false]::before{height:calc(var(--initial-height) + 20%)}[data-sonner-toast][data-swiping=true]{transform:var(--y) translateY(var(--swipe-amount-y,0)) translateX(var(--swipe-amount-x,0));transition:none}[data-sonner-toast][data-swiped=true]{user-select:none}[data-sonner-toast][data-swipe-out=true][data-y-position=bottom],[data-sonner-toast][data-swipe-out=true][data-y-position=top]{animation-duration:.2s;animation-timing-function:ease-out;animation-fill-mode:forwards}[data-sonner-toast][data-swipe-out=true][data-swipe-direction=left]{animation-name:swipe-out-left}[data-sonner-toast][data-swipe-out=true][data-swipe-direction=right]{animation-name:swipe-out-right}[data-sonner-toast][data-swipe-out=true][data-swipe-direction=up]{animation-name:swipe-out-up}[data-sonner-toast][data-swipe-out=true][data-swipe-direction=down]{animation-name:swipe-out-down}@keyframes swipe-out-left{from{transform:var(--y) translateX(var(--swipe-amount-x));opacity:1}to{transform:var(--y) translateX(calc(var(--swipe-amount-x) - 100%));opacity:0}}@keyframes swipe-out-right{from{transform:var(--y) translateX(var(--swipe-amount-x));opacity:1}to{transform:var(--y) translateX(calc(var(--swipe-amount-x) + 100%));opacity:0}}@keyframes swipe-out-up{from{transform:var(--y) translateY(var(--swipe-amount-y));opacity:1}to{transform:var(--y) translateY(calc(var(--swipe-amount-y) - 100%));opacity:0}}@keyframes swipe-out-down{from{transform:var(--y) translateY(var(--swipe-amount-y));opacity:1}to{transform:var(--y) translateY(calc(var(--swipe-amount-y) + 100%));opacity:0}}@media (max-width:600px){[data-sonner-toaster]{position:fixed;right:var(--mobile-offset-right);left:var(--mobile-offset-left);width:100%}[data-sonner-toaster][dir=rtl]{left:calc(var(--mobile-offset-left) * -1)}[data-sonner-toaster] [data-sonner-toast]{left:0;right:0;width:calc(100% - var(--mobile-offset-left) * 2)}[data-sonner-toaster][data-x-position=left]{left:var(--mobile-offset-left)}[data-sonner-toaster][data-y-position=bottom]{bottom:var(--mobile-offset-bottom)}[data-sonner-toaster][data-y-position=top]{top:var(--mobile-offset-top)}[data-sonner-toaster][data-x-position=center]{left:var(--mobile-offset-left);right:var(--mobile-offset-right);transform:none}}[data-sonner-toaster][data-sonner-theme=light]{--normal-bg:#fff;--normal-border:var(--gray4);--normal-text:var(--gray12);--success-bg:hsl(143, 85%, 96%);--success-border:hsl(145, 92%, 87%);--success-text:hsl(140, 100%, 27%);--info-bg:hsl(208, 100%, 97%);--info-border:hsl(221, 91%, 93%);--info-text:hsl(210, 92%, 45%);--warning-bg:hsl(49, 100%, 97%);--warning-border:hsl(49, 91%, 84%);--warning-text:hsl(31, 92%, 45%);--error-bg:hsl(359, 100%, 97%);--error-border:hsl(359, 100%, 94%);--error-text:hsl(360, 100%, 45%)}[data-sonner-toaster][data-sonner-theme=light] [data-sonner-toast][data-invert=true]{--normal-bg:#000;--normal-border:hsl(0, 0%, 20%);--normal-text:var(--gray1)}[data-sonner-toaster][data-sonner-theme=dark] [data-sonner-toast][data-invert=true]{--normal-bg:#fff;--normal-border:var(--gray3);--normal-text:var(--gray12)}[data-sonner-toaster][data-sonner-theme=dark]{--normal-bg:#000;--normal-bg-hover:hsl(0, 0%, 12%);--normal-border:hsl(0, 0%, 20%);--normal-border-hover:hsl(0, 0%, 25%);--normal-text:var(--gray1);--success-bg:hsl(150, 100%, 6%);--success-border:hsl(147, 100%, 12%);--success-text:hsl(150, 86%, 65%);--info-bg:hsl(215, 100%, 6%);--info-border:hsl(223, 43%, 17%);--info-text:hsl(216, 87%, 65%);--warning-bg:hsl(64, 100%, 6%);--warning-border:hsl(60, 100%, 9%);--warning-text:hsl(46, 87%, 65%);--error-bg:hsl(358, 76%, 10%);--error-border:hsl(357, 89%, 16%);--error-text:hsl(358, 100%, 81%)}[data-sonner-toaster][data-sonner-theme=dark] [data-sonner-toast] [data-close-button]{background:var(--normal-bg);border-color:var(--normal-border);color:var(--normal-text)}[data-sonner-toaster][data-sonner-theme=dark] [data-sonner-toast] [data-close-button]:hover{background:var(--normal-bg-hover);border-color:var(--normal-border-hover)}[data-rich-colors=true][data-sonner-toast][data-type=success]{background:var(--success-bg);border-color:var(--success-border);color:var(--success-text)}[data-rich-colors=true][data-sonner-toast][data-type=success] [data-close-button]{background:var(--success-bg);border-color:var(--success-border);color:var(--success-text)}[data-rich-colors=true][data-sonner-toast][data-type=info]{background:var(--info-bg);border-color:var(--info-border);color:var(--info-text)}[data-rich-colors=true][data-sonner-toast][data-type=info] [data-close-button]{background:var(--info-bg);border-color:var(--info-border);color:var(--info-text)}[data-rich-colors=true][data-sonner-toast][data-type=warning]{background:var(--warning-bg);border-color:var(--warning-border);color:var(--warning-text)}[data-rich-colors=true][data-sonner-toast][data-type=warning] [data-close-button]{background:var(--warning-bg);border-color:var(--warning-border);color:var(--warning-text)}[data-rich-colors=true][data-sonner-toast][data-type=error]{background:var(--error-bg);border-color:var(--error-border);color:var(--error-text)}[data-rich-colors=true][data-sonner-toast][data-type=error] [data-close-button]{background:var(--error-bg);border-color:var(--error-border);color:var(--error-text)}.sonner-loading-wrapper{--size:16px;height:var(--size);width:var(--size);position:absolute;inset:0;z-index:10}.sonner-loading-wrapper[data-visible=false]{transform-origin:center;animation:sonner-fade-out .2s ease forwards}.sonner-spinner{position:relative;top:50%;left:50%;height:var(--size);width:var(--size)}.sonner-loading-bar{animation:sonner-spin 1.2s linear infinite;background:var(--gray11);border-radius:6px;height:8%;left:-10%;position:absolute;top:-3.9%;width:24%}.sonner-loading-bar:first-child{animation-delay:-1.2s;transform:rotate(.0001deg) translate(146%)}.sonner-loading-bar:nth-child(2){animation-delay:-1.1s;transform:rotate(30deg) translate(146%)}.sonner-loading-bar:nth-child(3){animation-delay:-1s;transform:rotate(60deg) translate(146%)}.sonner-loading-bar:nth-child(4){animation-delay:-.9s;transform:rotate(90deg) translate(146%)}.sonner-loading-bar:nth-child(5){animation-delay:-.8s;transform:rotate(120deg) translate(146%)}.sonner-loading-bar:nth-child(6){animation-delay:-.7s;transform:rotate(150deg) translate(146%)}.sonner-loading-bar:nth-child(7){animation-delay:-.6s;transform:rotate(180deg) translate(146%)}.sonner-loading-bar:nth-child(8){animation-delay:-.5s;transform:rotate(210deg) translate(146%)}.sonner-loading-bar:nth-child(9){animation-delay:-.4s;transform:rotate(240deg) translate(146%)}.sonner-loading-bar:nth-child(10){animation-delay:-.3s;transform:rotate(270deg) translate(146%)}.sonner-loading-bar:nth-child(11){animation-delay:-.2s;transform:rotate(300deg) translate(146%)}.sonner-loading-bar:nth-child(12){animation-delay:-.1s;transform:rotate(330deg) translate(146%)}@keyframes sonner-fade-in{0%{opacity:0;transform:scale(.8)}100%{opacity:1;transform:scale(1)}}@keyframes sonner-fade-out{0%{opacity:1;transform:scale(1)}100%{opacity:0;transform:scale(.8)}}@keyframes sonner-spin{0%{opacity:1}100%{opacity:.15}}@media (prefers-reduced-motion){.sonner-loading-bar,[data-sonner-toast],[data-sonner-toast]>*{transition:none!important;animation:none!important}}.sonner-loader{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);transform-origin:center;transition:opacity .2s,transform .2s}.sonner-loader[data-visible=false]{opacity:0;transform:scale(.8) translate(-50%,-50%)}</style>
      <meta http-equiv="origin-trial" content="A8o5T4MyEkRZqLA9WeG2XTFdV5tsX2Prg85xyQ+RL1btVuybB1K/EQ+7JUsPK+J32oBMTnsoF9B4A+qTlL6efgQAAABweyJvcmlnaW4iOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb206NDQzIiwiZmVhdHVyZSI6IkZlZENtQnV0dG9uTW9kZSIsImV4cGlyeSI6MTc0NDY3NTIwMCwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ==">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
      <meta name="theme-color" content="#FFFFFF">
      <meta name="next-size-adjust" content="">
      <meta name="description" content="Quà tặng tri ân khách hàng thân thiết - VIP membership . Tích điểm Smember săn voucher, mức chiết khấu và ưu đãi sinh nhật hấp dẫn.">
      <link rel="manifest" href="/manifest.webmanifest">
      <meta name="keywords" content="Smember,Tri ân khách hàng,Khách hàng thân thiết,Tích điểm đổi quà">
      <meta name="robots" content="index, follow">
      <link rel="canonical" href="http://localhost:8080/">
      <meta property="og:title" content="Smember | Tri ân khách hàng thân thiết - Tích điểm đổi quà">
      <meta property="og:description" content="Quà tặng tri ân khách hàng thân thiết - VIP membership . Tích điểm Smember săn voucher, mức chiết khấu và ưu đãi sinh nhật hấp dẫn.">
      <meta property="og:url" content="http://localhost:8080/">
      <meta property="og:site_name" content="Web Smember">
      <meta property="og:locale" content="vi_VN">
      <meta property="og:type" content="website">
      <meta name="twitter:card" content="summary">
      <meta name="twitter:title" content="Smember | Tri ân khách hàng thân thiết - Tích điểm đổi quà">
      <meta name="twitter:description" content="Quà tặng tri ân khách hàng thân thiết - VIP membership . Tích điểm Smember săn voucher, mức chiết khấu và ưu đãi sinh nhật hấp dẫn.">
   </head>
   <body class="__className_f92a78">
      <style>
         :root {
         --bprogress-color: #06b6d4;
         --bprogress-height: 3px;
         --bprogress-spinner-size: 18px;
         --bprogress-spinner-animation-duration: 400ms;
         --bprogress-spinner-border-size: 2px;
         --bprogress-box-shadow: 0 0 10px #06b6d4, 0 0 5px #06b6d4;
         --bprogress-z-index: 99999;
         --bprogress-spinner-top: 15px;
         --bprogress-spinner-bottom: auto;
         --bprogress-spinner-right: 15px;
         --bprogress-spinner-left: auto;
         }
         .bprogress {
         width: 0;
         height: 0;
         pointer-events: none;
         z-index: var(--bprogress-z-index);
         }
         .bprogress .bar {
         background: var(--bprogress-color);
         position: fixed;
         z-index: var(--bprogress-z-index);
         top: 0;
         left: 0;
         width: 100%;
         height: var(--bprogress-height);
         }
         /* Fancy blur effect */
         .bprogress .peg {
         display: block;
         position: absolute;
         right: 0;
         width: 100px;
         height: 100%;
         box-shadow: var(--bprogress-box-shadow);
         opacity: 1.0;
         transform: rotate(3deg) translate(0px, -4px);
         }
         /* Remove these to get rid of the spinner */
         .bprogress .spinner {
         display: block;
         position: fixed;
         z-index: var(--bprogress-z-index);
         top: var(--bprogress-spinner-top);
         bottom: var(--bprogress-spinner-bottom);
         right: var(--bprogress-spinner-right);
         left: var(--bprogress-spinner-left);
         }
         .bprogress .spinner-icon {
         width: var(--bprogress-spinner-size);
         height: var(--bprogress-spinner-size);
         box-sizing: border-box;
         border: solid var(--bprogress-spinner-border-size) transparent;
         border-top-color: var(--bprogress-color);
         border-left-color: var(--bprogress-color);
         border-radius: 50%;
         -webkit-animation: bprogress-spinner var(--bprogress-spinner-animation-duration) linear infinite;
         animation: bprogress-spinner var(--bprogress-spinner-animation-duration) linear infinite;
         }
         .bprogress-custom-parent {
         overflow: hidden;
         position: relative;
         }
         .bprogress-custom-parent .bprogress .spinner,
         .bprogress-custom-parent .bprogress .bar {
         position: absolute;
         }
         .bprogress .indeterminate {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         height: var(--bprogress-height);
         overflow: hidden;
         }
         .bprogress .indeterminate .inc,
         .bprogress .indeterminate .dec {
         position: absolute;
         top: 0;
         height: 100%;
         background-color: var(--bprogress-color);
         }
         .bprogress .indeterminate .inc {
         animation: bprogress-indeterminate-increase 2s infinite;
         }
         .bprogress .indeterminate .dec {
         animation: bprogress-indeterminate-decrease 2s 0.5s infinite;
         }
         @-webkit-keyframes bprogress-spinner {
         0%   { -webkit-transform: rotate(0deg); transform: rotate(0deg); }
         100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); }
         }
         @keyframes bprogress-spinner {
         0%   { transform: rotate(0deg); }
         100% { transform: rotate(360deg); }
         }
         @keyframes bprogress-indeterminate-increase {
         from { left: -5%; width: 5%; }
         to { left: 130%; width: 100%; }
         }
         @keyframes bprogress-indeterminate-decrease {
         from { left: -80%; width: 80%; }
         to { left: 110%; width: 10%; }
         }
      </style>
      <div class="min-h-screen w-full">
         <div class="w-full px-1x-small py-large tablet:px-large tablet:py-4x-large">
            <div class="w-full max-w-[800px] mx-auto flex flex-col justify-center items-center gap-medium">
               <h1 class="text-medium tablet:text-3x-large laptop:text-4x-large text-center tablet:text-primary-500 font-bold">Đăng ký trở thành MEMBER</h1>
               <img alt="Register Ant" title="Register Ant" loading="lazy" width="300" height="300" decoding="async" data-nimg="1" class="w-[112px] h-[112px] tablet:w-[180px] tablet:h-[180px] object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/register-ant.b75b959d.png" style="color: transparent;"><span class="font-regular text-base tablet:text-medium text-neutral-500">Đăng ký bằng tài khoản mạng xã hội</span>
               <div class="w-full flex gap-medium tablet:gap-large justify-center tablet:justify-between items-center max-w-[450px]"><button type="button" class="transition-all duration-300 active:scale-95 cursor-pointer rounded-base inline-flex w-[60px] h-[60px] tablet:flex-1 tablet:min-w-[120px] tablet:w-auto font-medium text-neutral-900 justify-center items-center gap-2x-small" style="box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 24px -4px, rgba(0, 0, 0, 0.06) 0px 1px 4px 0px;" fdprocessedid="29uexs"><img alt="Google" title="Google" loading="lazy" width="25" height="24" decoding="async" data-nimg="1" class="object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/logo-google.b6f9570f.svg" style="color: transparent;"><span class="hidden tablet:block">Google</span></button><button type="button" class="transition-all duration-300 active:scale-95 cursor-pointer rounded-base inline-flex w-[60px] h-[60px] tablet:flex-1 tablet:min-w-[120px] tablet:w-auto font-medium text-neutral-900 justify-center items-center gap-2x-small" style="box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 24px -4px, rgba(0, 0, 0, 0.06) 0px 1px 4px 0px;" fdprocessedid="d7omh"><img alt="Google" title="Google" loading="lazy" width="21" height="20" decoding="async" data-nimg="1" class="object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/logo-zalo.120d889f.svg" style="color: transparent;"><span class="hidden tablet:block">Zalo</span></button></div>
               <span class="font-regular text-base tablet:text-medium text-neutral-500">Hoặc điền thông tin sau</span>
               <form class="w-full flex flex-col gap-medium relative" action="/RegistrationForm" method="post">
                  <h2 class="font-bold text-medium tablet:text-large">Thông tin cá nhân</h2>
                  <div class="w-full grid grid-cols-1 tablet:grid-cols-2 gap-medium items-stretch">
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">
                        Họ và tên </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                            placeholder="Nhập họ và tên" maxlength="255" value="" id="fullName" name="nguoiNhan" fdprocessedid="pbgywo"></div>
                        </div>
                        <div id="nameError" style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Họ và tên không hợp lệ</div>
                     </div>
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Ngày sinh </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                              <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" 
                              placeholder="dd/mm/yyyy" min="1900-01-01" max="2999-12-31" lang="vi-VN" type="text" value="" id="birthday" name="ngaySinh" fdprocessedid="peitok">
                              <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square ">
                                 <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:select-none cpsui:cursor-pointer cpsui:rounded-base cpsui:hover:bg-neutral-100 cpsui:h-[30px] cpsui:w-[30px]"
                                  type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«r0»" data-state="closed" data-slot="popover-trigger">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round"
                                     class="cpsui:text-neutral-600" height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M8 2v4"></path>
                                       <path d="M16 2v4"></path>
                                       <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                                       <path d="M3 10h18"></path>
                                    </svg>
                                 </div>
                              </div>
                           </div>
                        <div id="dateError" style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Định dạng ngày không hợp lệ</div>
                        </div>
                     </div>
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Số điện thoại </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" 
                           placeholder="Nhập số điện thoại" maxlength="10" value="" id="phone" name="sdt" fdprocessedid="yivla"></div>
                           <div id="phoneError"  style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Số điện thoại không hợp lệ</div>
                        </div>
                     </div>
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base"><span>Email <span class="text-small font-regular text-neutral-400">(Không bắt buộc)</span></span> </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                            placeholder="Nhập email" maxlength="255" value="" id="email" name="email" fdprocessedid="5ahg18"></div>
                           <div id="emailSucces" style="display:flex" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-positive-700 cpsui:text-small">
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"></path>
                              </svg>
                              Hóa đơn VAT khi mua hàng sẽ được gửi qua email này
                           </div>
                           <div id="emailError" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Email không hợp lệ</div>
                        </div>
                     </div>
                  </div>
                  <h2 class="font-bold text-medium tablet:text-large">Tạo mật khẩu</h2>
                  <div class="w-full grid grid-cols-1 tablet:grid-cols-2 gap-medium items-stretch">
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Mật khẩu </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                              <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap cpsui:[&amp;::-ms-reveal]:hidden cpsui:[&amp;::-ms-clear]:hidden cpsui:appearance-none cpsui:-webkit-appearance-none"
                               autocomplete="off" autocapitalize="off" spellcheck="false" placeholder="Nhập mật khẩu của bạn" type="password" id="matKhau" value="" name="matKhau" fdprocessedid="p8swwv">
                              <button type="button" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Show password">
                                 <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="0.8em" width="0.8em" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path>
                                 </svg>
                              </button>
                           </div>
                           <div  id="passwordError" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-neutral-600 cpsui:text-small">
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path>
                              </svg>
                              Mật khẩu tối thiểu 6 ký tự, có ít nhất 1 chữ số và 1 số
                           </div>
                        </div>
                     </div>
                     <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                        <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Nhập lại mật khẩu </label>
                        <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                           <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                              <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap cpsui:[&amp;::-ms-reveal]:hidden cpsui:[&amp;::-ms-clear]:hidden cpsui:appearance-none cpsui:-webkit-appearance-none" 
                              autocomplete="off" autocapitalize="off" spellcheck="false" placeholder="Nhập lại mật khẩu của bạn" type="password" value="" id="confirmPassword" fdprocessedid="f8qb1k">
                              <button type="button" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Show password">
                                 <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="0.8em" width="0.8em" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path>
                                 </svg>
                              </button>
                           </div>
                           <div id="confirmPasswordError" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small" style="display: flex;"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Mật khẩu không khớp</div>
                        </div>
                     </div>
                  </div>
                  <div class="w-full grid grid-cols-1 gap-medium items-stretch py-medium">
                     <div class="flex gap-1x-small items-center"><label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base font-regular !inline-block text-base">Bằng việc Đăng ký, bạn đã đọc và đồng ý với <a class="font-bold text-info-500" target="_blank" href="">Điều khoản sử dụng</a> và <a class="font-bold text-info-500" target="_blank" href="">Chính sách bảo mật</a>.</label></div>
                  </div>
                  <div class="w-full h-0 border-t-[1px]" style="border-image: repeating-linear-gradient(90deg, rgb(207, 207, 211) 0px, rgb(207, 207, 211) 8px, transparent 8px, transparent 16px) 8 / 1 / 0 stretch;"></div>
                  <div class="w-full flex flex-col items-center pb-[100px] gap-medium"></div>
                  <div class="shadow-group-button w-full z-10 box-content grid px-1x-small tablet:px-medium py-medium grid-cols-2 gap-medium sticky bottom-0 left-0 right-0 bg-pure-white translate-x-[-8px] tablet:translate-x-[-16px]">
                     <a class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-neutral-300 cpsui:text-neutral-800 cpsui:bg-pure-white cpsui:hover:border-neutral-400 cpsui:hover:bg-neutral-50 cpsui:disabled:border-black-300 cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white w-full px-0 tablet:px-medium font-medium flex gap-1x-small items-center" data-slot="button" type="button" href="/loginView">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="tablet:inline-block hidden" height="22" width="22" xmlns="http://www.w3.org/2000/svg">
                           <path d="M217.9 256L345 129c9.4-9.4 9.4-24.6 0-33.9-9.4-9.4-24.6-9.3-34 0L167 239c-9.1 9.1-9.3 23.7-.7 33.1L310.9 417c4.7 4.7 10.9 7 17 7s12.3-2.3 17-7c9.4-9.4 9.4-24.6 0-33.9L217.9 256z"></path>
                        </svg>
                        Quay lại đăng nhập
                     </a>
                     <button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" type="submit" fdprocessedid="6yh8so">Hoàn tất đăng ký</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
     
      <div>
         <div class="grecaptcha-badge" data-style="bottomright" style="width: 256px; height: 60px; display: block; transition: right 0.3s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;">
            <div class="grecaptcha-logo"><iframe title="reCAPTCHA" width="256" height="60" role="presentation" name="a-67rh1d2shlgt" frameborder="0" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6LciitkqAAAAAPx7pAQBXIsJHmqwIdl4Ks9GyefN&amp;co=aHR0cHM6Ly9zbWVtYmVyLmNvbS52bjo0NDM.&amp;hl=vi&amp;v=TkacYOdEJbdB_JjX802TMer9&amp;size=invisible&amp;anchor-ms=20000&amp;execute-ms=15000&amp;cb=3079l5xhb2v6"></iframe></div>
            <div class="grecaptcha-error"></div>
            <textarea id="g-recaptcha-response-100000" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
         </div>
         <iframe style="display: none;"></iframe>
      </div>
      <span id="PING_IFRAME_FORM_DETECTION" style="display: none;"></span><iframe sandbox="" style="display: none;"></iframe>
   </body>
   <iframe id="ce_proto_iframe" title="CrazyEgg Tracking iframe" style="display: none;"></iframe>
   <script src="/assets/js/dangky.js"></script>
</html>
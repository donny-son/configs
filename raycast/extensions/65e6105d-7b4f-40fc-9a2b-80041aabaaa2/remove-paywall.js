"use strict";var o=Object.defineProperty;var c=Object.getOwnPropertyDescriptor;var u=Object.getOwnPropertyNames;var f=Object.prototype.hasOwnProperty;var m=(e,r)=>{for(var t in r)o(e,t,{get:r[t],enumerable:!0})},g=(e,r,t,i)=>{if(r&&typeof r=="object"||typeof r=="function")for(let n of u(r))!f.call(e,n)&&n!==t&&o(e,n,{get:()=>r[n],enumerable:!(i=c(r,n))||i.enumerable});return e};var w=e=>g(o({},"__esModule",{value:!0}),e);var v={};m(v,{default:()=>y});module.exports=w(v);var a=require("@raycast/api");var s=require("@raycast/api"),p=/(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_+.~#?&//=]*)/;function d(e){return p.test(e)}async function l(){let e;try{e=await(0,s.getSelectedText)()}catch{e=await s.Clipboard.readText()}return e?d(e)?e.trim():new Error(`Invalid URL: "${e}"`):new Error("No URL provided.")}var y=async e=>{let r;e.arguments.service?r=e.arguments.service:r=(await(0,a.getPreferenceValues)()).service;try{let t=await l();if(typeof t!="string")throw t;(0,a.open)(`${r}/${t}`)}catch(t){await(0,a.showToast)({style:a.Toast.Style.Failure,title:"Cannot remove paywall",message:t.message})}};
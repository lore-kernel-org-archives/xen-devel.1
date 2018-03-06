From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl/pvh: force PVH guests to use the
	xenstore shutdown
Date: Tue, 6 Mar 2018 15:56:58 +0000
Message-ID: <23198.47690.407310.223331@mariner.uk.xensource.com>
References: <20171219141752.81060-1-roger.pau@citrix.com>
 <23097.9174.8053.703366@mariner.uk.xensource.com>
 <20171219143839.6rh7t4lecvcbuila@MacBook-Pro-de-Roger.local>
 <23097.9935.662307.121291@mariner.uk.xensource.com>
 <20171219145952.qnv2yxuubpuh25wd@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=euxu=f4=citrix.com=prvs=59674f555=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etExf-0001YR-Ju
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 15:57:07 +0000
In-Reply-To: <20171219145952.qnv2yxuubpuh25wd@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm7DqSB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4bC9wdmg6IGZvcmNlIFBW
SCBndWVzdHMgdG8gdXNlIHRoZSB4ZW5zdG9yZSBzaHV0ZG93biIpOgo+IE9uIFR1ZSwgRGVjIDE5
LCAyMDE3IGF0IDAyOjQ4OjQ3UE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSSB0aGlu
ayB0aGlzIGlzIGEgY2FuZGlkYXRlIGZvciBiYWNrcG9ydGluZyBhcyBmYXIgYXMgNC45ID8KPiAK
PiBZZXMsIDQuMTAgb25seSB0aG91Z2ggKHRoYXQncyB3aGVuIHRoZSBQVkggZ3Vlc3QgdHlwZSB3
YXMgaW50cm9kdWNlZCkKPiBpbiBpdCdzIGN1cnJlbnQgZm9ybS4gNC45IHdpbGwgcmVxdWlyZSBz
b21lIHJld29yayAobGlrZSBjaGVja2luZyBxZW11Cj4gcGlkKS4KCkkgaGF2ZSBhcHBsaWVkIGl0
IHRvIDQuMTAuICBEbyB5b3UgaW50ZW5kIHRvIHByZXBhcmUgdGhhdCBiYWNrcG9ydCBmb3IKNC45
ID8gIEknbSBub3Qgc3VyZSB3aGF0IHJld29yayBpcyByZXF1aXJlZC4KCkFsc28sIHdlIGFyZSBp
bnRlbmRpbmcgdG8gcmVsZWFzZSBhIDQuOCBzdGFibGUgd2l0aCB0aGUgUFZICmJhY2twb3J0LCBz
byBwZXJoYXBzIGl0IG5lZWRzIHRvIGJlIGluIHRoZXJlIHRvby4KClRoYW5rcywKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

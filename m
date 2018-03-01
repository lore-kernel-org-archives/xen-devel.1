From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 3/3] xtf: add minimal HPET functionality
 test
Date: Thu, 1 Mar 2018 09:55:51 +0000
Message-ID: <20180301095551.352sf4iolerddcwy@MacBook-Pro-de-Roger.local>
References: <20180223132743.59804-1-roger.pau@citrix.com>
 <20180223132743.59804-4-roger.pau@citrix.com>
 <20180223190718.pfbszon36aamqelb@citrix.com>
 <20180228153747.i7temuih37ssedu6@MacBook-Pro-de-Roger.local>
 <5A96E5B902000078001ACF24@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=p77i=fx=citrix.com=prvs=59130488e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1erKwW-0007AI-1T
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 09:56:04 +0000
Content-Disposition: inline
In-Reply-To: <5A96E5B902000078001ACF24@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDk6MjQ6MDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjAyLjE4IGF0IDE2OjM3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDc6MDc6MThQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+PiBPbiBGcmksIEZlYiAyMywgMjAxOCBhdCAwMToyNzo0M1BNICswMDAwLCBS
b2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4gPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FyY2gv
bGliLmgKPiA+PiA+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9saWIuaAo+ID4+ID4gQEAg
LTM5Miw2ICszOTIsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX3hjcjAodWludDY0X3Qg
eGNyMCkKPiA+PiA+ICAgICAgeHNldGJ2KDAsIHhjcjApOwo+ID4+ID4gIH0KPiA+PiA+ICAKPiA+
PiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJkdHNjKHZvaWQpCj4gPj4gPiArewo+ID4+ID4g
KyAgICB1aW50MzJfdCBsb3csIGhpZ2g7Cj4gPj4gPiArCj4gPj4gPiArICAgIGFzbSB2b2xhdGls
ZSAoInJkdHNjIiA6ICI9YSIgKGxvdyksICI9ZCIgKGhpZ2gpKTsKPiA+PiA+ICsKPiA+PiAKPiA+
PiBZb3UgcHJvYmFibHkgbmVlZCB0byBhZGQgbGZlbmNlIG9yIG1mZW5jZS4gU2VlIHJkdHNjX29y
ZGVyZWQgaW4gWGVuLgo+ID4gCj4gPiBPaCwgT0sgdGhhdCdzIG5ld3MgdG8gbWUuIEkgZ3Vlc3Mg
anVzdCB1c2luZyBhIGxmZW5jZSBiZWZvcmUgaXQKPiA+IHNob3VsZCBiZSBmaW5lLgo+IAo+IEV4
Y2VwdCB0aGF0IG9uIEFNRCwgd2l0aG91dCBMRkVOQ0UgbWFkZSBkaXNwYXRjaCBzZXJpYWxpemlu
ZywKPiB5b3UnZCBuZWVkIE1GRU5DRS4KClNvIHVzaW5nIGp1c3QgTUZFTkNFIHdpbGwgd29yayBl
dmVyeXdoZXJlIHNpbmNlIHRoYXQncyBtb3JlCnJlc3RyaWN0aXZlIHRoYW4gYSBsZmVuY2U/CgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

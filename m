From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 07/18] xen: add event channel interface for
 XenDevice-s
Date: Wed, 5 Dec 2018 16:16:41 +0000
Message-ID: <1d11969268384be0b8c988911da69e23__49192.0499051504$1544026528$gmane$org@AMSPEX02CL03.citrite.net>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-8-paul.durrant@citrix.com>
 <20181203162424.GM14786@perard.uk.xensource.com>
 <20181204142459.GV14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f1m+=OO=citrix.com=prvs=870045bc7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUZqu-0004KT-Ly
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:16:44 +0000
In-Reply-To: <20181204142459.GV14786@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwNCBEZWNlbWJlciAyMDE4IDE0
OjI1Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA3LzE4XSB4ZW46IGFkZCBldmVudCBjaGFu
bmVsIGludGVyZmFjZSBmb3IgWGVuRGV2aWNlLQo+IHMKPiAKPiBPbiBNb24sIERlYyAwMywgMjAx
OCBhdCAwNDoyNDoyNFBNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFdlZCwg
Tm92IDIxLCAyMDE4IGF0IDAzOjEyOjAwUE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+
ID4gK3N0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZXZlbnQodm9pZCAqb3BhcXVlKQo+ID4gPiArewo+
ID4gPiArICAgIFhlbkRldmljZSAqeGVuZGV2ID0gb3BhcXVlOwo+ID4gPiArICAgIHVuc2lnbmVk
IGxvbmcgcG9ydCA9IHhlbmV2dGNobl9wZW5kaW5nKHhlbmRldi0+eGVoKTsKPiA+ID4gKwo+ID4g
PiArICAgIG5vdGlmaWVyX2xpc3Rfbm90aWZ5KCZ4ZW5kZXYtPmV2ZW50X25vdGlmaWVycywgKHZv
aWQgKilwb3J0KTsKPiA+Cj4gPiBJIHdvbmRlciBpZiBhIE5vdGlmaWVyIGlzIGEgZ29vZCBmaXQg
Zm9yIFhlbkRldmljZSwgbGlrZSBoZXJlIGZvciB0aGUKPiA+IGV2ZW50cyBvciB0aGUgeGVuc3Rv
cmUgd2F0Y2hlcyBpbiBwcmV2aW91cyBwYXRjaGVzLCBhcyBOb3RpZmllckxpc3RzIGFyZQo+ID4g
bm9ybWFseSB1c2VkIHdoZW4gZXZlcnkgTm90aWZpZXJzIHdhbnQgdG8gZG8gc29tZXRoaW5nLCBi
dXQgaGVyZSB0aGVyZQo+ID4gaXMgb25seSBvbmUgdGhhdCBpcyBnb2luZyB0byBkbyBzb21ldGhp
bmcuIEJ1dCBJIGd1ZXNzIGl0IG1pZ2h0IG5vdCBiZQo+ID4gbXVjaCBiZXR0ZXIgdG8gd3JpdGUg
YSBsb29wIGluIGhlcmUgcmF0aGVyIHRoYW4gdXNlIHRoZSBvbmUgaW4KPiA+IG5vdGlmaWVyX2xp
c3Rfbm90aWZ5Lgo+IAo+IEkndmUgc2VlbiB0aGF0IHlvdSB1c2UgR0hhc2hUYWJsZSBpbiBhIGZv
bGxvd2luZyBwYXRjaCwgd291bGRuJ3QgdGhhdCBiZQo+IHVzZWZ1bCB0byB1c2UgZm9yIHhlbnN0
b3JlIHdhdGNoZXMgYW5kIGV2dGNobiBldmVudHMgYXMgd2VsbD8KPiAKClRoZXJlJ3MgcHJlY2Vk
ZW50IGZvciB1c2luZyBOb3RpZmllciBsaXN0cyBmb3IgdGhpcyBraW5kIG9mIHRoaW5nLiBBIGhh
c2ggdGFibGUgbWF5IGJlIGFuIG9wdGltaXphdGlvbiBidXQgSSdkIHJhdGhlciBzdGljayB3aXRo
IHRoZSBsaXN0cyBmb3Igbm93Li4uIEkga25vdyB0aGV5IHdvcmsgOi0pCgogIFBhdWwKCj4gCj4g
LS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

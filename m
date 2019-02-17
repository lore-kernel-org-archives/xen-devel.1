From: Samuel Thibault <admin@listes.aquilenet.fr>
Subject: Re: [admin] [Pkg-xen-devel] [BUG] task jbd2/xvda4-8:174
 blocked for more than 120 seconds.
Date: Sun, 17 Feb 2019 22:29:14 +0100
Message-ID: <20190217212914.cczgjr4fp5k4attg@function>
References: <e1429228-bef6-afa1-a004-4fb0cf0bb52d@yaal.fr>
 <20190208171335.nzqrsfk75xjw4plq@function>
 <ace166ae-95b0-25c1-d3fa-3d7b2128521e@knorrie.org>
 <20190208231624.d3p5folfbnw7isp2@function>
 <79756d96-788b-b683-82b1-96a87d2353f1@knorrie.org>
 <20190209163534.boh7ljguxytrnb6o@function>
 <b385f45c-c140-550e-220f-bbc372a15cdd@oracle.com>
 <cac5093b-10c8-8476-f6c8-98999e588072@knorrie.org>
 <20190211221050.qnhw7ma2b5ancek3@function>
 <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Izc7=QY=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1gvU04-00089L-7V
 for xen-devel@lists.xenproject.org; Sun, 17 Feb 2019 21:29:24 +0000
Content-Disposition: inline
In-Reply-To: <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel <xen-devel@lists.xenproject.org>, admin@listes.aquilenet.fr, Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpEb25nbGkgWmhhbmcsIGxlIG1hci4gMTIgZsOpdnIuIDIwMTkgMTI6MTE6MjAgKzA4
MDAsIGEgZWNyaXQ6Cj4gT24gMDIvMTIvMjAxOSAwNjoxMCBBTSwgU2FtdWVsIFRoaWJhdWx0IHdy
b3RlOgo+ID4gSGFucyB2YW4gS3JhbmVuYnVyZywgbGUgbHVuLiAxMSBmw6l2ci4gMjAxOSAyMjo1
OToxMSArMDEwMCwgYSBlY3JpdDoKPiA+PiBPbiAyLzExLzE5IDI6MzcgQU0sIERvbmdsaSBaaGFu
ZyB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gMi8xMC8xOSAxMjozNSBBTSwgU2FtdWVsIFRoaWJhdWx0
IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IEhhbnMgdmFuIEtyYW5lbmJ1cmcsIGxlIHNhbS4gMDkgZsOp
dnIuIDIwMTkgMTc6MDE6NTUgKzAxMDAsIGEgZWNyaXQ6Cj4gPj4+Pj4+IEkgaGF2ZSBmb3J3YXJk
ZWQgdGhlIG9yaWdpbmFsIG1haWw6IGFsbCBWTSBJL08gZ2V0IHN0dWNrLCBhbmQgdGh1cyB0aGUK
PiA+Pj4+Pj4gVk0gYmVjb21lcyB1bnVzYWJsZS4KPiA+Pj4+Pgo+ID4+Pj4+IFRoZXNlIGFyZSBp
biBtYW55IGNhc2VzIHRoZSBzeW1wdG9tcyBvZiBydW5uaW5nIG91dCBvZiAiZ3JhbnQgZnJhbWVz
Ii4KPiA+Pj4+Cj4gPj4+PiBPaCEgIFRoYXQgY291bGQgYmUgaXQgaW5kZWVkLiAgSSdtIHdvbmRl
cmluZyB3aGF0IGNvdWxkIGJlIG1vbm9wb2xpemluZwo+ID4+Pj4gdGhlbSwgdGhvdWdoLCBhbmQg
d2h5ICtkZWI5dTExIGlzIGFmZmVjdGVkIHdoaWxlICtkZWI5dTEwIGlzIG5vdC4gIEknbQo+ID4+
Pj4gYWZyYWlkIGluY3JlYXNpbmcgdGhlIGdudHRhYiBtYXggc2l6ZSB0byAzMiBtaWdodCBqdXN0
IGRlZmVyIGZpbGxpbmcgaXQKPiA+Pj4+IHVwLgo+ID4+Pj4KPiA+Pj4+PiAgIC0jIC4veGVuLWRp
YWcgIGdudHRhYl9xdWVyeV9zaXplIDUKPiA+Pj4+PiAgIGRvbWlkPTU6IG5yX2ZyYW1lcz0xMSwg
bWF4X25yX2ZyYW1lcz0zMgo+ID4+Pj4KPiA+Pj4+IFRoZSBjdXJyZW50IHZhbHVlIGlzIDMxIG92
ZXIgbWF4IDMyIGluZGVlZC4KPiA+Pj4KPiA+Pj4gQXNzdW1pbmcgdGhpcyBpcyBncmFudCB2MSwg
dGhlcmUgYXJlIHN0aWxsIDQwOTYvOD01MTIgZ3JhbnQgcmVmZXJlbmNlcyBhdmFpbGFibGUKPiA+
Pj4gKDMyLTMxPTEgZnJhbWUgYXZhaWxhYmxlKS4gSSBkbyBub3QgdGhpbmsgdGhlIEkvTyBoYW5n
IGNhbiBiZSBhZmZlY3RlZCBieSB0aGUKPiA+Pj4gbGFjayBvZiBncmFudCBlbnRyeS4KPiA+Pgo+
ID4+IEkgc3VzcGVjdCB0aGF0IDMxIG1lYXN1cmVtZW50IHdhcyB0YWtlbiB3aGVuIHRoZSBkb21V
IHdhcyBub3QgaGFuZ2luZyB5ZXQuCj4gPiAKPiA+IEluZGVlZCwgSSBkaWRuJ3QgaGF2ZSB0aGUg
aGFuZ2luZyBWTSBvZmZoYW5kLiAgSSBoYXZlIGxvb2tlZCBhZ2FpbiwgaXQncwo+ID4gbm93IGF0
IDMzLiBXZSdsbCBoYXZlIHRvIG1vbml0b3IgdG8gY2hlY2sgdGhhdCBpdCBkb2Vzbid0IGNvbnRp
bnVlIGp1c3QKPiA+IGluY3JlYXNpbmcuCj4gCj4gSWYgdGhlIG1heCB1c2VkIHRvIGJlIDMyIGFu
ZCB0aGUgY3VycmVudCBpcyBhbHJlYWR5IDMzLCB0aGlzIGluZGljYXRlcyB0aGUgZ3JhbnQKPiBl
bnRyaWVzIG1pZ2h0IGJlIHVzZWQgdXAgaW4gdGhlIHBhc3QgYmVmb3JlIHRoZSBtYXhfbnJfZnJh
bWVzIGlzIHR1bmVkLgoKVGhlIG51bWJlciBzZWVtcyB0byBiZSBnb2luZyB1cCBieSBhYm91dCBv
bmUgZXZlcnkgZGF5LiBTbyBwcm9iYWJseSBhCmdyYW50IGVudHJ5IGxlYWsgc29tZXdoZXJlIDov
CgpTYW11ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

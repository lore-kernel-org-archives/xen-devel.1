From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] mm: make opt_bootscrub non-init
Date: Tue, 27 Nov 2018 17:03:55 +0000
Message-ID: <20181127170355.v5te22ezirtbhj3c@zion.uk.xensource.com>
References: <20181126175548.9977-1-roger.pau@citrix.com>
 <5BFD18C70200007800200459@prv1-mh.provo.novell.com>
 <20181127142529.5x5qfx244gqekq6x@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9xt=og=citrix.com=prvs=862b52565=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRgmK-0008ME-Cu
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 17:04:04 +0000
Content-Disposition: inline
In-Reply-To: <20181127142529.5x5qfx244gqekq6x@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDM6MjU6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE5vdiAyNywgMjAxOCBhdCAwMzoxMzoyN0FNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAyNi4xMS4xOCBhdCAxODo1NSwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiA+
ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiA+ID4gQEAgLTE2Niw3ICsxNjYsMTQg
QEAgZW51bSBib290c2NydWJfbW9kZSB7Cj4gPiA+ICAgICAgQk9PVFNDUlVCX09OLAo+ID4gPiAg
ICAgIEJPT1RTQ1JVQl9JRExFLAo+ID4gPiAgfTsKPiA+ID4gLXN0YXRpYyBlbnVtIGJvb3RzY3J1
Yl9tb2RlIF9faW5pdGRhdGEgb3B0X2Jvb3RzY3J1YiA9IEJPT1RTQ1JVQl9JRExFOwo+ID4gPiAr
LyoKPiA+ID4gKyAqIG9wdF9ib290c2NydWIgc2hvdWxkIGxpdmUgaW4gdGhlIGluaXQgc2VjdGlv
biwgc2luY2UgaXQncyBub3QgYWNjZXNzZWQKPiA+ID4gKyAqIGFmdGVyd2FyZHMuIEhvd2V2ZXIg
YXQgbGVhc3QgTExWTSBhc3N1bWVzIHRoZXJlIGFyZSBubyBzaWRlIGVmZmVjdHMgb2YKPiA+ID4g
KyAqIGFjY2Vzc2luZyB0aGUgdmFyaWFibGUsIGFuZCBvcHRpbWl6ZXMgdGhlIGNvbmRpdGlvbiBz
byBvcHRfYm9vdHNjcnViIGlzCj4gPiAKPiA+IC4uLiB0aGUgY29uZGl0aW9uIGluIGluaXRfaGVh
cF9wYWdlcygpIC4uLgo+ID4gCj4gPiAod2hpY2ggSSBndWVzcyBjYW4gYmUgZm9sZGVkIGluIHdo
aWxlIGNvbW1pdHRpbmcpLgo+IAo+IFllcyBwbGVhc2UuCj4gCgpJIGhhdmUgZml4ZWQgdGhpcyBh
bmQgdGFrZW4gdGhlIGxpYmVydHkgdG8gYWRkIGEgYmxhbmsgbGluZSBiZWZvcmUgdGhpcwpjb21t
ZW50IGJsb2NrLgoKV2VpLgoKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

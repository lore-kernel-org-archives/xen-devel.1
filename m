From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: Out of bounds access in early boot code related to
 GRUB
Date: Wed, 26 Sep 2018 12:18:43 +0200
Message-ID: <20180926101843.GB4566@olila.i.net-space.pl>
References: <20180919093447.lrrvyh7tdkcplqdj@zion.uk.xensource.com>
 <20180921185645.GG4473@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvy4=mi=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1g56uI-0005YW-Kp
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:18:58 +0000
Content-Disposition: inline
In-Reply-To: <20180921185645.GG4473@olila.i.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDg6NTY6NDVQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFdlZCwgU2VwIDE5LCAyMDE4IGF0IDEwOjM0OjQ3QU0gKzAxMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBIaSBEYW5pZWwsCj4gPgo+ID4gSSBkaXNjb3ZlcmVkIGFuIG91dCBvZiBib3Vu
ZHMgYWNjZXNzIGlzc3VlIHJlbGF0ZWQgdG8gR1JVQiByZWxvY2F0aW9uCj4gPiBjb2RlIHBhdGgg
d2hlbiBpbnNwZWN0aW5nIGVhcmx5IGJvb3QgY29kZS4KPiA+Cj4gPiA5NTg5OTI3ZTViIGNoYW5n
ZWQgYW4gRUZJIG9ubHkgcGF0aCB0byB3b3JrIHdpdGggR1JVQi4gWWV0IHRoZSBmb2xsb3dpbmcK
PiA+IHR3byBsaW5lcyB3aXRoaW4gYW4gaWYgY29uZGl0aW9uIHJlbWFpbmVkIHVudG91Y2hlZC4K
PiA+Cj4gPiAgICAgbW9kW21iaS0+bW9kc19jb3VudF0ubW9kX3N0YXJ0ID0gdmlydF90b19tZm4o
X3N0ZXh0KTsKPiA+ICAgICBtb2RbbWJpLT5tb2RzX2NvdW50XS5tb2RfZW5kID0gX18yTV9yd2Rh
dGFfZW5kIC0gX3N0ZXh0Owo+ID4KPiA+IEJlZm9yZSB5b3VyIGNoYW5nZSB0aGV5IHdlcmUgZmlu
ZSBiZWNhdXNlIHRoZSBtb2QgYXJyYXkgd2FzIGNyZWF0ZWQgb25lCj4gPiBlbGVtZW50IGxhcmdl
ciBpbiBYZW4gKHNlZSBlMjJlMWM0Nzk1OGEpLiBJIGRvbid0IHRoaW5rIEdSVUIgZG9lcyB0aGUK
PiA+IHNhbWUuIFNvIHRoaXMgaXMgYW4gb3V0IG9mIGJvdW5kcyBhY2Nlc3MgZm9yIEdSVUIgY2Fz
ZS4KPgo+IFlvdSBhcmUgcmlnaHQhIEkgd2lsbCBwb3N0IGEgZml4IG5leHQgd2Vlay4KCkkgdGhp
bmsgdGhhdCB0aGUgaXNzdWUgY2FuIGJlIHF1aWNrbHkgZml4ZWQgYnkgY2hhbmdpbmcgbGluZSAx
ODAKaW4geGVuL2FyY2gveDg2L2Jvb3QvcmVsb2MuYyB3aXRoOgoKICBtYmlfb3V0LT5tb2RzX2Fk
ZHIgPSBhbGxvY19tZW0oKG1iaV9vdXQtPm1vZHNfY291bnQgKyAxKSAqIHNpemVvZigqbWJpX291
dF9tb2RzKSk7CgpUaGlzIHdheSB3ZSB3aWxsIGdldCBleHRyYSBzcGFjZSBmb3IgWGVuIGh5cGVy
dmlzb3IgaWYgaXQgaXMgbmVlZGVkLgoKSWYgeW91IGFyZSBPSyB3aXRoIHRoYXQgZml4IEkgd2ls
bCBwb3N0IGEgcGF0Y2guCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

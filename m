From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Out of bounds access in early boot code related to
 GRUB
Date: Wed, 26 Sep 2018 11:49:20 +0100
Message-ID: <20180926104920.mqxyhec5x5yxrdif@zion.uk.xensource.com>
References: <20180919093447.lrrvyh7tdkcplqdj@zion.uk.xensource.com>
 <20180921185645.GG4473@olila.i.net-space.pl>
 <20180926101843.GB4566@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=avo5=mi=citrix.com=prvs=80087d113=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g57Nl-0008L2-Bx
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:49:25 +0000
Content-Disposition: inline
In-Reply-To: <20180926101843.GB4566@olila.i.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMjYsIDIwMTggYXQgMTI6MTg6NDNQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIEZyaSwgU2VwIDIxLCAyMDE4IGF0IDA4OjU2OjQ1UE0gKzAyMDAsIERhbmllbCBL
aXBlciB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDE5LCAyMDE4IGF0IDEwOjM0OjQ3QU0gKzAxMDAs
IFdlaSBMaXUgd3JvdGU6Cj4gPiA+IEhpIERhbmllbCwKPiA+ID4KPiA+ID4gSSBkaXNjb3ZlcmVk
IGFuIG91dCBvZiBib3VuZHMgYWNjZXNzIGlzc3VlIHJlbGF0ZWQgdG8gR1JVQiByZWxvY2F0aW9u
Cj4gPiA+IGNvZGUgcGF0aCB3aGVuIGluc3BlY3RpbmcgZWFybHkgYm9vdCBjb2RlLgo+ID4gPgo+
ID4gPiA5NTg5OTI3ZTViIGNoYW5nZWQgYW4gRUZJIG9ubHkgcGF0aCB0byB3b3JrIHdpdGggR1JV
Qi4gWWV0IHRoZSBmb2xsb3dpbmcKPiA+ID4gdHdvIGxpbmVzIHdpdGhpbiBhbiBpZiBjb25kaXRp
b24gcmVtYWluZWQgdW50b3VjaGVkLgo+ID4gPgo+ID4gPiAgICAgbW9kW21iaS0+bW9kc19jb3Vu
dF0ubW9kX3N0YXJ0ID0gdmlydF90b19tZm4oX3N0ZXh0KTsKPiA+ID4gICAgIG1vZFttYmktPm1v
ZHNfY291bnRdLm1vZF9lbmQgPSBfXzJNX3J3ZGF0YV9lbmQgLSBfc3RleHQ7Cj4gPiA+Cj4gPiA+
IEJlZm9yZSB5b3VyIGNoYW5nZSB0aGV5IHdlcmUgZmluZSBiZWNhdXNlIHRoZSBtb2QgYXJyYXkg
d2FzIGNyZWF0ZWQgb25lCj4gPiA+IGVsZW1lbnQgbGFyZ2VyIGluIFhlbiAoc2VlIGUyMmUxYzQ3
OTU4YSkuIEkgZG9uJ3QgdGhpbmsgR1JVQiBkb2VzIHRoZQo+ID4gPiBzYW1lLiBTbyB0aGlzIGlz
IGFuIG91dCBvZiBib3VuZHMgYWNjZXNzIGZvciBHUlVCIGNhc2UuCj4gPgo+ID4gWW91IGFyZSBy
aWdodCEgSSB3aWxsIHBvc3QgYSBmaXggbmV4dCB3ZWVrLgo+IAo+IEkgdGhpbmsgdGhhdCB0aGUg
aXNzdWUgY2FuIGJlIHF1aWNrbHkgZml4ZWQgYnkgY2hhbmdpbmcgbGluZSAxODAKPiBpbiB4ZW4v
YXJjaC94ODYvYm9vdC9yZWxvYy5jIHdpdGg6Cj4gCj4gICBtYmlfb3V0LT5tb2RzX2FkZHIgPSBh
bGxvY19tZW0oKG1iaV9vdXQtPm1vZHNfY291bnQgKyAxKSAqIHNpemVvZigqbWJpX291dF9tb2Rz
KSk7Cj4gCj4gVGhpcyB3YXkgd2Ugd2lsbCBnZXQgZXh0cmEgc3BhY2UgZm9yIFhlbiBoeXBlcnZp
c29yIGlmIGl0IGlzIG5lZWRlZC4KPiAKPiBJZiB5b3UgYXJlIE9LIHdpdGggdGhhdCBmaXggSSB3
aWxsIHBvc3QgYSBwYXRjaC4KClN1cmUuIFRoYXQgbG9va3MgZmluZSB0byBtZS4gQnV0IHlvdSB3
aWxsIG5lZWQgSmFuIG9yIEFuZHJldydzIGFjay4gOikKCk5vdyBJIHJlYWxpc2UgSSdkIGJldHRl
ciBhdCBsZWFzdCBhZGQgYW4gYXNzZXJ0IHRvIHRoZSBQVkggYm9vdCBwYXRoLgoKV2VpLgoKPiAK
PiBEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

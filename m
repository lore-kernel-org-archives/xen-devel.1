From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86emul: fix vector-length check for
 AVX512F scalar fused-multiply-add insns
Date: Mon, 10 Dec 2018 13:50:31 +0000
Message-ID: <8ad3493a-1068-492b-916c-f4fd4d13fc49@citrix.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
 <5C0A56E7020000780020401C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R27G=OT=citrix.com=prvs=87506bf53=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gWLxD-0004b5-J9
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 13:50:35 +0000
In-Reply-To: <5C0A56E7020000780020401C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGNoZWNrIG5lZWRz
IHRvIGhhcHBlbiB3aGVuZXZlciBFVkVYLmIgaXMgY2xlYXIsIG5vdCBqdXN0IGluIHRoZQo+IG1l
bW9yeSBvcGVyYW5kIGNhc2UuCgpFVkVYLmIgaXMgYSBkaWZmZXJlbnQgZmllbGQgdG8gRVZFWC5i
cgoKSSdtIGFmcmFpZCB0aGF0IHRoaXMgZ29lcyBiYWNrIHRvIG15IG9yaWdpbmFsIGNvbmNlcm4g
d2l0aCB0aGUgc2VyaWVzLsKgCkhhdmluZyB0aGUgZmllbGRzIG5hbWVkIGRpZmZlcmVudGx5IGJl
dHdlZW4gb3VyIGNvZGUgYW5kIHRoZSBtYW51YWwgaXMKbm93IGNhdXNpbmcgcHJvYmxlbXMgZm9y
IGV2ZXJ5b25lLgoKfkFuZHJldwoKPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11
bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiBA
QCAtODUyNiwxMSArODUyNiw5IEBAIHg4Nl9lbXVsYXRlKAo+ICAgICAgY2FzZSBYODZFTVVMX09Q
Q19FVkVYXzY2KDB4MGYzOCwgMHhiZCk6IC8qIHZmbm1hZGQyMzFze3MsZH0geG1tL21lbSx4bW0s
eG1te2t9ICovCj4gICAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweGJmKTog
LyogdmZubXN1YjIzMXN7cyxkfSB4bW0vbWVtLHhtbSx4bW17a30gKi8KPiAgICAgICAgICBob3N0
X2FuZF92Y3B1X211c3RfaGF2ZShhdng1MTJmKTsKPiAtICAgICAgICBpZiAoIGVhLnR5cGUgPT0g
T1BfTUVNICkKPiAtICAgICAgICB7Cj4gLSAgICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9p
ZihldmV4LmJyLCBFWENfVUQpOwo+ICsgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihlYS50
eXBlICE9IE9QX1JFRyAmJiBldmV4LmJyLCBFWENfVUQpOwo+ICsgICAgICAgIGlmICggIWV2ZXgu
YnIgKQo+ICAgICAgICAgICAgICBhdng1MTJfdmxlbl9jaGVjayh0cnVlKTsKPiAtICAgICAgICB9
Cj4gICAgICAgICAgZ290byBzaW1kX3ptbTsKPiAgCj4gICAgICBjYXNlIFg4NkVNVUxfT1BDKDB4
MGYzOCwgMHhjOCk6ICAgICAvKiBzaGExbmV4dGUgeG1tL20xMjgseG1tICovCj4KPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

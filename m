From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] x86: remove CR reads from exit-to-guest
	path
Date: Tue, 30 Jan 2018 04:10:05 -0700
Message-ID: <5A70609D02000078001A3AE1@prv-mh.provo.novell.com>
References: <5A671D6D02000078001A17B7@prv-mh.provo.novell.com>
 <5A671E4D02000078001A17C1@prv-mh.provo.novell.com>
 <5921d505-c6dd-afdf-5ca8-cf4731033c22@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=pwqs=ez=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egTnn-0000tK-JV
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 11:10:11 +0000
In-Reply-To: <5921d505-c6dd-afdf-5ca8-cf4731033c22@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE4IGF0IDEyOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDEvMTggMTA6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
YXNtX2RlZm5zLmgKPj4gQEAgLTIwNiwxMyArMjA2LDEyIEBAIHZvaWQgcmV0X2Zyb21faW50cih2
b2lkKTsKPj4gICNkZWZpbmUgQVNNX1NUQUMgQVNNX0FDKFNUQUMpCj4+ICAjZGVmaW5lIEFTTV9D
TEFDIEFTTV9BQyhDTEFDKQo+PiAgCj4+IC0ubWFjcm8gd3JpdGVfY3IzIHZhbDpyZXEsIHRtcDE6
cmVxLCB0bXAyOnJlcQo+PiAtICAgICAgICBtb3YgICAlY3I0LCAlXHRtcDEKPj4gLSAgICAgICAg
bW92ICAgJVx0bXAxLCAlXHRtcDIKPj4gLSAgICAgICAgYW5kICAgJH5YODZfQ1I0X1BHRSwgJVx0
bXAxCj4+IC0gICAgICAgIG1vdiAgICVcdG1wMSwgJWNyNAo+PiArLm1hY3JvIHdyaXRlX2NyMyB2
YWw6cmVxLCBjcjQ6cmVxLCB0bXA6cmVxCj4+ICsgICAgICAgIG1vdiAgICVcY3I0LCAlXHRtcAo+
PiArICAgICAgICBhbmQgICAkflg4Nl9DUjRfUEdFLCAlXGNyNAo+PiArICAgICAgICBtb3YgICAl
XGNyNCwgJWNyNAo+IAo+IFRoaXMgaXMgY29uZnVzaW5nIHRvIHJlYWQ7IEl0IHRvb2sgbWUgYSB3
aGlsZSB0byB3b3JrIG91dCB3aHkgaXQKPiBhc3NlbWJsZWQgaW4gdGhlIGZpcnN0IHBsYWNlLiAg
R2l2ZW4gdGhhdCB0aGVyZSBhcmUgb25seSB0d28gaW5zdGFuY2VzCj4gb2Ygd3JpdGVfY3IzIG5v
dywgSSdkIHN1Z2dlc3QgZXhwYW5kaW5nIHRoaXMgaW4gdGhlIHR3byBzaXRlcy4gIEl0IHdpbGwK
PiBhbHNvIG1ha2UgaXQgY2xlYXIgd2hpY2ggcmVnaXN0ZXJzIGhhdmUgcmVhbCB2YWx1ZXMgYW5k
IHdoaWNoIGFyZQo+IHRlbXBvcmFyeSwgd2hpY2ggaXNuJ3QgY2xlYXIgZnJvbSB0aGUgY3VycmVu
dCBjYWxsc2l0ZXMuCgpIbW0sIHBhcnQgb2YgdGhlIHJlYXNvbiBJIGRpZG4ndCB3YW50IHRvIGRy
b3AgdGhlIG1hY3JvIGFsdG9nZXRoZXIKaXMgaXRzIHNpbWlsYXJpdHkgd2l0aCB3cml0ZV9jcjMo
KSwgc28gaXQgd291bGQgdHVybiB1cCBpbiBncmVwLXMgZm9yIHRoYXQKb25lLiBIb3cgYWJvdXQg
c3dpdGNoaW5nIHRoZSB0d28gdXNlIHNpdGVzIHRvIHNwZWNpZnkgbmFtZWQKYXJndW1lbnRzIHRv
IHRoZSBtYWNybz8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

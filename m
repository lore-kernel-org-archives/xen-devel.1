From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86: remove CR reads from exit-to-guest
	path
Date: Mon, 5 Feb 2018 16:47:48 +0000
Message-ID: <6e655b26-1ae7-f27e-e598-6fdd05c52265@citrix.com>
References: <5A671D6D02000078001A17B7@prv-mh.provo.novell.com>
 <5A671E4D02000078001A17C1@prv-mh.provo.novell.com>
 <5921d505-c6dd-afdf-5ca8-cf4731033c22@citrix.com>
 <5A70609D02000078001A3AE1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xio2=e7=citrix.com=prvs=567de97ac=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eijy2-000305-Vw
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 16:50:07 +0000
In-Reply-To: <5A70609D02000078001A3AE1@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMTggMTE6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjAxLjE4IGF0
IDEyOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDIzLzAxLzE4
IDEwOjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
YXNtX2RlZm5zLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKPj4+
IEBAIC0yMDYsMTMgKzIwNiwxMiBAQCB2b2lkIHJldF9mcm9tX2ludHIodm9pZCk7Cj4+PiAgI2Rl
ZmluZSBBU01fU1RBQyBBU01fQUMoU1RBQykKPj4+ICAjZGVmaW5lIEFTTV9DTEFDIEFTTV9BQyhD
TEFDKQo+Pj4gIAo+Pj4gLS5tYWNybyB3cml0ZV9jcjMgdmFsOnJlcSwgdG1wMTpyZXEsIHRtcDI6
cmVxCj4+PiAtICAgICAgICBtb3YgICAlY3I0LCAlXHRtcDEKPj4+IC0gICAgICAgIG1vdiAgICVc
dG1wMSwgJVx0bXAyCj4+PiAtICAgICAgICBhbmQgICAkflg4Nl9DUjRfUEdFLCAlXHRtcDEKPj4+
IC0gICAgICAgIG1vdiAgICVcdG1wMSwgJWNyNAo+Pj4gKy5tYWNybyB3cml0ZV9jcjMgdmFsOnJl
cSwgY3I0OnJlcSwgdG1wOnJlcQo+Pj4gKyAgICAgICAgbW92ICAgJVxjcjQsICVcdG1wCj4+PiAr
ICAgICAgICBhbmQgICAkflg4Nl9DUjRfUEdFLCAlXGNyNAo+Pj4gKyAgICAgICAgbW92ICAgJVxj
cjQsICVjcjQKPj4gVGhpcyBpcyBjb25mdXNpbmcgdG8gcmVhZDsgSXQgdG9vayBtZSBhIHdoaWxl
IHRvIHdvcmsgb3V0IHdoeSBpdAo+PiBhc3NlbWJsZWQgaW4gdGhlIGZpcnN0IHBsYWNlLiAgR2l2
ZW4gdGhhdCB0aGVyZSBhcmUgb25seSB0d28gaW5zdGFuY2VzCj4+IG9mIHdyaXRlX2NyMyBub3cs
IEknZCBzdWdnZXN0IGV4cGFuZGluZyB0aGlzIGluIHRoZSB0d28gc2l0ZXMuICBJdCB3aWxsCj4+
IGFsc28gbWFrZSBpdCBjbGVhciB3aGljaCByZWdpc3RlcnMgaGF2ZSByZWFsIHZhbHVlcyBhbmQg
d2hpY2ggYXJlCj4+IHRlbXBvcmFyeSwgd2hpY2ggaXNuJ3QgY2xlYXIgZnJvbSB0aGUgY3VycmVu
dCBjYWxsc2l0ZXMuCj4gSG1tLCBwYXJ0IG9mIHRoZSByZWFzb24gSSBkaWRuJ3Qgd2FudCB0byBk
cm9wIHRoZSBtYWNybyBhbHRvZ2V0aGVyCj4gaXMgaXRzIHNpbWlsYXJpdHkgd2l0aCB3cml0ZV9j
cjMoKSwgc28gaXQgd291bGQgdHVybiB1cCBpbiBncmVwLXMgZm9yIHRoYXQKPiBvbmUuIEhvdyBh
Ym91dCBzd2l0Y2hpbmcgdGhlIHR3byB1c2Ugc2l0ZXMgdG8gc3BlY2lmeSBuYW1lZAo+IGFyZ3Vt
ZW50cyB0byB0aGUgbWFjcm8/CgpGcmFua2x5LCBuZWl0aGVyIHVzZXMgYXJlIHN1aXRhYmx5IG5h
bWVkLsKgIFRoZXkgYXJlICJzd2l0Y2ggdG8gbmV3IGNyMwphbmQgZmx1c2ggZ2xvYmFsIHBhZ2Vz
IiwgZXhjZXB0IHRoYXQgdGhlIGFzbSB2ZXJzaW9uIGRvZXNuJ3QgdGljayB0aGUKVExCIGNsb2Nr
LgoKVXNpbmcgZXhwbGljaXRseSBuYW1lZCBwYXJhbWV0ZXJzIHdvdWxkIGJlIGFuIGltcHJvdmVt
ZW50IG92ZXIgd2hhdCBpcwpoZXJlIGF0IHRoZSBtb21lbnQsIGJ1dCByZW1vdmluZyB0aGUgbWFj
cm8gd291bGQgYmUgYW4gaW1wcm92ZW1lbnQgc3RpbGwuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

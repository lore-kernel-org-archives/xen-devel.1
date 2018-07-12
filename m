From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/8] x86/AMD: distinguish compute units from
 hyper-threads
Date: Thu, 12 Jul 2018 08:22:34 -0600
Message-ID: <5B47642A02000078001D387B@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F30E02000078001D3139@prv1-mh.provo.novell.com>
 <49c30338-2bbb-bc45-df29-40668305405a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sl20=j4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdcUP-0001UU-TY
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 14:22:37 +0000
In-Reply-To: <49c30338-2bbb-bc45-df29-40668305405a@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA3LjE4IGF0IDE1OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDcvMTggMTM6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBGYW0xNyByZXBs
YWNlcyBDVXMgYnkgSFRzLCB3aGljaCB3ZSBzaG91bGQgcmVmbGVjdCBhY2NvcmRpbmdseSwgZXZl
biBpZgo+PiB0aGUgZGlmZmVyZW5jZSBpcyBub3QgdmVyeSBiaWcuIFRoZSBtb3N0IHJlbGV2YW50
IGNoYW5nZSAocmVxdWlyaW5nIHNvbWUKPj4gY29kZSByZXN0cnVjdHVyaW5nKSBpcyB0aGF0IHRo
ZSB0b3BvZXh0IGZlYXR1cmUgbm8gbG9uZ2VyIG1lYW5zIHRoZXJlIGlzCj4+IGEgdmFsaWQgQ1Ug
SUQuCj4+Cj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBjb252ZXJ0IHdyb25nbHkgcGxhaW4g
aW50IHZhcmlhYmxlcyBpbgo+PiBzZXRfY3B1X3NpYmxpbmdfbWFwKCkgdG8gdW5zaWduZWQgaW50
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYwo+PiBAQCAtNTA0LDE3ICs1MDQsMjMgQEAgc3RhdGljIHZvaWQgYW1kX2dldF90b3Bv
bG9neShzdHJ1Y3QgY3B1aQo+PiAgICAgICAgICAgICAgICAgIHUzMiBlYXgsIGVieCwgZWN4LCBl
ZHg7Cj4+ICAKPj4gICAgICAgICAgICAgICAgICBjcHVpZCgweDgwMDAwMDFlLCAmZWF4LCAmZWJ4
LCAmZWN4LCAmZWR4KTsKPj4gLSAgICAgICAgICAgICAgICBjLT5jb21wdXRlX3VuaXRfaWQgPSBl
YnggJiAweEZGOwo+PiAgICAgICAgICAgICAgICAgIGMtPng4Nl9udW1fc2libGluZ3MgPSAoKGVi
eCA+PiA4KSAmIDB4MykgKyAxOwo+PiArCj4+ICsJCWlmIChjLT54ODYgPCAweDE3KQo+PiArCSAg
ICAgICAgICAgICAgICBjLT5jb21wdXRlX3VuaXRfaWQgPSBlYnggJiAweEZGOwo+PiArCQllbHNl
IHsKPj4gKwkgICAgICAgICAgICAgICAgYy0+Y3B1X2NvcmVfaWQgPSBlYnggJiAweEZGOwo+PiAr
CQkJYy0+eDg2X21heF9jb3JlcyAvPSBjLT54ODZfbnVtX3NpYmxpbmdzOwo+PiArCQl9Cj4gCj4g
VGhlIGluZGVudGF0aW9uIGhlcmUgaXMgb2RkLiAgSXQgdHVybnMgb3V0IHRoZSBmdW5jdGlvbiB1
c2VzIGVudGlyZWx5Cj4gOC1zcGFjZXMgcmF0aGVyIHRoYW4gdGFicywgbGlrZSB0aGUgcmVzdCBv
ZiB0aGUgZmlsZS4KCk91Y2ggLSBkaWRuJ3Qgbm90aWNlIHRoaXMuCgo+IFdvdWxkIHlvdSBtaW5k
IGVpdGhlciByZXRhaW5pbmcgc3BhY2VzLCBvciBmaXhpbmcgdXAgdGhlIGVudGlyZSBmdW5jdGlv
bgo+IChwcm9iYWJseSBlYXNpZXN0IGFzIGEgcHJlcmVxIHBhdGNoKSA/CgpJJ2xsIGZpeCB0aGlz
IHVwIGhlcmUsIG5vdCBpbiBhIHByZXJlcSBwYXRjaCAoZm9yIGJhY2twb3J0aW5nJ3Mgc2FrZSku
CkknbGwgY29uc2lkZXIgYWRkaW5nIGEgZm9sbG93LXVwIHBhdGNoLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

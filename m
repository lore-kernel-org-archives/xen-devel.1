From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] VMX: make vmx_read_guest_msr() cope with
 callers not checking its return value
Date: Wed, 15 Aug 2018 06:01:45 -0600
Message-ID: <5B74162902000078001DE577@prv1-mh.provo.novell.com>
References: <5B740FAC02000078001DE559@prv1-mh.provo.novell.com>
 <afb291b3-1fe5-2c26-3dec-488edf359f4d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e0/s=k6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fpuUo-0006AR-8X
 for xen-devel@lists.xenproject.org; Wed, 15 Aug 2018 12:01:50 +0000
In-Reply-To: <afb291b3-1fe5-2c26-3dec-488edf359f4d@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA4LjE4IGF0IDEzOjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDgvMTggMTI6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCB0b29rIHRp
bGwgdGhlIDQuNSBiYWNrcG9ydHMgb2YgdGhlIEwxVEYgcHJlcmVxcyB0aGF0IGdjYyA4LjIgZmlu
YWxseQo+PiBub3RpY2VkIHRoYXQgdGhlIHZQTVUgY2FsbGVycywgbm90IGNoZWNraW5nIHRoZSBm
dW5jdGlvbidzIHJldHVybiB2YWx1ZSwKPj4gbWF5IGNvbnN1bWUgdW5pbml0aWFsaXplZCBkYXRh
LiBHdWFyZCBhZ2FpbnN0IHRoaXMgYnkgc3RvcmluZyB6ZXJvIG9uCj4+IHRoZSBlcnJvciBwYXRo
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Cj4gdlBNVSByZWFsbHkgaXMgdGhlIGdpZnQgd2hpY2gga2VlcHMgb24gZ2l2aW5nLi4uCj4gCj4+
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaAo+PiBAQCAtNTg2LDcgKzU4NiwxMCBAQCBz
dGF0aWMgaW5saW5lIGludCB2bXhfcmVhZF9ndWVzdF9tc3IoY29uCj4+ICAgICAgY29uc3Qgc3Ry
dWN0IHZteF9tc3JfZW50cnkgKmVudCA9IHZteF9maW5kX21zcih2LCBtc3IsIFZNWF9NU1JfR1VF
U1QpOwo+PiAgCj4+ICAgICAgaWYgKCAhZW50ICkKPj4gKyAgICB7Cj4+ICsgICAgICAgICp2YWwg
PSAwOwo+PiAgICAgICAgICByZXR1cm4gLUVTUkNIOwo+PiArICAgIH0KPj4gIAo+PiAgICAgICp2
YWwgPSBlbnQtPmRhdGE7Cj4+ICAKPiAKPiBZb3Ugd2FudCBhIHNpbWlsYXIgYWRqdXN0bWVudCBp
biB2bXhfcmVhZF9ndWVzdF9sb2Fkb25seV9tc3IoKQo+IGltbWVkaWF0ZWx5IGJlbG93LCB3aGlj
aCBJIGJlbGlldmUgaXMgb25seSBhcHBsaWNhYmxlIHRvIHN0YWdpbmcgYXRtLgoKT2gsIGluZGVl
ZCAtIGNvbWluZyBmcm9tIDQuNSBJIGRpZG4ndCBwYXkgZW5vdWdoIGF0dGVudGlvbiBoZXJlLgoK
PiBXaXRoIHRoYXQsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKVGhhbmtzLCBKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

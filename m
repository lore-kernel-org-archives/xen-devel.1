From: Julien Grall <julien.grall@linaro.org>
Subject: Re: Ping: [PATCH v2 1/2] x86/PoD: correctly handle
 non-order-0 decrease-reservation requests
Date: Thu, 18 Jan 2018 16:36:55 +0000
Message-ID: <63804bd5-f473-3fc8-988e-28f43b01c8d5@linaro.org>
References: <5A25364E0200007800194503@prv-mh.provo.novell.com>
 <5A3A3A7C0200007800198C85@prv-mh.provo.novell.com>
 <5A3A3CB90200007800198C9C@prv-mh.provo.novell.com>
 <5A60D26902000078001A001F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kmc5=en=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ecDBi-00041y-IT
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 16:37:14 +0000
Received: by mail-wr0-x241.google.com with SMTP id 16so23210315wry.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 08:37:12 -0800 (PST)
In-Reply-To: <5A60D26902000078001A001F@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTgvMDEvMTggMTU6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIw
LjEyLjE3IGF0IDEwOjM0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiBwMm1fcG9kX2Rl
Y3JlYXNlX3Jlc2VydmF0aW9uKCkgYXQgdGhlIG1vbWVudCBvbmx5IHJldHVybnMgYSBib29sZWFu
Cj4+IHZhbHVlOiB0cnVlIGZvciAibm90aGluZyBtb3JlIHRvIGRvIiwgZmFsc2UgZm9yICJzb21l
dGhpbmcgbW9yZSB0byBkbyIuCj4+IElmIGl0IHJldHVybnMgZmFsc2UsIGRlY3JlYXNlX3Jlc2Vy
dmF0aW9uKCkgd2lsbCBsb29wIG92ZXIgdGhlIGVudGlyZQo+PiByYW5nZSwgY2FsbGluZyBndWVz
dF9yZW1vdmVfcGFnZSgpIGZvciBlYWNoIHBhZ2UuCj4+Cj4+IFVuZm9ydHVuYXRlbHksIGluIHRo
ZSBjYXNlIHAybV9wb2RfZGVjcmVhc2VfcmVzZXJ2YXRpb24oKSBzdWNjZWVkcwo+PiBwYXJ0aWFs
bHksIHNvbWUgb2YgdGhlIG1lbW9yeSBpbiB0aGUgcmFuZ2Ugd2lsbCBiZSBub3QtcHJlc2VudDsg
YXQgd2hpY2gKPj4gcG9pbnQgZ3Vlc3RfcmVtb3ZlX3BhZ2UoKSB3aWxsIHJldHVybiBhbiBlcnJv
ciwgYW5kIHRoZSBlbnRpcmUgb3BlcmF0aW9uCj4+IHdpbGwgZmFpbC4KPj4KPj4gRml4IHRoaXMg
Ynk6Cj4+IDEuIEhhdmluZyBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKCkgcmV0dXJuIGV4
YWN0bHkgdGhlIG51bWJlciBvZgo+PiAgICAgZ3BmbiBwYWdlcyBpdCBoYXMgaGFuZGxlZCAoaS5l
LiwgcmVwbGFjZWQgd2l0aCAnbm90IHByZXNlbnQnKS4KPj4gMi4gTWFraW5nIGd1ZXN0X3JlbW92
ZV9wYWdlKCkgcmV0dXJuIC1FTk9FTlQgaW4gdGhlIGNhc2UgdGhhdCB0aGUgZ3Bmbgo+PiAgICAg
aW4gcXVlc3Rpb24gd2FzIGFscmVhZHkgZW1wdHkgKGFuZCBpbiBubyBvdGhlciBjYXNlcykuCj4+
IDMuIFdoZW4gbG9vcGluZyBvdmVyIGd1ZXN0X3JlbW92ZV9wYWdlKCksIGV4cGVjdCB0aGUgbnVt
YmVyIG9mIC1FTk9FTlQKPj4gICAgIGZhaWx1cmVzIHRvIGJlIG5vIGxhcmdlciB0aGFuIHRoZSBu
dW1iZXIgb2YgcGFnZXMKPj4gICAgIHAybV9wb2RfZGVjcmVhc2VfcmVzZXJ2YXRpb24oKSByZW1v
dmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4KPj4gLS0tCj4+IHYyOiBSZS13cml0dGVuIGRlc2NyaXB0aW9uIChieSBHZW9yZ2UpLiBBZGQg
Y29tbWVudHMgKGFzIHN1Z2dlc3RlZAo+PiAgICAgIGJ5IEdlb3JnZSkuIEZvcm1hdHRpbmcuCj4+
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMK
Pj4gQEAgLTM4OCwxMCArMzg4LDEwIEBAIGludCBndWVzdF9waHlzbWFwX21hcmtfcG9wdWxhdGVf
b25fZGVtYW4KPj4gICAgICAgcmV0dXJuIC1FTk9TWVM7Cj4+ICAgfQo+PiAgIAo+PiAtaW50IHAy
bV9wb2RfZGVjcmVhc2VfcmVzZXJ2YXRpb24oc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLAo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQo+
PiArdW5zaWduZWQgbG9uZyBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpCj4+ICAgewo+PiAtICAgIHJldHVybiAtRU5PU1lT
Owo+PiArICAgIHJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgdm9pZCBwMm1fc2V0
X3Blcm1pc3Npb24obHBhZV90ICplLCBwMm1fdHlwZV90IHQsIHAybV9hY2Nlc3NfdCBhKQo+IAo+
IFN0ZWZhbm8sIEp1bGllbj8KClNvcnJ5LCBpdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

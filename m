From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 15:18:19 +0100
Message-ID: <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bvjw=il=citrix.com=prvs=675476172=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fLr4m-00045T-Vh
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:18:45 +0000
In-Reply-To: <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMTggMTU6MTQsIFNpbW9uIEdhaXNlciB3cm90ZToKPiBKYW4gQmV1bGljaDoKPj4+
Pj4gT24gMjQuMDUuMTggYXQgMTY6MDAsIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3
cm90ZToKPj4+IEphbiBCZXVsaWNoOgo+Pj4+IEluIGNvbW1pdCBkMWQ2ZmM5N2Q2ICgieDg2L3hw
dGk6IHJlYWxseSBoaWRlIGFsbW9zdCBhbGwgb2YgWGVuIGltYWdlIikKPj4+PiBJJ3ZlIGZhaWxl
ZCB0byByZW1lbWJlciB0aGUgZmFjdCB0aGF0IG11bHRpcGxlIENQVXMgc2hhcmUgYSBzdHViCj4+
Pj4gbWFwcGluZyBwYWdlLiBUaGVyZWZvcmUgaXQgaXMgd3JvbmcgdG8gdW5jb25kaXRpb25hbGx5
IHphcCB0aGUgbWFwcGluZwo+Pj4+IHdoZW4gYnJpbmdpbmcgZG93biBhIENQVTsgaXQgbWF5IG9u
bHkgYmUgdW5tYXBwZWQgd2hlbiBubyBvdGhlciBvbmxpbmUKPj4+PiBDUFUgdXNlcyB0aGF0IHNh
bWUgcGFnZS4KPj4+Pgo+Pj4+IFJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlz
aWJsZXRoaW5nc2xhYi5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4+Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+Pj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4+PiBAQCAtODc2LDcgKzg3NiwyMSBAQCBz
dGF0aWMgdm9pZCBjbGVhbnVwX2NwdV9yb290X3BndCh1bnNpZ25lCj4+Pj4gIAo+Pj4+ICAgICAg
ZnJlZV94ZW5fcGFnZXRhYmxlKHJwdCk7Cj4+Pj4gIAo+Pj4+IC0gICAgLyogQWxzbyB6YXAgdGhl
IHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUuICovCj4+Pj4gKyAgICAvKgo+Pj4+ICsgICAgICog
QWxzbyB6YXAgdGhlIHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUsIGlmIG5vIG90aGVyIG9ubGlu
ZSBvbmUgdXNlcwo+Pj4+ICsgICAgICogdGhlIHNhbWUgcGFnZS4KPj4+PiArICAgICAqLwo+Pj4+
ICsgICAgaWYgKCBzdHViX2xpbmVhciApCj4+Pj4gKyAgICB7Cj4+Pj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IG90aGVyOwo+Pj4+ICsKPj4+PiArICAgICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1KG90
aGVyKQo+Pj4+ICsgICAgICAgICAgICBpZiAoICEoKHBlcl9jcHUoc3R1YnMuYWRkciwgb3RoZXIp
IF4gc3R1Yl9saW5lYXIpID4+IFBBR0VfU0hJRlQpICkKPj4+PiArICAgICAgICAgICAgewo+Pj4+
ICsgICAgICAgICAgICAgICAgc3R1Yl9saW5lYXIgPSAwOwo+Pj4+ICsgICAgICAgICAgICAgICAg
YnJlYWs7Cj4+Pj4gKyAgICAgICAgICAgIH0KPj4+PiArICAgIH0KPj4+PiAgICAgIGlmICggc3R1
Yl9saW5lYXIgKQo+Pj4+ICAgICAgewo+Pj4+ICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0ID0g
bDRlX3RvX2wzZShjb21tb25fcGd0KTsKPj4+IFRyaWVkIHRoaXMgb24tdG9wIG9mIHN0YWdpbmcg
KGZjNTgwNWRhZWYpIGFuZCBJIHN0aWxsIGdldCB0aGUgc2FtZQo+Pj4gZG91YmxlIGZhdWx0Lgo+
PiBIbW0sIGl0IHdvcmtlZCBmb3IgbWUgb2ZmbGluaW5nIChhbmQgbGF0ZXIgcmUtb25saW5pbmcp
IHNldmVyYWwgcENQVS1zLiBXaGF0Cj4+IHNpemUgYSBzeXN0ZW0gYXJlIHlvdSB0ZXN0aW5nIG9u
PyBNaW5lIGhhcyBnb3Qgb25seSAxMiBDUFVzLCBpLmUuIGFsbCBzdHVicwo+PiBhcmUgaW4gdGhl
IHNhbWUgcGFnZSAoYW5kIEknZCBuZXZlciB1bm1hcCBhbnl0aGluZyBoZXJlIGF0IGFsbCkuCj4g
NCBjb3JlcyArIEhULCBzbyA4IENQVXMgZnJvbSBYZW4ncyBQb1YuCgpDYW4geW91IHRyeSB3aXRo
IHRoZSAieDg2L3RyYXBzOiBEdW1wIHRoZSBpbnN0cnVjdGlvbiBzdHJlYW0gZXZlbiBmb3IKZG91
YmxlIGZhdWx0cyIgcGF0Y2ggSSd2ZSBqdXN0IHBvc3RlZCwgYW5kIHNob3cgdGhlIGZ1bGwgI0RG
IHBhbmljIGxvZwpwbGVhc2U/wqAgKEl0cyBjb25jZWl2YWJsZSB0aGF0IHRoZXJlIGFyZSBtdWx0
aXBsZSBkaWZmZXJlbnQgaXNzdWVzIGhlcmUuKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

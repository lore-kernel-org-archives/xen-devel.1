From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 10:06:19 -0600
Message-ID: <5AD76CFB02000078001BC764@prv1-mh.provo.novell.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com>
 <5AD7647502000078001BC6C8@suse.com>
 <499544e3-848e-09c4-568e-cd5f0c9f7bc8@suse.com>
 <5AD7680102000078001BC725@suse.com>
 <8f96a4df-c351-11be-72bd-7c70f3215540@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8pb7-0007JD-TG
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 16:06:17 +0000
In-Reply-To: <8f96a4df-c351-11be-72bd-7c70f3215540@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDE3OjU0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
OC8wNC8xOCAxNzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjA0LjE4IGF0IDE3
OjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDE4LzA0LzE4IDE3OjI5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAxOC4wNC4xOCBhdCAxMDozMCwgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+
Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKPj4+Pj4gQEAgLTk2Nyw3
ICs5NjcsNyBAQCBzdGF0aWMgaW50IHNoYWRvd19zZXRfbDRlKHN0cnVjdCBkb21haW4gKmQsCj4+
Pj4+ICAgICAgICAgIHNoX3B1dF9yZWYoZCwgb3NsM21mbiwgcGFkZHIpOwo+Pj4+PiAgICAgIH0K
Pj4+Pj4gIAo+Pj4+PiAtICAgIGlmICggIWNwdV9oYXNfbm9feHB0aSApCj4+Pj4+ICsgICAgaWYg
KCBpc19wdl9kb21haW4oZCkgJiYgZC0+YXJjaC5wdl9kb21haW4ueHB0aSApCj4+Pj4+ICAgICAg
ICAgIC8qCj4+Pj4+ICAgICAgICAgICAqIExhenkgZmx1c2hpbmcgaXMgZW5vdWdoOiBlaXRoZXIg
d2UgZG8gYSBUTEIgZmx1c2ggcmlnaHQgYWZ0ZXJ3YXJkcwo+Pj4+PiAgICAgICAgICAgKiB3aGlj
aCB3aWxsIHBpY2sgdXAgdGhlIG5ldyByb290IHBhZ2UgdGFibGUgb24gYWxsIGFmZmVjdGVkIGNw
dXMKPj4+Pgo+Pj4+IEhvdyBjb21lIHRoZSBpc19wdl9kb21haW4oKSBpcyBhcHBlYXJpbmcgb25s
eSBoZXJlPwo+Pj4KPj4+IEl0IGlzIG1hbmRhdG9yeSBmb3IgdGVzdGluZyB0aGUgcGVyLWRvbWFp
biB4cHRpIGZsYWcuIEkgY291bGQgYWRkIGl0IGluCj4+PiBwYXRjaCAxIGFscmVhZHkgaWYgeW91
IGxpa2UgdGhhdCBiZXR0ZXIuCj4+IAo+PiBXZWxsLCBpZiB5b3UgYWRkZWQgaXQgZWFybGllciwg
c29tZSB1bm5lY2Vzc2FyeSBJUElzIHdvdWxkIGJlIHN1cHByZXNzZWQKPj4gcmlnaHQgYXdheS4K
PiAKPiBXaGljaCBJUElzPyBUaGVyZSBpcyBubyBJUEkgaW52b2x2ZWQgaGVyZS4gV2UgYXJlIGp1
c3Qgc2V0dGluZyB0aGUgZmxhZ3MKPiBmcm9tIHRoZSBjdXJyZW50IGNwdSBmb3IgYWxsIGNwdXMg
d2hpY2ggbmVlZCB0byBwaWPhuLEgaXQgdXAuIFRoYXQncyB0aGUKPiByZWFzb24gZm9yIHRoZSBj
b21tZW50IHJlZ2FyZGluZyAibGF6eSBmbHVzaGluZyIuCgpPaCwgSSBkaWQgYXNzdW1lIGZsdXNo
X3Jvb3RfcGd0X21hc2soKSB3b3VsZCBiZSBhIGZ1bmN0aW9uIHRoYXQgSSBoYWQKc2VlbiBpbiBw
cmlvciB2ZXJzaW9ucywgaW52b2tpbmcgdGhlIHByb2Nlc3Npbmcgb2YgRkxVU0hfUk9PVF9QR1RC
TCBvbgpyZW1vdGUgQ1BVcy4KCkNsZWFybHkgd2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIGEgbmV3
IGZ1bmN0aW9uIHlvdSBzaG91bGQgaGF2ZSBkcm9wcGVkCm15IFItYjsgSSdsbCBjb21tZW50IHRo
ZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/microcode: Indicate "not found" in
 rc of microcode_resume_cpu()
Date: Thu, 12 Apr 2018 00:56:54 -0600
Message-ID: <5ACF1F5602000078001BA922@prv1-mh.provo.novell.com>
References: <5ACE2D9502000078001BA56C@prv1-mh.provo.novell.com>
 <20180411201458.26004-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9+ld=hb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f6WAF-0001sG-0T
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 06:56:59 +0000
In-Reply-To: <20180411201458.26004-1-simon@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE4IGF0IDIyOjE0LCA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4g
d3JvdGU6Cj4gTWFrZSBpdCBwb3NzaWJsZSB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGEgZmFpbHVy
ZSB0byBsb2FkIGEgbWljcm9jb2RlCj4gdXBkYXRlIGFuZCBhIGZhaWx1cmUgdG8gZmluZCBhbnkg
bWF0Y2hpbmcgbWljcm9jb2RlIHVwZGF0ZSBieSByZXR1cm5pbmcKPiAtRU5PRU5UIChpbnN0ZWFk
IG9mIC1FSU8pIGluIHRoZSBsYXRlciBjYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdh
aXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2
L21pY3JvY29kZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jIGIv
eGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gaW5kZXggNzdjMWVmYzk3Zi4uZTlmYWZiMWQxNCAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbWljcm9jb2RlLmMKPiBAQCAtMjQ4LDcgKzI0OCw3IEBAIGludCBtaWNyb2NvZGVfcmVzdW1l
X2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ICAgICAgX19taWNyb2NvZGVfZmluaV9jcHUoY3B1KTsK
PiAgICAgIHVjaS0+Y3B1X3NpZyA9IG5zaWc7Cj4gIAo+IC0gICAgZXJyID0gLUVJTzsKPiArICAg
IGVyciA9IC1FTk9FTlQ7Cj4gICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1MiApCj4gICAg
ICB7Cj4gICAgICAgICAgdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdTIpOwoKSSB0
aGluayB0aGlzIHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBvdGhlciBwYXRjaCwgYnV0IEknbGwgcmVw
bHkgdGhlcmUKaW4gYSBtaW51dGUuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

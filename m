From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 6/6] x86emul: generalize vector length
 handling for AVX512/EVEX
Date: Tue, 04 Sep 2018 06:50:47 -0600
Message-ID: <5B8E7FA702000078001E5209@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86ACEE02000078001E31FC@prv1-mh.provo.novell.com>
 <38ebd1b2-01d4-0b2d-4b84-a7b857df4872@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxAnG-0002JS-DV
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 12:50:54 +0000
In-Reply-To: <38ebd1b2-01d4-0b2d-4b84-a7b857df4872@citrix.com>
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

Pj4+IE9uIDA0LjA5LjE4IGF0IDEzOjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDgvMTggMTU6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMjgxOCw2
ICsyODE4LDkgQEAgeDg2X2RlY29kZSgKPj4gIAo+PiAgICAgICAgICAgICAgICAgIG9wY29kZSB8
PSBiIHwgTUFTS19JTlNSKHZleC5wZngsIFg4NkVNVUxfT1BDX1BGWF9NQVNLKTsKPj4gIAo+PiAr
ICAgICAgICAgICAgICAgIGlmICggIWV2ZXgubWJzICkKPiAKPiBUaGlzIHVzZSBvZiBtYnMgaXMg
dmVyeSBjb25mdXNpbmcgdG8gcmVhZC4gIEhvdyBhYm91dDoKPiAKPiAjZGVmaW5lIGV2ZXhfZW5j
b2RlZCBldmV4Lm1icwo+IAo+IHdoaWNoIGF0IGxlYXN0IGdpdmVzIGEgc2VtYW50aWMgbmFtZSB0
byB0aGUgaG93IHlvdSBhcmUgdXNpbmcgdGhlIG1icyBiaXQ/CgpBcyB5b3Ugc2VlbSB0byB0aGlu
ayBpdCBoZWxwcywgSSBjYW4gZG8gdGhhdC4gVG8gbWUgdGhlIHByZXNlbnQgZm9ybSB3YXMKb2J2
aW91cyBlbm91Z2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==

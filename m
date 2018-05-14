From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] vhpet: check that the set interrupt route
 is valid
Date: Mon, 14 May 2018 07:17:17 -0600
Message-ID: <5AF98C5D02000078001C27CC@prv1-mh.provo.novell.com>
References: <20180510090840.28688-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIDLv-0006Ib-2L
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 13:17:23 +0000
In-Reply-To: <20180510090840.28688-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE4IGF0IDExOjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC0zMDQsNiArMzEzLDMwIEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgaHBldF9maXh1cF9y
ZWcoCj4gICAgICByZXR1cm4gbmV3Owo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCB0aW1lcl9zYW5p
dGl6ZV9pbnQoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4pCgoiaW50IiBhcyBzb3J0IG9m
IGEgc3VmZml4IGhlcmUgbWlnaHQgYmUgbWlzbGVhZGluZyAoY291bGQgYmUgdmlld2VkIGFzIHNv
bWUKc29ydCBvZiBpbnRlZ2VyIGFzIHdlbGwpIC0gaG93IGFib3V0ICJyb3V0ZSIgKG9yICJpbnRf
cm91dGUiKSBpbnN0ZWFkPwoKPiArewo+ICsgICAgdW5zaWduZWQgaW50IGlycTsKPiArCj4gKyAg
ICBpZiAoIHRpbWVyX2ludF92YWxpZChoLCB0bikgKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4g
KyAgICBoLT5ocGV0LnRpbWVyc1t0bl0uY29uZmlnICY9IH5IUEVUX1ROX1JPVVRFOwoKUGxlYXNl
IGRvbid0IG9wZW4tY29kZSB0aW1lcl9jb25maWcoKSAoYWxzbyBiZWxvdyksIGRlc3BpdGUgdGhl
cmUgYmVpbmcKcXVpdGUgYSBmZXcgZXhhbXBsZXMgaW4gcHJlLWV4aXN0aW5nIGNvZGUuCgo+ICsg
ICAgaWYgKCAhdGltZXJfZW5hYmxlZChoLCB0bikgKQo+ICsgICAgICAgIHJldHVybjsKPiArCj4g
KyAgICAvKgo+ICsgICAgICogSWYgdGhlIHJlcXVlc3RlZCBpbnRlcnJ1cHQgaXMgbm90IHZhbGlk
IGFuZCB0aGUgdGltZXIgaXMKPiArICAgICAqIGVuYWJsZWQgcGljayB0aGUgZmlyc3QgaXJxLgo+
ICsgICAgICovCj4gKyAgICBpcnEgPSBmZnModGltZXJfaW50X3JvdXRlX2NhcChoLCB0bikpOwo+
ICsgICAgaWYgKCAhaXJxICkKPiArICAgIHsKPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKPiArICAgICAgICByZXR1cm47Cj4gKyAgICB9Cj4gKyAgICBoLT5ocGV0LnRpbWVyc1t0bl0u
Y29uZmlnIHw9IChpcnEgLSAxKSA8PCBIUEVUX1ROX1JPVVRFX1NISUZUOwoKSSB0aGluayBJIHdv
dWxkIHByZWZlciBmaW5kX2ZpcnN0X3NldF9iaXQoKSBpbnN0ZWFkIG9mIGZmcygpIGhlcmUsIHRv
IGF2b2lkIHRoZQpzdWJ0cmFjdGlvbiBvZiAxLiBBbHNvIHBsZWFzZSB1c2UgTUFTS19JTlNSKCkg
aGVyZSAtIEhQRVRfVE5fUk9VVEVfU0hJRlQKaXMgYSAjZGVmaW5lIHRoYXQgc2hvdWxkIGFjdHVh
bGx5IGdvIGF3YXkuCgpJJ20gYWxzbyB1bmNvbnZpbmNlZCB0aGUgYXNzZXJ0aW9uIGlzIHJlYWxs
eSB1c2VmdWwgaGVyZSAtIHRoZSBmaWVsZCBpbiBxdWVzdGlvbgppcyByL28sIGFuZCB3ZSBpbml0
aWFsaXplIGl0IHVuY29uZGl0aW9uYWxseSBpbiBocGV0X3NldCgpLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

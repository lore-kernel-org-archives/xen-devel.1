From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86: Meltdown band-aid against malicious
 64-bit PV guests
Date: Fri, 12 Jan 2018 09:34:41 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801120932540.15566@sstabellini-ThinkPad-X260>
References: <5A5899CA020000780019E014@prv-mh.provo.novell.com>
 <20180112170205.5tlaiczuhni63kuw@MacBook-Pro-de-Roger.local>
 <5A58FA9B020000780019E4EA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gk3p=eh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ea3EJ-00008j-1P
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 17:34:59 +0000
In-Reply-To: <5A58FA9B020000780019E4EA@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, security@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMiBKYW4gMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDEyLjAxLjE4
IGF0IDE4OjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBKYW4g
MTIsIDIwMTggYXQgMDM6MTk6MzhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gQEAg
LTc5OSw2ICs5ODIsMTAgQEAgdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBp
bgo+ID4+ICAKPiA+PiAgICAgIHN0YWNrX2Jhc2VbMF0gPSBzdGFja19zdGFydDsKPiA+PiAgCj4g
Pj4gKyAgICBpZiAoICFzZXR1cF9jcHVfcm9vdF9wZ3QoMCkgKQo+ID4+ICsgICAgICAgIHBhbmlj
KCJObyBtZW1vcnkgZm9yIHJvb3QgcGFnZSB0YWJsZVxuIik7Cj4gPj4gKyAgICBnZXRfY3B1X2lu
Zm8oKS0+cHZfY3IzID0gX19wYShwZXJfY3B1KHJvb3RfcGd0LCAwKSk7Cj4gPiAKPiA+IFdvdWxk
bid0IGl0IGJlIGhlbHBmdWwgdG8gaGF2ZSBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gZGVjaWRl
IHdoZXRoZXIKPiA+IHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUgb3Igbm90Pwo+IAo+IFdlbGwsIHRo
YXQgd291bGQgYmUgYW4gb3B0aW9uLCBidXQgZmFsbGluZyBpbnRvIHRoZSBvcHRpbWl6YXRpb24K
PiBjYXRlZ29yeS4gT25jZSB0aGUgYmFzaWMgY29uY2VwdCBoYXMgYmVlbiBwcm92ZW4gYnkgYSAy
bmQKPiBwYXJ0eSB0byBoYXZlIG5vIG9idmlvdXMgZmxhd3MsIGFsb25nIHdpdGggYmFja3BvcnRp
bmcgc29tZQo+IG9mIHRoZSBpbXByb3ZlbWVudHMgd291bGQgYmUgbXkgZ29hbCB0byB3b3JrIG9u
LCBidXQgdGhlCj4gbGF0dGVyIGJlaGluZCBsb29raW5nIGF0IHRoZSBTcGVjdHJlIHBhdGNoZXMg
KGkuZS4gSSBmaXJzdCB3YW50Cj4gdG8gZ2V0IGFsbCBmaXhlcyBzb3J0ZWQsIGFuZCB0aGVuIGRl
YWwgd2l0aCBpbXByb3ZlbWVudHMpLgoKVGhhdCdzIGFuIGFtYXppbmcgd29yaywgSmFuLiBUaGFu
ayB5b3UhIEZpbmFsbHksIGEgZml4IEkgY2FuIGRlcGxveS4gQXMKc29vbiBhcyB0aGlzIHBhdGNo
IGlzIHByb3Blcmx5IHZlcmlmaWVkLCBJIHRoaW5rIHdlIHNob3VsZCB1cGRhdGUgYWxsCnJlZmVy
ZW5jZXMgdG8gTWVsdGRvd24gaW4gb3VyIGRvY3MgYW5kIGFkdmlzb3JpZXMgdG8gcG9pbnQgdG8g
dGhpcyBmaXguCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

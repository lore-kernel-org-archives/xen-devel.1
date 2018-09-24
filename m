From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix comment on super page alignment
 requirement
Date: Mon, 24 Sep 2018 08:07:02 -0600
Message-ID: <5BA8EF8602000078001EB388@prv1-mh.provo.novell.com>
References: <20180924103835.12705-1-wei.liu2@citrix.com>
 <5BA8C83002000078001EB168@prv1-mh.provo.novell.com>
 <20180924133903.m5jwqn6epuqguhy3@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wm3w=mg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4RW0-0005wy-Jf
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 14:07:08 +0000
In-Reply-To: <20180924133903.m5jwqn6epuqguhy3@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA5LjE4IGF0IDE1OjM5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMDU6MTk6MTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyNC4wOS4xOCBhdCAxMjozOCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+ID4gKysrIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMKPj4gPiBAQCAtOTQ0LDEyICs5NDQsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1
cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPj4gPiAgCj4+ID4gICAgICAvKgo+
PiA+ICAgICAgICogSXRlcmF0ZSBiYWNrd2FyZHMgb3ZlciBhbGwgc3VwZXJwYWdlLWFsaWduZWQg
UkFNIHJlZ2lvbnMuCj4+ID4gLSAgICAgKiAKPj4gPiAtICAgICAqIFdlIHJlcXVpcmUgc3VwZXJw
YWdlIGFsaWdubWVudCBiZWNhdXNlIHRoZSBib290IGFsbG9jYXRvciBpcyBub3QgeWV0Cj4+ID4g
LSAgICAgKiBpbml0aWFsaXNlZC4gSGVuY2Ugd2UgY2FuIG9ubHkgbWFwIHN1cGVycGFnZXMgaW4g
dGhlIGFkZHJlc3MgcmFuZ2UKPj4gPiAtICAgICAqIDAgdG8gQk9PVFNUUkFQX0RJUkVDVE1BUF9F
TkQsIGFzIHRoaXMgaXMgZ3VhcmFudGVlZCBub3QgdG8gcmVxdWlyZQo+PiA+ICsgICAgICoKPj4g
PiArICAgICAqIFdlIHJlcXVpcmUgc3VwZXJwYWdlIGFsaWdubWVudCBiZWNhdXNlIHRoZSBib290
IGFsbG9jYXRvciBpcwo+PiA+ICsgICAgICogbm90IHlldCBpbml0aWFsaXNlZC4gSGVuY2Ugd2Ug
Y2FuIG9ubHkgbWFwIHN1cGVycGFnZXMgaW4gdGhlCj4+ID4gKyAgICAgKiBhZGRyZXNzIHJhbmdl
IEJPT1RTVFJBUF9NQVBfQkFTRSB0byAoQk9PVFNUUkFQX01BUF9CQVNFICsKPj4gPiArICAgICAq
IEJPT1RTVFJBUF9NQVBfTElNSVQpLCBhcyB0aGlzIGlzIGd1YXJhbnRlZWQgbm90IHRvIHJlcXVp
cmUKPj4gCj4+IFRoZSB1cHBlciBib3VuZCBpcyBub3QgYSBzdW0uIEJ1dCB0aGVyZSdzIHRoZW4g
YWxzbyBhbiBhcHBhcmVudAo+PiBkaXNjb25uZWN0OiBCT09UU1RSQVBfTUFQX0xJTUlUICE9Cj4+
IChBUlJBWV9TSVpFKGwyX2lkZW50bWFwKSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpIGFmYWljdCwg
eWV0Cj4+IHRoZSBsYXR0ZXIgaXMgd2hhdCBpcyB1c2VkIGZvciBtYXBwaW5nIChhbmQgd2hhdCBt
YXRjaGVzIHRoZSB2YWx1ZQo+PiBvZiBCT09UU1RSQVBfRElSRUNUTUFQX0VORCBpbiA0LjAuNCku
Cj4gCj4gWWVhaCwgSSBnb3QgYSBmZXcgc3VycHJpc2VzIHdoaWxlIHJlYWRpbmcgdGhhdCBjb2Rl
LiBJJ20gdHJ5aW5nIHRvCj4gZmlndXJlIG91dCB3aGF0IHRoZSBsaW1pdCBzaG91bGQgYmUgYXQg
dGhlIG1vbWVudC4KCjRHYgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

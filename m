From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 8/9] xen/consoled: discard NUL from guest
Date: Fri, 19 Jan 2018 11:03:02 +0000
Message-ID: <20180119110302.x7fm2txqjqqamfyi@MacBook-Pro-de-Roger.local>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-9-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0ckf=ae=citrix.com=prvs=55082200c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ecUS2-0004JR-6k
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 11:03:14 +0000
Content-Disposition: inline
In-Reply-To: <20180118181652.26397-9-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Sarah Newman <srn@prgmr.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMDY6MTY6NTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBBY2NvcmRpbmcgdG8gWzBdLCBzb21lIHByb2dyYW0gc2VuZHMgTlVMIGZvciBwYWRkaW5nIHB1
cnBvc2UuIFdlIGNhbgo+IGRpc2NhcmQgdGhlbS4KPiAKPiBodHRwczovL3d3dy5nbnUub3JnL3Nv
ZnR3YXJlL3Rlcm11dGlscy9tYW51YWwvdGVybWNhcC0xLjMvaHRtbF9tb25vL3Rlcm1jYXAuaHRt
bCNTRUM3Cj4gCj4gUmVwb3J0ZWQtYnk6IFNhcmFoIE5ld21hbiA8c3JuQHByZ21yLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWx0aG91Z2ggSSBoYXZl
IGEgc3VnZ2VzdGlvbiBiZWxvdy4KCj4gLS0tCj4gQ2M6IFNhcmFoIE5ld21hbiA8c3JuQHByZ21y
LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKPiBBIGJpdCBSRkMuIEF3YWl0aW5nIHRlc3QgcmVz
dWx0cy4KPiAtLS0KPiAgeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlZC5jIHwgNCArKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlZC5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25z
b2xlZC5jCj4gaW5kZXggNTUyYWJmNTc2Ni4uNmZjYjJhYTExNSAxMDA2NDQKPiAtLS0gYS94ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGVkLmMKPiArKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGVk
LmMKPiBAQCAtNzIsNyArNzIsOSBAQCBzaXplX3QgY29uc29sZWRfZ3Vlc3Rfcngodm9pZCkKPiAg
ICAgIHsKPiAgICAgICAgICBjaGFyIGMgPSBjb25zX3JpbmctPm91dFtNQVNLX1hFTkNPTlNfSURY
KGNvbnMrKywgY29uc19yaW5nLT5vdXQpXTsKCllvdSBjb3VsZCBhbHNvIGRvOgoKaWYgKCBjID09
ICdcMCcgKQogICAgY29udGludWU7CgpyZWN2IEFGQUlDVCBpdCdzIGp1c3QgYSBjb3NtZXRpYyBy
ZXR1cm4gdmFsdWUgdGhhdCdzIG5vdCBjb25zdW1lZCBieQp0aGUgY2FsbGVyLiBUaGlzIGF2b2lk
cyBjaGVja2luZyB0aGUgImlkeCA+PSBCVUZfU1oiIGNvbmRpdGlvbiB3aXRoCnRoZSBzYW1lIGlk
eCB2YWx1ZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

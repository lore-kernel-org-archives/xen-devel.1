From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4] x86: relocate pvh_info
Date: Tue, 23 Jan 2018 11:44:03 +0000
Message-ID: <20180123114403.72kafg4l77w7hqwq@citrix.com>
References: <20180122161304.16886-1-wei.liu2@citrix.com>
 <7cb1090e-5a1c-1bfc-9380-02c40a9d9690@citrix.com>
 <20180122181714.qex27ll46yivg6a7@citrix.com>
 <a5f5090c-e0cf-bf87-388c-390cf567b682@citrix.com>
 <20180122183131.6d3645zm35gduju7@citrix.com>
 <5A670B1B02000078001A1694@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4kka=es=citrix.com=prvs=55463bd4c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1edwzm-0004rx-Mr
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 11:44:06 +0000
Content-Disposition: inline
In-Reply-To: <5A670B1B02000078001A1694@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDI6MTQ6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjAxLjE4IGF0IDE5OjMxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIEphbiAyMiwgMjAxOCBhdCAwNjoxOTo0M1BNICswMDAwLCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+ID4+IE9uIDIyLzAxLzE4IDE4OjE3LCBXZWkgTGl1IHdyb3RlOgo+ID4+
ID4gU28geW91IHdhbnQgcmVsb2MubyB0byBjb250YWluIHB2aF9pbmZvX3JlbG9jIHVuY29uZGl0
aW9uYWxseT8KPiA+PiA+Cj4gPj4gPiBGdW5kYW1lbnRhbGx5IEkgZG9uJ3QgdGhpbmsgSSBjYXJl
IGVub3VnaCBhYm91dCBhbGwgdGhlIGJpa2VzaGVkZGluZyBzbwo+ID4+ID4gaWYgSmFuIGFuZCB5
b3UgYWdyZWUgb24gdGhpcyBJIHdpbGwganVzdCBtYWtlIHRoZSBjaGFuZ2UuCj4gPj4gCj4gPj4g
SXQgd29udC4gIFRoZSBmdW5jdGlvbiB3aWxsIGJlIGRyb3BwZWQgZHVlIHRvIERDRSwgYnV0IHdl
J2xsIHNwb3QgYnVpbGQKPiA+PiBicmVha2FnZXMgZmFyIG1vcmUgZWFzaWx5LiAgKFRoZSBpbXBv
cnRhbnQgYml0IGlzIHRoYXQgdGhlIGZ1bmN0aW9uIGNhbGwKPiA+PiBpcyBndWFyZGVkIGJ5IHRo
ZSBJU19FTkFCTEVEKCkpCj4gPiAKPiA+IHJlbG9jLm8gd2lsbCBzdGlsbCBoYXZlIHRoYXQgZnVu
Y3Rpb24gaW4gbm9uLVBWSCBidWlsZCBvbiBteSBtYWNoaW5lLgo+ID4gQW5kIHRoYXQncyB3aXRo
IHRoZSBmb2xsb3dpbmcgZGlmZiBhcHBsaWVkLgo+IAo+IFdlbGwsIERDRSBkb2Vzbid0IG1ha2Ug
YW55IHByb21pc2VzIHRvd2FyZHMgd2hhdCBpdCBpcyBhYmxlIHRvCj4gZWxpbWluYXRlLCB3aGlj
aCBpcyB3aHkgZ2VuZXJhbGx5IEkgcHJlZmVyIHRvIGhlbHAgdGhlIGNvbXBpbGVyIGluCj4gY2Fz
ZXMgbGlrZSB0aGUgb25lIGhlcmUuCj4gCgpJZiBJIHJlYWQgdGhpcyBjb3JyZWN0bHksIHRoaXMg
bWVhbnMgeW91IHByZWZlciB0aGUgaWZkZWYgQ09ORklHX1BWSF9HVUVTVAp2ZXJzaW9uPwoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

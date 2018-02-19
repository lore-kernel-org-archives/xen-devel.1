From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/4] x86/clang: restore integrated
 assembler usage with indirect thunks
Date: Mon, 19 Feb 2018 16:24:40 +0000
Message-ID: <20180219162440.qwoqsveibyny4gwf@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-3-roger.pau@citrix.com>
 <5A8B01EB02000078001A932E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enoFK-0004y2-Gh
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:24:54 +0000
Content-Disposition: inline
In-Reply-To: <5A8B01EB02000078001A932E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDg6NTc6MTVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L1J1bGVzLm1rCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvUnVsZXMubWsKPiA+IEBAIC00NCwzICs0NCwxNyBAQCBlbmRpZgo+ID4gIAo+ID4gICMgU2V0
IHVwIHRoZSBhc3NlbWJsZXIgaW5jbHVkZSBwYXRoIHByb3Blcmx5IGZvciBvbGRlciB0b29sY2hh
aW5zLgo+ID4gIENGTEFHUyArPSAtV2EsLUkkKEJBU0VESVIpL2luY2x1ZGUKPiA+ICsKPiA+ICtp
ZmVxICgkKGNsYW5nKSx5KQo+ID4gKyAgICAjIENoZWNrIHdoZXRoZXIgY2xhbmcgYXNtKCktcyBz
dXBwb3J0IC5pbmNsdWRlLgo+ID4gKyAgICBpZmVxICgkKGNhbGwgYXMtaW5zbiwkKENDKSAkKENG
TEFHUyksIi5pbmNsdWRlIFwiYXNtL2luZGlyZWN0X3RodW5rX2FzbS5oXCIiLHksbiksbikKPiAK
PiBJcyB0aGVyZSBhbnl0aGluZyBrZWVwaW5nIHlvdSBmcm9tIHVzaW5nIHRoZSBzbGlnaHRseSBs
ZXNzIHVnbHkgdG8gdXNlCj4gYXMtaW5zbi1jaGVjayBoZXJlPyBPaCwgaXQncyBhcHBhcmVudGx5
IHRoYXQgeW91IHdhbnQgdG8gdXNlIENGTEFHUywKPiBub3QgQUZMQUdTLiBJIHdvbmRlciB3aGV0
aGVyIHRoZSBvdGhlciBhcy1pbnNuLWNoZWNrIHVzZXMgd291bGRuJ3QKPiBiZXR0ZXIgaGF2ZSBD
RkxBR1MgcGFzc2VkIHRvby4gT3RoZXJ3aXNlIHBsZWFzZSBjbGFyaWZ5IHdoeSB0aGUKPiBvdGhl
ciBjb25zdHJ1Y3QgY2FuJ3QgYmUgdXNlZCBieSBleHRlbmRpbmcgdGhlIGNvbW1lbnQuCgpSaWdo
dCwgaXQncyBiZWNhdXNlIHRoZSAuaW5jbHVkZSBkaXJlY3RpdmUgaXMgdXNlZCB3aXRoIGFzbSgp
LXMgaW4gQwpmaWxlcyBzbyB0aGUgcGFyYW1ldGVycyBmb3IgYnVpbGRpbmcgdGhvc2UgdXNlIENG
TEFHUywgbm90IEFGTEFHUy4KCkFsc28gYXMtaW5zbi1jaGVjayBvbmx5IGxldCdzIHlvdSBhZGQg
dG8gYSB2YXJpYWJsZSBpbiB0aGUgc3VjY2VzcwpjYXNlLCBhbmQgaGVyZSBJIG5lZWQgdG8gZG8g
dGhlIG9wcG9zaXRlIGhlcmUuCgo+ID4gKyAgICAgICAgQ0ZMQUdTICs9IC1uby1pbnRlZ3JhdGVk
LWFzCj4gPiArICAgICMgQ2hlY2sgd2hldGhlciBjbGFuZyBrZWVwcyAubWFjcm8tcyBiZXR3ZWVu
IGFzbSgpLXM6Cj4gPiArICAgICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9p
ZD0zNjExMCAKPiA+ICsgICAgZWxzZSBpZmVxICgkKGlmICQoc2hlbGwgZWNobyAndm9pZCBfKHZv
aWQpIHsgYXNtIHZvbGF0aWxlICggIi5tYWNybyBGT09cbi5lbmRtIiApOyBcCj4gCj4gQ2FyZWZ1
bCB3aXRoIHRoaXM7IC4vUkVBRE1FIHN0aWxsIHNheXMgIkdOVSBtYWtlIDMuODAgb3IgbGF0ZXIi
IGFuZAo+IGlpcmMgMy44MCBkb2Vzbid0IHN1cHBvcnQgImVsc2UgaWYuLi4iIG9uIGEgc2luZ2xl
IGxpbmUuCgpIbSwgT0ssIEknbSBhZnJhaWQgSSBkb24ndCBoYXZlIGFjY2VzcyB0byBtYWtlIDMu
ODAsIGJ1dCBJIGNhbgpjZXJ0YWlubHkgZXhwYW5kIHRoaXMgdG8gYmUKCmVsc2UKICAgIGlmZXEK
ICAgIGVuZGlmCmVuZGlmCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

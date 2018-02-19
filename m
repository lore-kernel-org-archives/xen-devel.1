From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 4/4] build/clang: add a check whether the
 assembler supports .skip with labels
Date: Mon, 19 Feb 2018 16:16:10 +0000
Message-ID: <20180219161610.oea23dpjsi6zucgx@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-5-roger.pau@citrix.com>
 <5A8B051202000078001A9372@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eno7N-00045L-OE
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:16:41 +0000
Content-Disposition: inline
In-Reply-To: <5A8B051202000078001A9372@prv-mh.provo.novell.com>
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

T24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDk6MTA6NDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL1J1bGVzLm1rCj4gPiArKysgYi94ZW4vUnVsZXMubWsKPiA+IEBA
IC03Miw3ICs3MiwxMSBAQCBBRkxBR1MteSAgICAgICAgICAgICAgICArPSAtRF9fQVNTRU1CTFlf
Xwo+ID4gIAo+ID4gICMgT2xkZXIgY2xhbmcncyBidWlsdC1pbiBhc3NlbWJsZXIgZG9lc24ndCB1
bmRlcnN0YW5kIC5za2lwIHdpdGggbGFiZWxzOgo+ID4gICMgaHR0cHM6Ly9idWdzLmxsdm0ub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yNzM2OSAKPiA+IC1BRkxBR1MtJChjbGFuZykgICAgICAgICArPSAt
bm8taW50ZWdyYXRlZC1hcwo+ID4gK2lmZXEgKCQoY2xhbmcpLHkpCj4gPiAraWZlcSAoJChjYWxs
IGFzLWluc24sJChDQykgJChBRkxBR1MpLCIuTDA6XG4uTDE6XG4uc2tpcCAoLkwxIC0gLkwwKSIs
eSxuKSxuKQo+IAo+IEhtbSwgaGVyZSB5b3UgdXNlIEFGTEFHUywgc28gd2h5IG5vdCBhcy1pbnNu
LWNoZWNrPwoKQmVjYXVzZSBhcy1pbnNuLWNoZWNrIG9ubHkgbGV0cyB5b3UgYWRkIHRvIGEgdmFy
aWFibGUgb24gdGhlIHN1Y2Nlc3MKY2FzZSAoaWU6IHdoZW4gYXMtaW5zbiByZXR1cm5zICd5Jyks
IGFuZCBoZXJlIEkgbmVlZCB0byBkbyB0aGUKb3Bwb3NpdGUuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/4] build/clang: add a check whether the
 assembler supports .skip with labels
Date: Mon, 19 Feb 2018 09:10:42 -0700
Message-ID: <5A8B051202000078001A9372@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eno1k-0003WW-NN
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:10:52 +0000
In-Reply-To: <20180219141620.20008-5-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9SdWxlcy5tawo+ICsrKyBiL3hlbi9SdWxlcy5tawo+IEBAIC03Miw3ICs3Miwx
MSBAQCBBRkxBR1MteSAgICAgICAgICAgICAgICArPSAtRF9fQVNTRU1CTFlfXwo+ICAKPiAgIyBP
bGRlciBjbGFuZydzIGJ1aWx0LWluIGFzc2VtYmxlciBkb2Vzbid0IHVuZGVyc3RhbmQgLnNraXAg
d2l0aCBsYWJlbHM6Cj4gICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0y
NzM2OSAKPiAtQUZMQUdTLSQoY2xhbmcpICAgICAgICAgKz0gLW5vLWludGVncmF0ZWQtYXMKPiAr
aWZlcSAoJChjbGFuZykseSkKPiAraWZlcSAoJChjYWxsIGFzLWluc24sJChDQykgJChBRkxBR1Mp
LCIuTDA6XG4uTDE6XG4uc2tpcCAoLkwxIC0gLkwwKSIseSxuKSxuKQoKSG1tLCBoZXJlIHlvdSB1
c2UgQUZMQUdTLCBzbyB3aHkgbm90IGFzLWluc24tY2hlY2s/CgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

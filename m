From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 16/17] x86: introduce new defconfigs for PV
 and HVM
Date: Fri, 12 Oct 2018 16:34:06 +0100
Message-ID: <20181012153406.u3qqgyq4pwkqoebk@zion.uk.xensource.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <2b79cf7845e0e22f7a66b4d8e0b7279285669eac.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0BB9102000078001F119E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAzSA-0005FL-TH
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:34:14 +0000
Content-Disposition: inline
In-Reply-To: <5BC0BB9102000078001F119E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDk6MTk6NDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGV5IHdpbGwgYmUgdXNlZCBieSBidWlsZCB0ZXN0cy4KPiAKPiBBbmQgaXMgaXQg
ZGlmZmljdWx0IGZvciB0aGUgYnVpbGQgdGVzdHMgdG8gc2V0IHRoZXNlIHVwIHRoZW1zZWx2ZXM/
CgpJIHNwZWNpZmljYWxseSBzYWlkICJidWlsZCB0ZXN0cyIgYnV0IG5vdCAiQ0kgc3lzdGVtcyIu
CgpJdCB3b3VsZG4ndCBiZSB2ZXJ5IGRpZmZpY3VsdCBmb3IgYSBDSSBzeXN0ZW0gdG8gZ2VuZXJh
dGUgdGhlc2UgZmlsZXMsCmJ1dCBteSBpZGVhIGlzIHRoYXQgcHJvdmlkaW5nIHRoZXNlIGluIHRy
ZWUgY2FuIG1ha2UgdGhpbmdzIG1vcmUKY29udmVuaWVudCBmb3IgaHVtYW5zIC0tIGRldmVsb3Bl
cnMgYW5kIG1haW50YWluZXJzLgoKU3VwcG9zZSB5b3Ugd2FudCBhIGNvbnRyaWJ1dG9yIHRvIHRl
c3QgdGhlaXIgY2hhbmdlcywgaW5zdGVhZCBvZiB3cml0aW5nCiJmaXJzdCBwbGVhc2UgZ2VuZXJh
dGUgdGhlIGZvbGxvd2luZyBmaWxlcywgYW5kIHRoZW4gLi4uIiwgeW91IGp1c3QgZ2l2ZQp0aGVt
IGEgcnVuZSAvIHNvbWUgcnVuZXMgdG8gcmVmZXJlbmNlIHRoZXNlIGZpbGVzIGRpcmVjdGx5LiBU
aGVyZQpkb2Vzbid0IG5lZWQgZXhwbGFpbmluZyBhbmQgbm8gYW1iaWd1aXR5IHdpbGwgYXJpc2Uu
IEFuZCBpZiB0aGVyZSBpcwpkaXNhZ3JlZW1lbnQgb24gd2hhdCB3b3JrIG9yIHdoYXQgZG9lc24n
dCwgaXQgd291bGQgYmUgZWFzeSB0bwpyZXByb2R1Y2UuCgpUbyBtZSB0aGlzIGlzIGEgY2xlYXIg
d2luOiBhIHNtYWxsIGludmVzdG1lbnQgdGhhdCBjb21lcyB3aXRoIGxvbmcgdGVybQpiZW5lZml0
LgoKPiBJIGRvbid0IHJlYWxseSBsaWtlIHN1Y2ggYWRkaXRpb25zLCBpbiBwYXJ0aWN1bGFyIHRo
ZSBuZWl0aGVyLVBWLW5vci0KPiBIVk0gb25lICh3aGljaCBpcyBvdGhlcndpc2UgY29tcGxldGVs
eSB1c2VsZXNzKS4gQXQgdGhlIHZlcnkKPiBsZWFzdCB0aGF0IG9uZSBzaG91bGQgZ2FpbiBhIGNv
bW1lbnQgc2F5aW5nIGl0IGV4aXN0cyBmb3IgYnVpbGQKPiB0ZXN0aW5nIG9ubHkuCj4gCgpTdXJl
LCBJIGNhbiBkbyB0aGF0LgoKV2VpLgoKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

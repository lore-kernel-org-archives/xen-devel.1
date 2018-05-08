From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Mon, 7 May 2018 17:11:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yjlp=h3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fFqEJ-0008GG-Gv
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 00:11:43 +0000
In-Reply-To: <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, "paul_luperto@prqa.com" <paul_luperto@prqa.com>, Denys Balatsko <denys.balatsko@globallogic.com>, Rich Persaud <persaur@gmail.com>, Jonathan Daugherty <jtd@galois.com>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dorne>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCA2IEFwciAyMDE4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gPiAz
KSBVbmRlcnN0YW5kIGhvdyB0byBhZGRyZXNzIGRvbTAuIEZyZWVSVE9TIERvbTAgc291bmRzIGxp
a2UgYSBnb29kCj4gPiA+ID4gPiBzb2x1dGlvbi4KPiA+ID4gPiA+IE5leHQgc3RlcDogcmVhY2gg
b3V0IHRvIERvcm5lcndvcmtzIGFuZC9vciBvdGhlcnMgdGhhdCB3b3JrZWQgd2l0aAo+ID4gPiA+
ID4gRnJlZVJUT1Mgb24gWGVuIGJlZm9yZS4gRmlndXJlIG91dCB3aGV0aGVyIEZyZWVSVE9TIGlz
IGFjdHVhbGx5IGEKPiA+ID4gPiA+IHN1aXRhYmxlIHNvbHV0aW9uIGFuZCB3aGF0IG5lZWRzIHRv
IGJlIGRvbmUgdG8gcnVuIEZyZWVSVE9TIGFzIERvbTAuCj4gPiA+ID4gCj4gPiA+ID4gU29tZSB0
aGluZ3MgdG8gY2hlY2sgYXQgdGhpcyBzdGFnZToKPiA+ID4gPiBhKSBJIGJlbGlldmUgdGhlcmUg
aXMgYSBzYWZldHkgY2VydGlmaWVkIHZlcnNpb24gb2YgRnJlZVJUT1MgLSBJIGNvdWxkIG5vdAo+
ID4gPiA+IGZpbmQKPiA+ID4gPiBtdWNoLCBleGNlcHQgZm9yIGh0dHBzOi8vd3d3LmZyZWVydG9z
Lm9yZy9GcmVlUlRPUy0KPiA+ID4gPiBQbHVzL1NhZmV0eV9Dcml0aWNhbF9DZXJ0aWZpZWQvU2Fm
ZVJUT1MtU2FmZXR5LUNyaXRpY2FsLUNlcnRpZmljYXRpb24uc2h0bWwKPiA+ID4gPiAtCj4gPiA+
ID4gd2hpY2ggZGVzY3JpYmVzIFNhZmVSVE9TIGEgY29tbWVyY2lhbCBzYWZldHkgY2VydGlmaWVk
IEZyZWVSVE9TIGFuZAo+ID4gPiA+IChtb3N0bHkpIEFQSSBjb21wbGlhbnQgdmVyc2lvbiBvZiBG
cmVlUlRPUy4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZwo+ID4gPiA+IGhlcmU/Cj4gPiA+ID4g
YikgVGhlcmUgaXMgYSBEb21VIGNhcGFibGUgdmVyc2lvbiBmcm9tIEdhbG9pcyAoSm9uYXRoYW4g
RG9jaGVydHkgQ0MnZWQpIC0KPiA+ID4gPiBJIGRvbid0IGtub3cgd2hldGhlciBvdGhlcnMgYWxz
byBoYXZlIHN1Y2ggdmVyc2lvbnMKPiA+ID4gCj4gPiA+IEkgcG9ydGVkIHRoZSB2ZXJzaW9uIG9m
IEZyZWVSVE9TIHRoYXQgWGlsaW54IGRpc3RyaWJ1dGVzIHdpdGggdGhlaXIgU0RLIHRvCj4gPiA+
IHJ1biBhcyBhIGRvbVUgb24gdGhlIFpVUysgaW4gMjAxNiBhbmQgcm91bmQgdHJpcHBlZCB0aGUg
Y2hhbmdlIHNldCBiYWNrIHRvCj4gPiA+IFJpY2hhcmQgQmFycnkuCj4gPiA+IEkndmUgYWxzbyBo
ZWFyZCBpbnRlcmVzdCBpbiBydW5uaW5nIFJURU1TIGFzIGEgZ3Vlc3QgT1MuCj4gPiA+IAo+ID4g
Cj4gPiBXZSd2ZSBoYWQgZXhwZXJpZW5jZSBpbiBydW5uaW5nIFFOWCBpbiBkb211LCBidXQgdGhh
dCB3YXMgbm90IHZlcnkgd2VsY29tZWQgYnkKPiA+IEJCIFFTU0wgZm9sa3MgYmFjayB0aGVuIDop
IFRoZXkgZG9udCByZWFsbHkgbGlrZSBPU1MKCk9uZSBtb3JlIG9wdGlvbiAoYXBwYXJlbnRseSB0
YWtlbiBieSBvdGhlcnMpIGlzIHRvIGRlbW9uc3RyYXRlIHRoYXQKYWZ0ZXIgYm9vdCBEb20wIGNh
bm5vdCBhZmZlY3QgdGhlIHN5c3RlbSBhbnltb3JlLiBUbyBkbyB0aGF0LCB3ZSB3b3VsZApoYXZl
IHRvIGdldCByaWQgb2YgRG9tMCBlbnRpcmVseSBhZnRlciBib290aW5nIGFsbCBkb21haW5zLCBv
ciwKZGVwcml2aWxlZ2UvcmVzdHJpY3QgaXRzIHBvc3NpYmxlIGVmZmVjdHMgb24gdGhlIHN5c3Rl
bS4gU29tZXRoaW5nIGxpa2UKdHVybmluZyBEb20wIGludG8gYSBEb21VIGFmdGVyIGJvb3Rpbmcg
YWxsIHRoZSBvdGhlciBndWVzdHMuCgpUaGlzIG1pZ2h0IGFjdHVhbGx5IGJlIGVhc2llciB0byBh
Y2hpZXZlIHRoYW4gImRvbTAtbGVzcyIgb3IgdXNpbmcKRnJlZVJUT1MgYXMgZG9tMC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

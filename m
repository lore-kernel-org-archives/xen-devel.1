From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Tue, 22 May 2018 10:50:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805221048340.24793@sstabellini-ThinkPad-X260>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
 <78c07b55-c301-598e-3894-009f2bdda1ac@arm.com>
 <alpine.DEB.2.10.1805080841580.4953@sstabellini-ThinkPad-X260>
 <CABcWhv4qY62_0vhAVGOz1y0hsqkRn4WQ8=UW_JnEXk5NhpTVDA@mail.gmail.com>
 <alpine.DEB.2.10.1805101244360.9199@sstabellini-ThinkPad-X260>
 <2e45f599-dea5-4974-5b0d-830c732e99bb@epam.com>
 <c137e3b91d234a2ca15c8e9c6ac2955f@dornerworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jkpe=ij=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fLBQP-0004OF-MB
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 17:50:17 +0000
In-Reply-To: <c137e3b91d234a2ca15c8e9c6ac2955f@dornerworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jarvis Roach <Jarvis.Roach@dornerworks.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Davorin Mista <davorin.mista@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, "paul_luperto@prqa.com" <paul_luperto@prqa.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "julien.grall@arm.com" <julien.grall@arm.com>, Rich Persaud <persaur@gmail.com>, =?UTF-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Praveen Kumar <kpraveen.lkml@gmail.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, xen-devel <xen-devel@lists.xenproject.org>, Jonathan Daugherty <jtd@galois.com>, Denys Balatsko <denys.balatsko@globallogic.com>"vfachin@de.adit-jv.com" <v>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBNYXkgMjAxOCwgSmFydmlzIFJvYWNoIHdyb3RlOgo+ID4gPiBGb3IgaW5zdGFu
Y2UsIGhlcmUgaXMgYW5vdGhlciBpZGVhOiB3ZSBjb3VsZCBoYXZlIFhlbiBib290IG11bHRpcGxl
Cj4gPiA+IGRvbWFpbnMgYXQgYm9vdCB0aW1lIGZyb20gZGV2aWNlIHRyZWUsIGFzIHN1Z2dlc3Rl
ZCBpbiB0aGUgZG9tMC1sZXNzCj4gPiA+IGFwcHJvYWNoLiBBbGwgb2YgdGhlIGRvbWFpbnMgYm9v
dGVkIGZyb20gWGVuIGFyZSAibWlzc2lvbi1jcml0aWNhbCIuCj4gPiA+IFRoZSBmaXJzdCBkb21h
aW4gY291bGQgc3RpbGwgYmUgZG9tMC4gT25jZSBib290ZWQsIERvbTAgY2FuIHN0YXJ0Cj4gPiA+
IG90aGVyIFZNcywgaG93ZXZlciwgWGVuIHdvdWxkIHJlc3RyaWN0IERvbTAgZnJvbSBkb2luZyBh
bnkgb3BlcmF0aW9ucwo+ID4gPiBhZmZlY3RpbmcgdGhlIGZpcnN0IHNldCBvZiBtaXNzaW9uLWNy
aXRpY2FsIGRvbWFpbnMuCj4gPiA+Cj4gCj4gRG9lcyB0aGUgZmlyc3QgZG9tYWluIGhhdmUgdG8g
YmUgZG9tMD8gV291bGQgaXQgYmUgcG9zc2libGUgdG8gaGF2ZSBkb21haW5zIGJvb3QgaW4gcGFy
YWxsZWwgKGVzcGVjaWFsbHkgaWYgYWxsb2NhdGVkIHRvIHNlcGFyYXRlIENQVSBjb3Jlcykgc3Vj
aCB0aGF0IGEgc2ltcGxlIE9TIChsaWtlIEZyZWVSVE9TKSB3b3VsZCBjb21wbGV0ZSBib290aW5n
IGJlZm9yZSBkb20wL0xpbnV4PyBJbiBvdGhlciB3b3JkcywgZG9lcyB0aGUgaHlwZXJ2aXNvciBo
YXZlIGFueSBkZXBlbmRlbmNpZXMgb24gZG9tMCBoYXZpbmcgcGVyZm9ybWVkIGNlcnRhaW4gZnVu
Y3Rpb25zIChpbnRlcnJ1cHQgY29uZmlndXJhdGlvbiwgTU1VIHRhYmxlIGluaXRpYWxpemF0aW9u
LCB0aW1lcnMsIGV0Yy4pIGJlZm9yZSBpdCBjYW4gY3JlYXRlIGFuZCBzdGFydCBhZGRpdGlvbmFs
IFZNcz8KPiAKCkkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNpZXMgZXhjZXB0
IGZvciB4ZW5zdG9yZSBhbmQgUFYKcHJvdG9jb2wgYWNjZXNzLiBJdCBzaG91bGQgYmUgcG9zc2li
bGUgdG8gYm9vdCBEb20wIGFuZCB0aGUgb3RoZXIgZG9tYWluCmluIHBhcmFsbGVsLCBhcyBsb25n
IGFzIHRoZSBvdGhlciBkb21haW4gaXMgbGlrZSBhIGJhcmVtZXRhbCBndWVzdCAobm8KUFYgbmV0
d29yay9kaXNrIGFjY2VzcykuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs

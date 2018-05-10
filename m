From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Thu, 10 May 2018 12:51:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805101244360.9199@sstabellini-ThinkPad-X260>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
 <78c07b55-c301-598e-3894-009f2bdda1ac@arm.com>
 <alpine.DEB.2.10.1805080841580.4953@sstabellini-ThinkPad-X260>
 <CABcWhv4qY62_0vhAVGOz1y0hsqkRn4WQ8=UW_JnEXk5NhpTVDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ph90=h5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fGrbX-00033q-Jo
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 19:51:55 +0000
In-Reply-To: <CABcWhv4qY62_0vhAVGOz1y0hsqkRn4WQ8=UW_JnEXk5NhpTVDA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Davorin Mista <davorin.mista@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, paul_luperto@prqa.com, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Rich Persaud <persaur@gmail.com>, =?UTF-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, julien.grall@arm.com, robin.randhawa@arm.com, committers@xenproject.org, anastassios.nanos@onapp.com, xen-devel <xen-devel@lists.xenproject.org>, Jonathan Daugherty <jtd@galois.com>, Denys Balatsko <denys.balatsko@globallogic.com>, vfachin@de.adit-jv.com, Jarvis Roach <Jarvis.Roach@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMCBNYXkgMjAxOCwgUHJhdmVlbiBLdW1hciB3cm90ZToKPiA+IFllYWgsIHlvdSBh
cmUgcmlnaHQuIEl0IGxvb2tzIGxpa2UgdHVybmluZyBEb20wIGludG8gYSBEb21VIGlzIG5vdCBn
b29kCj4gPiBlbm91Z2guIE1heWJlIGZvciB0aGlzIG9wdGlvbiB0byBiZSB2aWFibGUgd2Ugd291
bGQgYWN0dWFsbHkgaGF2ZSB0bwo+ID4gdGVybWluYXRlIChvciBwYXVzZSBhbmQgbmV2ZXIgdW5w
YXVzZT8pIGRvbTAgYWZ0ZXIgYm9vdC4KPiAKPiBKdXN0IGEgdGhvdWdodCAhCj4gSG93IGFib3V0
IGtlZXBpbmcgRG9tMCBzdGlsbCBiZSB0aGVyZSwgYnV0IERvbVVzIGdpdmVuIERvbTAgcHJpdmls
ZWdlLCB3aXRoCj4gcmVzdHJpY3RlZCBwZXJtaXNzaW9uIG9uIG1pc3Npb24gY3JpdGljYWwgcmVz
b3VyY2VzID8gQW5kIGlmIGFueWhvdyBEb20wCj4gY3Jhc2hlcywKPiB0aGUgYmVzdCBjb250ZW5k
ZWQgYW1vbmcgdGhlIGV4aXN0aW5nIERvbVVzIHRha2UgdGhlIG93bmVyc2hpcCBvZiBEb20wID8K
CkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBlYXNpbHkgZG9hYmxlLCBhbHNvIGl0IHdvdWxkbid0IHNv
bHZlIHRoZSBpc3N1ZSBvZgpyZW1vdmluZyBkb20wIGZyb20gdGhlIHN5c3RlbS4gQnV0IHNlZSBi
ZWxvdy4KCgo+ID4gPiBIb3dldmVyLCB5b3Ugc3VyZWx5IG5lZWQgYW4gZW50aXR5IHRvIGhhbmRs
ZSBkb21haW4gY3Jhc2guIFlvdSBkb24ndAo+IHdhbnQgdG8KPiA+ID4gcmVib290IHlvdXIgcGxh
dGZvcm0gKGFuZCB0aGVyZWZvcmUgeW91IHNhZmV0eSBjcml0aWNhbCBkb21haW4pIGZvciBhCj4g
Y3Jhc2hlZAo+ID4gPiBVSSwgcmlnaHQ/IFNvIGhvdyB0aGlzIGlzIGdvaW5nIHRvIGJlIGhhbmRs
ZWQgaW4geW91ciBvcHRpb24/Cj4gCj4gPiBXZSBuZWVkIHRvIHVuZGVyc3RhbmQgdGhlIGNlcnRp
ZmljYXRpb24gcmVxdWlyZW1lbnRzIGJldHRlciB0byBrbm93IHRoZQo+ID4gYW5zd2VyIHRvIHRo
aXMuIEkgYW0gZ3Vlc3NpbmcgdGhhdCBVSSBjcmFzaGVzIGFyZSBub3QgaGFuZGxlZCBmcm9tIHRo
ZQo+ID4gY2VydGlmaWNhdGlvbiBwb2ludCBvZiB2aWV3IC0tIG1heWJlIHdlIG9ubHkgbmVlZCB0
byBkZW1vbnN0cmF0ZSB0aGF0Cj4gPiB0aGUgc3lzdGVtIGlzIG5vdCBhZmZlY3RlZCBieSB0aGVt
Pwo+IAo+IFdoZXJlIGNhbiB3ZSBmaW5kIHRoZSBjZXJ0aWZpY2F0aW9uIHJlcXVpcmVtZW50cyBk
ZXRhaWxzID8KClllcywgSSB0aGluayB3ZSBuZWVkIHRvIHVuZGVyc3RhbmQgdGhlIHJlcXVpcmVt
ZW50cyBiZXR0ZXIgdG8gZmlndXJlIG91dAp0aGUgcmlnaHQgd2F5IGZvcndhcmQgZm9yIERvbTAu
CgpGb3IgaW5zdGFuY2UsIGhlcmUgaXMgYW5vdGhlciBpZGVhOiB3ZSBjb3VsZCBoYXZlIFhlbiBi
b290IG11bHRpcGxlCmRvbWFpbnMgYXQgYm9vdCB0aW1lIGZyb20gZGV2aWNlIHRyZWUsIGFzIHN1
Z2dlc3RlZCBpbiB0aGUgZG9tMC1sZXNzCmFwcHJvYWNoLiBBbGwgb2YgdGhlIGRvbWFpbnMgYm9v
dGVkIGZyb20gWGVuIGFyZSAibWlzc2lvbi1jcml0aWNhbCIuIFRoZQpmaXJzdCBkb21haW4gY291
bGQgc3RpbGwgYmUgZG9tMC4gT25jZSBib290ZWQsIERvbTAgY2FuIHN0YXJ0IG90aGVyIFZNcywK
aG93ZXZlciwgWGVuIHdvdWxkIHJlc3RyaWN0IERvbTAgZnJvbSBkb2luZyBhbnkgb3BlcmF0aW9u
cyBhZmZlY3RpbmcgdGhlCmZpcnN0IHNldCBvZiBtaXNzaW9uLWNyaXRpY2FsIGRvbWFpbnMuCgpU
aGlzIHdheSwgd2Ugd291bGQgZ2V0IHRoZSBmbGV4aWJpbGl0eSBvZiBiZWluZyBhYmxlIHRvIHN0
YXJ0L3N0b3AKZG9tYWlucyBhdCBydW4gdGltZSwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgd2UgbWln
aHQgc3RpbGwgYmUgYWJsZSB0bwphdm9pZCBjZXJ0aWZpY2F0aW9ucyBmb3IgRG9tMCwgYmVjYXVz
ZSBEb20wIGNhbm5vdCBhZmZlY3QgdGhlIG1pc3Npb24KY3JpdGljYWwgYXBwbGljYXRpb25zLgoK
SXMgdGhpcyBhcHByb2FjaCBhY3R1YWxseSBmZWFzaWJsZT8gV2UgbmVlZCB0byByZWFkIHRoZSBy
ZXF1aXJlbWVudHMgdG8Ka25vdy4gSSBhbSBob3BpbmcgQXJ0ZW0gd2lsbCBjaGltZSBpbiBvbiB0
aGlzIDotKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

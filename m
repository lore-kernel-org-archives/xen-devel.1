From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Tue, 8 May 2018 14:39:51 +0100
Message-ID: <78c07b55-c301-598e-3894-009f2bdda1ac@arm.com>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+yo8=h3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fG2qU-0008Ll-Ht
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 13:39:58 +0000
In-Reply-To: <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, "paul_luperto@prqa.com" <paul_luperto@prqa.com>, Denys Balatsko <denys.balatsko@globallogic.com>, Jonathan Daugherty <jtd@galois.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Rich Persaud <persaur@gmail.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA4LzA1LzE4IDAxOjExLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gRnJpLCA2IEFwciAyMDE4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+PiAz
KSBVbmRlcnN0YW5kIGhvdyB0byBhZGRyZXNzIGRvbTAuIEZyZWVSVE9TIERvbTAgc291bmRzIGxp
a2UgYSBnb29kCj4+Pj4+PiBzb2x1dGlvbi4KPj4+Pj4+IE5leHQgc3RlcDogcmVhY2ggb3V0IHRv
IERvcm5lcndvcmtzIGFuZC9vciBvdGhlcnMgdGhhdCB3b3JrZWQgd2l0aAo+Pj4+Pj4gRnJlZVJU
T1Mgb24gWGVuIGJlZm9yZS4gRmlndXJlIG91dCB3aGV0aGVyIEZyZWVSVE9TIGlzIGFjdHVhbGx5
IGEKPj4+Pj4+IHN1aXRhYmxlIHNvbHV0aW9uIGFuZCB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgdG8g
cnVuIEZyZWVSVE9TIGFzIERvbTAuCj4+Pj4+Cj4+Pj4+IFNvbWUgdGhpbmdzIHRvIGNoZWNrIGF0
IHRoaXMgc3RhZ2U6Cj4+Pj4+IGEpIEkgYmVsaWV2ZSB0aGVyZSBpcyBhIHNhZmV0eSBjZXJ0aWZp
ZWQgdmVyc2lvbiBvZiBGcmVlUlRPUyAtIEkgY291bGQgbm90Cj4+Pj4+IGZpbmQKPj4+Pj4gbXVj
aCwgZXhjZXB0IGZvciBodHRwczovL3d3dy5mcmVlcnRvcy5vcmcvRnJlZVJUT1MtCj4+Pj4+IFBs
dXMvU2FmZXR5X0NyaXRpY2FsX0NlcnRpZmllZC9TYWZlUlRPUy1TYWZldHktQ3JpdGljYWwtQ2Vy
dGlmaWNhdGlvbi5zaHRtbAo+Pj4+PiAtCj4+Pj4+IHdoaWNoIGRlc2NyaWJlcyBTYWZlUlRPUyBh
IGNvbW1lcmNpYWwgc2FmZXR5IGNlcnRpZmllZCBGcmVlUlRPUyBhbmQKPj4+Pj4gKG1vc3RseSkg
QVBJIGNvbXBsaWFudCB2ZXJzaW9uIG9mIEZyZWVSVE9TLiBPciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nCj4+Pj4+IGhlcmU/Cj4+Pj4+IGIpIFRoZXJlIGlzIGEgRG9tVSBjYXBhYmxlIHZlcnNpb24g
ZnJvbSBHYWxvaXMgKEpvbmF0aGFuIERvY2hlcnR5IENDJ2VkKSAtCj4+Pj4+IEkgZG9uJ3Qga25v
dyB3aGV0aGVyIG90aGVycyBhbHNvIGhhdmUgc3VjaCB2ZXJzaW9ucwo+Pj4+Cj4+Pj4gSSBwb3J0
ZWQgdGhlIHZlcnNpb24gb2YgRnJlZVJUT1MgdGhhdCBYaWxpbnggZGlzdHJpYnV0ZXMgd2l0aCB0
aGVpciBTREsgdG8KPj4+PiBydW4gYXMgYSBkb21VIG9uIHRoZSBaVVMrIGluIDIwMTYgYW5kIHJv
dW5kIHRyaXBwZWQgdGhlIGNoYW5nZSBzZXQgYmFjayB0bwo+Pj4+IFJpY2hhcmQgQmFycnkuCj4+
Pj4gSSd2ZSBhbHNvIGhlYXJkIGludGVyZXN0IGluIHJ1bm5pbmcgUlRFTVMgYXMgYSBndWVzdCBP
Uy4KPj4+Pgo+Pj4KPj4+IFdlJ3ZlIGhhZCBleHBlcmllbmNlIGluIHJ1bm5pbmcgUU5YIGluIGRv
bXUsIGJ1dCB0aGF0IHdhcyBub3QgdmVyeSB3ZWxjb21lZCBieQo+Pj4gQkIgUVNTTCBmb2xrcyBi
YWNrIHRoZW4gOikgVGhleSBkb250IHJlYWxseSBsaWtlIE9TUwo+IAo+IE9uZSBtb3JlIG9wdGlv
biAoYXBwYXJlbnRseSB0YWtlbiBieSBvdGhlcnMpIGlzIHRvIGRlbW9uc3RyYXRlIHRoYXQKPiBh
ZnRlciBib290IERvbTAgY2Fubm90IGFmZmVjdCB0aGUgc3lzdGVtIGFueW1vcmUuCgpDYW4geW91
IGRlc2NyaWJlIHdoYXQgeW91IG1lYW4gYnkgImFmZmVjdGluZyB0aGUgc3lzdGVtIGFueW1vcmUi
LgoKPiBUbyBkbyB0aGF0LCB3ZSB3b3VsZAo+IGhhdmUgdG8gZ2V0IHJpZCBvZiBEb20wIGVudGly
ZWx5IGFmdGVyIGJvb3RpbmcgYWxsIGRvbWFpbnMsIG9yLAo+IGRlcHJpdmlsZWdlL3Jlc3RyaWN0
IGl0cyBwb3NzaWJsZSBlZmZlY3RzIG9uIHRoZSBzeXN0ZW0uIFNvbWV0aGluZyBsaWtlCj4gdHVy
bmluZyBEb20wIGludG8gYSBEb21VIGFmdGVyIGJvb3RpbmcgYWxsIHRoZSBvdGhlciBndWVzdHMu
Cj4gVGhpcyBtaWdodCBhY3R1YWxseSBiZSBlYXNpZXIgdG8gYWNoaWV2ZSB0aGFuICJkb20wLWxl
c3MiIG9yIHVzaW5nCj4gRnJlZVJUT1MgYXMgZG9tMC4KCk90aGVyIHRoYW4gYWNjZXNzaW5nIHRo
ZSBoeXBlcmNhbGwsIHRoZXJlIGFyZSBmZXcgb3RoZXIgd2F5IGZvciBEb20wIHRvIAphZmZlY3Qg
dGhlIHBsYXRmb3JtOgoJLSBEb20wIGJ5IGRlZmF1bHQgaGFzIGFjY2VzcyB0byBhbGwgdGhlIGhh
cmR3YXJlIGJ1dCB0aGUgb25lIGFzc2lnbmVkIAp0byBEb21Vcy4gVGhvc2UgaGFyZHdhcmUgbWF5
IGdpdmUgdGhlIHBvc3NpYmlsaXR5IHRvIGFmZmVjdCB0aGUKcGxhdGZvcm0gaXJyZXZlcnNpYmx5
IChvciBldmVuIHJlYm9vdGluZykuCgktIE5vdCBhbGwgRE1BLWNhcGFibGUgZGV2aWNlcyBhcmUg
dG9kYXkgcHJvdGVjdGVkIGJ5IGFuIElPTU1VCgpZb3UgcHJvYmFibHkgY2FuIGNyZWF0ZSBzb21l
dGhpbmcgc2ltaWxhciB0byB0aGUgaGFyZHdhcmUgZG9tYWluIGFzIG9uIAp4ODYgKGkuZSBhbGwg
dGhlIGhhcmR3YXJlIGlzIG93bmVkIGJ5IGEgc2VwYXJhdGUgZG9tYWluIG90aGVyIHRoYW4gCkRv
bTApLCBidXQgdGhlbiBpdCBpcyBvbmx5IHNoaWZ0aW5nIHRoZSBwcm9ibGVtLgoKSG93ZXZlciwg
eW91IHN1cmVseSBuZWVkIGFuIGVudGl0eSB0byBoYW5kbGUgZG9tYWluIGNyYXNoLiBZb3UgZG9u
J3QgCndhbnQgdG8gcmVib290IHlvdXIgcGxhdGZvcm0gKGFuZCB0aGVyZWZvcmUgeW91IHNhZmV0
eSBjcml0aWNhbCBkb21haW4pIApmb3IgYSBjcmFzaGVkIFVJLCByaWdodD8gU28gaG93IHRoaXMg
aXMgZ29pbmcgdG8gYmUgaGFuZGxlZCBpbiB5b3VyIG9wdGlvbj8KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

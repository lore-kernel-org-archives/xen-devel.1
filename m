From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] CODING_STYLE: explicitly call out label
 indentation
Date: Tue, 27 Nov 2018 10:17:49 -0700
Message-ID: <5BFD7C3D02000078002007E9@prv1-mh.provo.novell.com>
References: <5BFBB70502000078001FFBDC@prv1-mh.provo.novell.com>
 <20181127152313.aicyygwdipch3fbf@zion.uk.xensource.com>
 <5BFD656A02000078002006EA@prv1-mh.provo.novell.com>
 <23549.28476.853916.355490@mariner.uk.xensource.com>
 <35a60c3a-8b80-c5e8-48e9-f65fb9828364@citrix.com>
 <57FE1FC9-1014-47C2-99BC-D7501766B688@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRgzk-00017T-M9
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 17:17:56 +0000
In-Reply-To: <57FE1FC9-1014-47C2-99BC-D7501766B688@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDE4OjA5LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gTm92IDI3LCAyMDE4LCBhdCA0OjQ4IFBNLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjcvMTEvMjAxOCAxNjoyMiwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4+PiBTaW5jZSB0aGVyZSB3YXMgc29tZSBjb25mdXNpb24gYWJvdXQgd2hh
dCB3ZSBhcmUgdGFsa2luZyBhYm91dCwgc2VlCj4+PiBiZWxvdy4gIE9idmlvdXNseSB0aGUgZGlm
ZiBvdXRwdXQgaW4gbXkgYDEnIHRlc3QgY2FzZXMgaXMKPj4+IHByZWZlcmVhYmxlLiAgIE5vdGUg
dGhhdCBgZ2l0IGRpZmYnIGRvZXMgdGhlIHNhbWUgdGhpbmcgYXMgZGlmZiAtcAo+Pj4gKGFuZCBp
dCBkb2Vzbid0IGV2ZW4gbmVlZCBhIC1wIG9wdGlvbiB0byBkbyBpdCkuCj4+IAo+PiBBZnRlciBz
b21lIGludmVzdGlnYXRpb24sIGdpdCBkb2VzIHRoZSBjb3JyZWN0IHRoaW5nIHdoZW4geW91IGFz
ayB0bwo+PiB0cmVhdCBjIGZpbGVzIGFzIGMgZmlsZXMuCj4+IAo+PiBhbmRyZXdjb29wQGFuZHJl
d2Nvb3A6fiQgY2F0IC5jb25maWcvZ2l0L2F0dHJpYnV0ZXMKPj4gKi5baGNdIGRpZmY9Y3BwCj4+
IAo+PiBUaGlzIGhhcyB0aGUgYWRkaXRpb25hbCBzaWRlIGVmZmVjdCBvZiBtYWtpbmcgYGdpdCBk
aWZmIC0tY29sb3Itd29yZHNgCj4+IGFuZCBmcmllbmRzIGZhciBtb3JlIGxlZ2libGUgYW5kIG5p
Y2UgdG8gdXNlLiAgSXRzIGEgc2hhbWUgdGhpcyBpc24ndAo+PiB0aGUgZGVmYXVsdC4KPj4gCj4+
PiBJIGFsc28gb2JzZXJ2ZSB0aGF0IGJ5IGRlZmF1bHQsIGVtYWNzIHdhbnRzIHRvIGluZGVudCB0
aGUgbGFiZWwgYnkgMQo+Pj4gY2hhcmFjdGVyIC0gZXZlbiB0aG91Z2ggdXN1YWxseSBpdCBsaWtl
cyB0byBhbGlnbiBsYWJlbHMgdG8gdGhlIExIUyBvZgo+Pj4gdGhlIGVuY2xvc2luZyBibG9jay4g
IFByZXN1bWFibHkgZm9yIHRoaXMgcmVhc29uLgo+PiAKPj4gQW5kIGFmdGVyIHNvbWUgaW52ZXN0
aWdhdGlvbiwgZW1hY3MgZG9lcyB0aGUgd3JvbmcgdGhpbmcgaW4gdGhlIFhlbiB0cmVlCj4+IGJl
Y2F1c2Ugd2UgZXhwbGljaXRseSBhc2sgZm9yIEJTRCBzdHlsZSBpbiB0aGUgbG9jYWwgYmxvY2su
Cj4+IAo+PiBXZSBzaG91bGQgbWFrZSBhIGNob2ljZSwgdGhlbiBmaXggb3VyIGF1dG9tYXRpYyB0
b29saW5nIHRvIG5vdCBmb3JjZQo+PiBjb2RlIHRvIGJlIG5vbi1jb21wbGlhbnQuCj4gCj4gRldJ
VywgaGF2aW5nIGxhYmVscyBpbiBjb2x1bW4gMCBhbHdheXMgbG9va2VkIHdyb25nIHRvIG1lLiAg
SeKAmW0gaGFwcHkgdG8gCj4gY2hhbmdlIHRoZSBzdHlsZSB0byByZXF1aXJlIGF0IGxlYXN0IDEg
c3BhY2UsIGJ1dCBJ4oCZbSAqbm90KiBoYXBweSB0byBoYXZlIGEgCj4gc3R5bGUgZW5mb3JjZWQg
dGhhdCBjb250cmFkaWN0cyB3aGF0IHdl4oCZdmUgd3JpdHRlbiBpbiB0aGUgZW1hY3Mgc3R5bGUg
YmxvY2tzIAo+IGF0IHRoZSBib3R0b20gb2YgYWxsIHRoZSBmaWxlcy4KPiAKPiBXb3VsZCBpdCBi
ZSBPSyBpZiB3ZSAKPiAqIENoZWNrZWQgaW4gdGhpcyBwYXRjaCwgYnV0Cj4gKiBXZXJlbuKAmXQg
cGlja3kgYWJvdXQgZW5mb3JjaW5nIGl0IHlldAoKRldJVywgSSd2ZSBiZWVuIHBpY2t5IGFib3V0
IHRoaXMgZm9yIHRoZSBsYXN0IHNvIG1hbnkgeWVhcnMuCgpKYW4KCj4gKiBMb29rZWQgaW50byBh
biBlZmZpY2llbnQgd2F5IHRvIGdldCBhIHN1aXRhYmxlIHN0eWxlIHVwZGF0ZT8KPiAKPiAgLUdl
b3JnZQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

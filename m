From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 03/23] xen/arm: document dom0less
Date: Mon, 22 Oct 2018 16:58:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810221657580.31582@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810051140030.24936@sstabellini-ThinkPad-X260>
 <1538765251-25256-3-git-send-email-sstabellini@kernel.org>
 <4954c486-9663-552c-0fd8-9f59421146b5@arm.com>
 <638073F3-6455-45D5-B3C6-8F96D3D99879@xenproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <638073F3-6455-45D5-B3C6-8F96D3D99879@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNiBPY3QgMjAxOCwgTGFycyBLdXJ0aCB3cm90ZToKPiBIaSBTdGVmYW5vLAo+IAo+
ID4gT24gOSBPY3QgMjAxOCwgYXQgMTI6NTIsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+IHdyb3RlOgo+ID4gCj4gPiBIaSBTdGVmYW5vLAo+ID4gCj4gPiBPbiAwNS8xMC8yMDE4
IDE5OjQ3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPj4gQWRkIGEgbmV3IGRvY3VtZW50
IHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gb24gaG93IHRvIHVzZSBkb20wbGVzcyByZWxhdGVkCj4g
Pj4gZmVhdHVyZXMgYW5kIHRoZWlyIGN1cnJlbnQgbGltaXRhdGlvbnMuCj4gPj4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4+IC0tLQo+
ID4+IENoYW5nZXMgaW4gdjQ6Cj4gPj4gLSByZW5hbWUgdG8gLnR4dAo+ID4+IC0gaW1wcm92ZSB3
b3JkaW5nCj4gPj4gQ2hhbmdlcyBpbiB2MzoKPiA+PiAtIGFkZCBwYXRjaAo+ID4+IC0tLQo+ID4+
ICBkb2NzL21pc2MvYXJtL2RvbTBsZXNzLnR4dCB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiA+IAo+ID4gQXMgc2FpZCBvbiB0aGUgcHJldmlvdXMg
dmVyc2lvbiwgeW91IGxpa2VseSBuZWVkIHRvIGFkZCBhbiBlbnRyeSBpbiBkb2NzL0lOREVYLgo+
IAo+IEFncmVlZC4gQWxzbywgaXQgbWF5IGJlIHdvcnRod2hpbGUgZW5jb2RpbmcgdGhlIGRvYyBp
biBtYXJrZG93biAoaXQncyBub3QgdGhhdCBtdWNoIHRleHQpIGFuZCB1c2luZyB0aGUgLm1hcmtk
b3duIGV4dGVuc2lvbgo+IEFsc28sIGl0IHNlZW1zIHRvIG1lIHRoYXQgZG9jcy9mZWF0dXJlcyBp
cyBtYXliZSBhIGJldHRlciBwbGFjZSBmb3IgdGhpcyBkb2N1bWVudC4gTm90IHN1cmUgd2hldGhl
ciBkb2NzIGluIHRoaXMgZm9sZGVyIGdldCBwaWNrZWQgdXAgYXV0b21hdGljYWxseSB0aG91Z2gK
CkkgY2FuIG1vdmUgaXQgdG8gZG9jcy9mZWF0dXJlcyBhbmQgSSBhbSBPSyB3aXRoIGNoYW5naW5n
IGl0IHRvIG1hcmtkb3duLgpCdXQgcGxlYXNlIGRvbid0IGFzayBtZSB0byBjb252ZXJ0IGl0IHRv
IHBhbmRvYyAoYWxsIG90aGVyIGRvY3MgdW5kZXIKZG9jcy9mZWF0dXJlcyBhcmUgcGFuZG9jKS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

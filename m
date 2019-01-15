From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:39:31 +0000
Message-ID: <20190115113931.a76efbs2lm6kc4re@zion.uk.xensource.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
 <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
 <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
 <20190115113642.GE1271@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNAP=PX=citrix.com=prvs=9111e199a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gjN4G-00014B-TQ
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:39:40 +0000
Content-Disposition: inline
In-Reply-To: <20190115113642.GE1271@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6MzY6NDJBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6Mjk6MzhBTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDExOjI3OjEyQU0gKzAwMDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+IE9uIDE1LzAxLzIwMTkgMTE6MDksIFdlaSBMaXUgd3Jv
dGU6Cj4gPiA+ID4gVXNlcnMgbWF5IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hvdCBvZiBPVk1G
IGFuZCBidWlsZCBpdAo+ID4gPiA+IHdpdGggeGVuLmdpdCBzdXBwbGllZCBvdm1mLW1ha2VmaWxl
LiBJbiB0aGF0IGNhc2Ugd2UgZG9uJ3QKPiA+ID4gPiBuZWVkIHRvIGNhbGwgYGdpdCBzdWJtb2R1
bGVgLgo+ID4gPiA+Cj4gPiA+ID4gRml4ZXMgYjE2MjgxODcwZS4KPiA+ID4gPgo+ID4gPiA+IFJl
cG9ydGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
dG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSB8IDIgKy0KPiA+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYt
bWFrZWZpbGUKPiA+ID4gPiBpbmRleCAzZGUyZmMwMzAwLi41NWY5OTkyMTQ1IDEwMDY0NAo+ID4g
PiA+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiA+ID4gPiArKysgYi90b29s
cy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4gPiA+ID4gQEAgLTE2LDcgKzE2LDcgQEAgYWxsOiBi
dWlsZAo+ID4gPiA+ICAKPiA+ID4gPiAgLlBIT05ZOiBidWlsZAo+ID4gPiA+ICBidWlsZDoKPiA+
ID4gPiAtCSQoR0lUKSBzdWJtb2R1bGUgdXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZQo+ID4gPiA+
ICsJaWYgdGVzdCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQg
LS1yZWN1cnNpdmUgOyBmaQo+ID4gPiAKPiA+ID4gWW91IHdhbnQgLWQgcmF0aGVyIHRoYW4gLWUu
Cj4gPiAKPiA+IEFudGhvbnkgc2FpZCAuZ2l0IGNvdWxkIGJlIGEgbGluay4KPiAKPiBBY3R1YWxs
eSwgaXQgY2FuIGJlIGEgZmlsZS4gRXhhbXBsZSB3aGVuIGBnaXQgd29ya3RyZWUgYWRkYCBhcyBi
ZWVuCj4gdXNlZDoKPiAKPiAkIGxzIC1sIC5naXQKPiAtcnctci0tci0tIDEgdXNlciB1c2VycyA1
OSBEZWMgIDYgMTQ6MjMgLmdpdAo+ICQgY2F0IC5naXQKPiBnaXRkaXI6IC9sb2NhbC9ob21lL3Vz
ZXIvd29yay94ZW4vLmdpdC93b3JrdHJlZXMvZ2l0LjcyZDEKPiAKPiBBbmQgdGhhdCdzIGEgc3Vi
bW9kdWxlOgo+IAo+ICQgbHMgLWwgLmdpdAo+IC1ydy1yLS1yLS0gMSB1c2VyIHVzZXJzIDQzIE9j
dCAxOCAgMjAxNyAuZ2l0Cj4gJCBjYXQgLmdpdAo+IGdpdGRpcjogLi4vLi4vLmdpdC9tb2R1bGVz
L3VpL2tleWNvZGVtYXBkYgoKTXkgYmFkLiBOb3QgZW5vdWdoIGNhZmZlaW5lIGluIHRoZSBtb3Ju
aW5nLgoKVGhpcyBwYXRjaCBzdGlsbCBzdGFuZHMgdGhvdWdoLgoKV2VpLgoKPiAKPiAtLSAKPiBB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

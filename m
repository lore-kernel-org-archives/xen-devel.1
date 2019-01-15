From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:36:42 +0000
Message-ID: <20190115113642.GE1271@perard.uk.xensource.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
 <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
 <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GDKA=PX=citrix.com=prvs=911f1f4f8=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gjN1R-0000fl-QD
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:36:45 +0000
Content-Disposition: inline
In-Reply-To: <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6Mjk6MzhBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCAxMToyNzoxMkFNICswMDAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+ID4gT24gMTUvMDEvMjAxOSAxMTowOSwgV2VpIExpdSB3cm90ZToKPiA+ID4gVXNl
cnMgbWF5IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hvdCBvZiBPVk1GIGFuZCBidWlsZCBpdAo+
ID4gPiB3aXRoIHhlbi5naXQgc3VwcGxpZWQgb3ZtZi1tYWtlZmlsZS4gSW4gdGhhdCBjYXNlIHdl
IGRvbid0Cj4gPiA+IG5lZWQgdG8gY2FsbCBgZ2l0IHN1Ym1vZHVsZWAuCj4gPiA+Cj4gPiA+IEZp
eGVzIGIxNjI4MTg3MGUuCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSB8IDIg
Ky0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rv
b2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiA+ID4gaW5kZXggM2RlMmZjMDMwMC4uNTVmOTk5
MjE0NSAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQo+ID4g
PiArKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4gPiA+IEBAIC0xNiw3ICsxNiw3
IEBAIGFsbDogYnVpbGQKPiA+ID4gIAo+ID4gPiAgLlBIT05ZOiBidWlsZAo+ID4gPiAgYnVpbGQ6
Cj4gPiA+IC0JJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0IC0tcmVjdXJzaXZlCj4gPiA+
ICsJaWYgdGVzdCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQg
LS1yZWN1cnNpdmUgOyBmaQo+ID4gCj4gPiBZb3Ugd2FudCAtZCByYXRoZXIgdGhhbiAtZS4KPiAK
PiBBbnRob255IHNhaWQgLmdpdCBjb3VsZCBiZSBhIGxpbmsuCgpBY3R1YWxseSwgaXQgY2FuIGJl
IGEgZmlsZS4gRXhhbXBsZSB3aGVuIGBnaXQgd29ya3RyZWUgYWRkYCBhcyBiZWVuCnVzZWQ6Cgok
IGxzIC1sIC5naXQKLXJ3LXItLXItLSAxIHVzZXIgdXNlcnMgNTkgRGVjICA2IDE0OjIzIC5naXQK
JCBjYXQgLmdpdApnaXRkaXI6IC9sb2NhbC9ob21lL3VzZXIvd29yay94ZW4vLmdpdC93b3JrdHJl
ZXMvZ2l0LjcyZDEKCkFuZCB0aGF0J3MgYSBzdWJtb2R1bGU6CgokIGxzIC1sIC5naXQKLXJ3LXIt
LXItLSAxIHVzZXIgdXNlcnMgNDMgT2N0IDE4ICAyMDE3IC5naXQKJCBjYXQgLmdpdApnaXRkaXI6
IC4uLy4uLy5naXQvbW9kdWxlcy91aS9rZXljb2RlbWFwZGIKCi0tIApBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/3] xen-hvm: try to use
 xenforeignmemory_map_resource() to map ioreq pages
Date: Tue, 15 May 2018 17:16:41 +0100
Message-ID: <20180515161641.GE2057@perard.uk.xensource.com>
References: <20180510091518.28199-1-paul.durrant@citrix.com>
 <20180510091518.28199-4-paul.durrant@citrix.com>
 <20180515153821.GD2057@perard.uk.xensource.com>
 <d3dff46e447b4a18bead5bf6ae36f3ba@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rxgm=ic=citrix.com=prvs=66614e27e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fIcd4-0006ur-5G
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 16:16:46 +0000
Content-Disposition: inline
In-Reply-To: <d3dff46e447b4a18bead5bf6ae36f3ba@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMTUsIDIwMTggYXQgMDQ6NDU6MjVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oCj4gPiBi
L2luY2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaAo+ID4gPiBpbmRleCA1ZjE0MDJiNDk0Li5kOTI1
NzUxMDQwIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2h3L3hlbi94ZW5fY29tbW9uLmgKPiA+
ID4gKysrIGIvaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oCj4gPiA+IEBAIC0xMTksNiArMTE5
LDIwIEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4gPiB4ZW5kZXZpY2Vtb2RlbF9waW5fbWVtb3J5X2Nh
Y2hlYXR0cigKPiA+ID4gICAgICByZXR1cm4geGNfZG9tYWluX3Bpbl9tZW1vcnlfY2FjaGVhdHRy
KHhlbl94YywgZG9taWQsIHN0YXJ0LCBlbmQsCj4gPiB0eXBlKTsKPiA+ID4gIH0KPiA+ID4KPiA+
ID4gK3R5cGVkZWYgdm9pZCB4ZW5mb3JlaWdubWVtb3J5X3Jlc291cmNlX2hhbmRsZTsKPiA+ID4g
Kwo+ID4gPiArI2RlZmluZSBYRU5NRU1fcmVzb3VyY2VfaW9yZXFfc2VydmVyX2ZyYW1lX2J1Zmlv
cmVxIDAKPiA+ID4gKyNkZWZpbmUgWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcl9mcmFtZV9p
b3JlcShuKSAoMSArIChuKSkKPiA+ID4gKwo+ID4gPiArc3RhdGljIGlubGluZSB4ZW5mb3JlaWdu
bWVtb3J5X3Jlc291cmNlX2hhbmRsZQo+ID4gKnhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNl
KAo+ID4gPiArICAgIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVtLCBkb21pZF90IGRvbWlk
LCB1bnNpZ25lZCBpbnQgdHlwZSwKPiA+ID4gKyAgICB1bnNpZ25lZCBpbnQgaWQsIHVuc2lnbmVk
IGxvbmcgZnJhbWUsIHVuc2lnbmVkIGxvbmcgbnJfZnJhbWVzLAo+ID4gPiArICAgIHZvaWQgKipw
YWRkciwgaW50IHByb3QsIGludCBmbGFncykKPiA+ID4gK3sKPiA+ID4gKyAgICBlcnJubyA9IEVP
UE5PVFNVUFA7Cj4gPiAKPiA+IEkgdGhpbmsgRU5PU1lTIHdvdWxkIGJlIGJldHRlci4gRU9QTk9U
U1VQUCBzZWVtcyB0byBiZSBmb3Igc29ja2V0cy4KPiA+IAo+IAo+IE5vLCBFT1BOT1RTVVBQIGlz
IG1vcmUgZ2VuZXJhbCB0aGFuIHRoYXQgYW5kIGlzIGNvbnZlbnRpb24gZm9yIHVuaW1wbGVtZW50
ZWQgQVBJIG9wZXJhdGlvbnMgZWxzZXdoZXJlLiBFTk9TWVMgaXMgc3VwcG9zZWQgdG8gc3RyaWN0
bHkgbWVhbiAnc3lzdGVtIGNhbGwgbm90IGltcGxlbWVudGVkJyBidXQgd2UgdXNlIGl0IGZvciBo
eXBlcmNhbGxzIGluIFhlbiwgbGVhZGluZyB0byBvY2Nhc2lvbmFsIGZ1biB3aXRoIExpbnV4IGNo
ZWNrcGF0Y2gucGwuCgpJbiBtYW4gZXJybm8sIEkgaGF2ZToKRU5PVFNVUCAgICAgICAgIE9wZXJh
dGlvbiBub3Qgc3VwcG9ydGVkIChQT1NJWC4xLTIwMDEpCkVPUE5PVFNVUFAgICAgICBPcGVyYXRp
b24gbm90IHN1cHBvcnRlZCBvbiBzb2NrZXQgKFBPU0lYLjEtMjAwMSkuCkVOT1NZUyAgICAgICAg
ICBGdW5jdGlvbiBub3QgaW1wbGVtZW50ZWQgKFBPU0lYLjEtMjAwMSkuCgpCdXQgSSBndWVzcyBh
bnkgb2YgdGhlc2Ugd291bGQgd29yay4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

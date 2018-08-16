From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 15/15] xen/arm: traps: Move the
 implementation of GUEST_BUG_ON in traps.h
Date: Thu, 16 Aug 2018 11:17:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808161112430.16354@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141442070.15066@sstabellini-ThinkPad-X260>
 <1a6b5113-3ad5-50e2-1c0f-b9d532ec0b81@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0lge=k7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fqMpt-00087d-ML
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 18:17:29 +0000
In-Reply-To: <1a6b5113-3ad5-50e2-1c0f-b9d532ec0b81@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNiBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDgvMTQvMjAxOCAxMDo0MyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBHVUVTVF9CVUdf
T04gbWF5IGJlIHVzZWQgaW4gb3RoZXIgZmlsZXMgZG9pbmcgZ3Vlc3QgZW11bGF0aW9uLgo+ID4g
PiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJv
Lm9yZz4KPiA+IAo+ID4gR2l2ZW4gdGhhdCBHVUVTVF9CVUdfT04gaXMgbm90IGFjdHVhbGx5IHVz
ZWQgaW4gYW55IG90aGVyIGZpbGVzIGluIHRoaXMKPiA+IHBhdGNoIHNlcmllcywgSSBhc3N1bWUg
eW91IGFyZSByZWZlcnJpbmcgdG8gb25lIG9mIHlvdXIgZnV0dXJlIHNlcmllcz8KPiAKPiBJdCBp
cyBnb2luZyB0byBiZSB1c2VkIGxhdGVyLiBIb3dldmVyLCBJIGRvbid0IHJlYWxseSByZWZlciB0
byBhbnkgc2VyaWVzIGluCj4gcGFydGljdWxhci4gSXQgaXMganVzdCB0aGF0IHRoaXMgbWFjcm9z
IGNvdWxkIGJlIGhlbHBmdWwgaW4gYW55IGVtdWxhdGlvbiBjb2RlCj4gdG8gY2F0Y2ggd2hhdCB3
ZSB0aGluayBpcyBhIGludmFsaWQgYXJjaGl0ZWN0dXJhbCBiZWhhdmlvci4KCkl0IGlzIG9ubHkg
dGhhdCBhIGNvbmNyZXRlIHVzZS1jYXNlIGhlbHBzLiBUaGUgaWRlYSBvZiBtb3ZpbmcKR1VFU1Rf
QlVHX09OIGlzIGdvb2QsIGJ1dCB3aGVyZSB0bz8gRm9yIGluc3RhbmNlLCB3b3VsZG4ndCBpdCBi
ZSBiZXR0ZXIKdG8gbW92ZSBpdCB0byBndWVzdF9hY2Nlc3MuaD8gSSBhbSBqdXN0IHRyeWluZyB0
byBwb2ludCB0byBhbiBleGlzdGluZwpoZWFkZXIgd2hpY2ggaXMgbW9yZSB3aWRlbHkgdXNlZCBh
Y3Jvc3MgdGhlIGVtdWxhdG9ycyAodnBsMDExLAp2Z2ljLXYzLWl0cy5jLCBodm0uYywgLi4uKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

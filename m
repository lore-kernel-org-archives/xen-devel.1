From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
Date: Mon, 3 Jun 2019 11:25:04 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXrdr-00088y-A5
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 18:25:07 +0000
In-Reply-To: <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, Julien.Grall@arm.com, Stefano Stabellini <sstabellini@kernel.org>, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyOCBNYXkgMjAxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDUvMjgvMTkg
Njo0OCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4KPiA+IE9uIGFybTY0IHN3aW90bGIgaXMg
b2Z0ZW4gKG5vdCBhbHdheXMpIGFscmVhZHkgaW5pdGlhbGl6ZWQgYnkgbWVtX2luaXQuCj4gPiBX
ZSBkb24ndCB3YW50IHRvIGluaXRpYWxpemUgaXQgdHdpY2UsIHdoaWNoIHdvdWxkIHRyaWdnZXIg
YSBzZWNvbmQKPiA+IG1lbW9yeSBhbGxvY2F0aW9uLiBNb3Jlb3ZlciwgdGhlIHNlY29uZCBtZW1v
cnkgcG9vbCBpcyB0eXBpY2FsbHkgbWFkZSBvZgo+ID4gaGlnaCBwYWdlcyBhbmQgZW5kcyB1cCBy
ZXBsYWNpbmcgdGhlIG9yaWdpbmFsIG1lbW9yeSBwb29sIG9mIGxvdyBwYWdlcy4KPiA+IEFzIGEg
c2lkZSBlZmZlY3Qgb2YgdGhpcyBjaGFuZ2UsIGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgbG93IHBh
Z2VzIGluCj4gPiBzd2lvdGxiLXhlbiBvbiBhcm02NC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gCj4gSGFzIHRoaXMgYmVl
biB0ZXN0ZWQgb24geDg2PwoKWWVzLCBJIG1hbmFnZWQgdG8gdGVzdCBpdCB1c2luZyBRRU1VLiBU
aGVyZSBhcmUgbm8gZWZmZWN0cyBvbiB4ODYsIGFzCnRoZSBjaGVjayBpb190bGJfc3RhcnQgIT0g
MCByZXR1cm5zIGZhbHNlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

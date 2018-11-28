From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 08:47:05 -0800
Message-ID: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew__28202.33224561$1543423581$gmane$org@mail.gmail.com>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ggdt=oh=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gS2zy-0000b3-U5
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:47:39 +0000
Received: by mail-lj1-x22f.google.com with SMTP id k19-v6so24038568lji.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 08:47:37 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id p67sm1288970lfe.14.2018.11.28.08.47.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Nov 2018 08:47:33 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id n18-v6so24057370lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 08:47:33 -0800 (PST)
In-Reply-To: <20181128074117.GA21126@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, the arch/x86 maintainers <x86@kernel.org>, linux@armlinux.org.uk, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTE6NDEgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDc6NTU6MTFBTSArMDEw
MCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBXZWxsLCBJIGNhbiB0d2VhayB0aGUgbGFz
dCBwYXRjaCB0byByZXR1cm4gLUVJTlZBTCBmcm9tIGRtYV9tYXBwaW5nX2Vycm9yCj4gPiBpbnN0
ZWFkIG9mIHRoZSBvbGQgMSBpcyBhcyBib29sIHRydWUuICBUaGUgY2FsbGVycyBzaG91bGQgYWxs
IGJlIGZpbmUsCj4gPiBhbHRob3VnaCBJJ2QgaGF2ZSB0byBhdWRpdCB0aGVtLiAgU3RpbGwgd291
bGRuJ3QgaGVscCB3aXRoIGJlaW5nIGFibGUgdG8KPiA+IHJldHVybiBkaWZmZXJlbnQgZXJyb3Jz
Lgo+Cj4gQW55IG9waW5pb25zPyAgSSdkIHJlYWxseSBsaWtlIHRvIG1ha2Ugc29tZSBmb3J3YXJk
IHByb2dyZXNzIG9uIHRoaXMKPiBzZXJpZXMuCgpTbyBJIGRvIHRoaW5rIHRoYXQgeWVzLCBkbWFf
bWFwcGluZ19lcnJvcigpIHNob3VsZCByZXR1cm4gYW4gZXJyb3IKY29kZSwgbm90IDAvMS4KCkJ1
dCBJIHdhcyByZWFsbHkgaG9waW5nIHRoYXQgdGhlIGluZGl2aWR1YWwgZHJpdmVycyB0aGVtc2Vs
dmVzIGNvdWxkCnJldHVybiBlcnJvciBjb2Rlcy4gUmlnaHQgbm93IHRoZSBwYXRjaC1zZXJpZXMg
aGFzIGNvZGUgbGlrZSB0aGlzOgoKICAgICAgcmV0ID0gbmVlZHNfYm91bmNlKGRldiwgZG1hX2Fk
ZHIsIHNpemUpOwogICAgICBpZiAocmV0IDwgMCkKLSAgICAgICAgIHJldHVybiBBUk1fTUFQUElO
R19FUlJPUjsKKyAgICAgICAgIHJldHVybiBETUFfTUFQUElOR19FUlJPUjsKCndoaWNoIHdoaWxl
IGl0IGFsbCBtYWtlcyBzZW5zZSBpbiB0aGUgY29udGV4dCBvZiB0aGlzIHBhdGNoLXNlcmllcywg
SQoqcmVhbGx5KiB0aGluayBpdCB3b3VsZCBoYXZlIGJlZW4gc28gbXVjaCBuaWNlciB0byByZXR1
cm4gdGhlIGVycm9yCmNvZGUgJ3JldCcgaW5zdGVhZCAod2hpY2ggaW4gdGhpcyBjYXNlIGlzIC1F
MkJJRykuCgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBodWdlIGRlYWwsIGJ1dCBFUlJfUFRSKCkg
aGFzIGJlZW4gaHVnZWx5CnN1Y2Nlc3NmdWwgZWxzZXdoZXJlLiBBbmQgSSdtIG5vdCBodWdlbHkg
Y29udmluY2VkIGFib3V0IGFsbCB0aGVzZQoiYW55IGFkZHJlc3MgY2FuIGJlIHZhbGlkIiBhcmd1
bWVudHMuIEhvdyB0aGUgaGVsbCBkbyB5b3UgZ2VuZXJhdGUgYQpyYW5kb20gZG1hIGFkZHJlc3Mg
aW4gdGhlIGxhc3QgcGFnZSB0aGF0IGlzbid0IGV2ZW4gcGFnZS1hbGlnbmVkPwoKICAgICAgICAg
ICAgICAgICAgICAgTGludXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=

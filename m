From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 10:00:06 -0800
Message-ID: <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ__7285.47179974175$1543427952$gmane$org@mail.gmail.com>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ggdt=oh=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gS48S-0001Al-AA
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 18:00:28 +0000
Received: by mail-lf1-x143.google.com with SMTP id p86so20063793lfg.5
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 10:00:26 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id l21-v6sm1230135ljj.48.2018.11.28.10.00.23
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Nov 2018 10:00:23 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id g11-v6so24290147ljk.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 10:00:23 -0800 (PST)
In-Reply-To: <20181128174545.GJ30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux@armlinux.org.uk
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgOTo0NSBBTSBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgK
PGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiA+IEkgZG9uJ3QgdGhpbmsgdGhpcyBp
cyBhIGh1Z2UgZGVhbCwgYnV0IEVSUl9QVFIoKSBoYXMgYmVlbiBodWdlbHkKPiA+IHN1Y2Nlc3Nm
dWwgZWxzZXdoZXJlLiBBbmQgSSdtIG5vdCBodWdlbHkgY29udmluY2VkIGFib3V0IGFsbCB0aGVz
ZQo+ID4gImFueSBhZGRyZXNzIGNhbiBiZSB2YWxpZCIgYXJndW1lbnRzLiBIb3cgdGhlIGhlbGwg
ZG8geW91IGdlbmVyYXRlIGEKPiA+IHJhbmRvbSBkbWEgYWRkcmVzcyBpbiB0aGUgbGFzdCBwYWdl
IHRoYXQgaXNuJ3QgZXZlbiBwYWdlLWFsaWduZWQ/Cj4KPiBrbWFsbG9jKCkgYSA2NC1ieXRlIGJ1
ZmZlciwgZG1hX21hcF9zaW5nbGUoKSB0aGF0IGJ1ZmZlci4KCk5vLgoKWW91IGFscmVhZHkgY2Fu
bm90IGRvIHRoYXQga21hbGxvYygpLCBleGFjdGx5IGJlY2F1c2Ugb2YgRVJSX1BUUigpLgoKTm90
IGFsbCBtZW1vcnkgaXMgYWNjZXNzaWJsZSBldmVuIHRvIHRoZSBrZXJuZWwuIElmIHlvdSBoYXZl
IG1lbW9yeQp0aGF0IHNob3dzIHVwIGluIHRoZSBsYXN0IHBhZ2Ugb2YgcGh5c19hZGRyX3QsIHlv
dSBqdXN0IG1hcmsgaXQKcmVzZXJ2ZWQgYXQgYm9vdC10aW1lLgoKV2hpY2ggaXMgd2hhdCB3ZSBB
TFJFQURZIGRvIGZvciB0aGVzZSBleGFjdCByZWFzb25zLiBJZiB0aGUgRE1BCm1hcHBpbmdzIG1l
YW5zIHRoYXQgeW91J2QgbmVlZCB0byBhZGQgb25lIG1vcmUgcGFnZSB0byB0aGF0IGxpc3Qgb2YK
cmVzZXJ2ZWQgcGFnZXMsIHRoZW4gc28gYmUgaXQuCgpUaGUgd2hvbGUgYXJndW1lbnQgb2YgImV2
ZXJ5IHBvc3NpYmxlIHBpZWNlIG9mIG1lbW9yeSBpcyBETUEnYWJsZSIgaXMKanVzdCB3cm9uZy4K
CiAgICAgICAgICAgICAgICBMaW51cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

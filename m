From: David Miller <davem@davemloft.net>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 11:27:17 -0800 (PST)
Message-ID: <20181128.112717.149234960284639699.davem__14443.3089568794$1543433162$gmane$org@davemloft.net>
References: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lnjc=oh=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gS5UV-0007Z7-Ve
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 19:27:20 +0000
In-Reply-To: <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, dwmw2@infradead.org, x86@kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, hch@lst.de, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpEYXRl
OiBXZWQsIDI4IE5vdiAyMDE4IDEwOjAwOjA2IC0wODAwCgo+IE5vdCBhbGwgbWVtb3J5IGlzIGFj
Y2Vzc2libGUgZXZlbiB0byB0aGUga2VybmVsLiBJZiB5b3UgaGF2ZSBtZW1vcnkKPiB0aGF0IHNo
b3dzIHVwIGluIHRoZSBsYXN0IHBhZ2Ugb2YgcGh5c19hZGRyX3QsIHlvdSBqdXN0IG1hcmsgaXQK
PiByZXNlcnZlZCBhdCBib290LXRpbWUuCgpJdCdzIG5vdCB0aGUgcGh5c2ljYWwgbWVtb3J5IGF0
IHRoZSBlbmQgdGhhdCBuZWVkcyB0byBiZSByZXNlcnZlZC4KCkl0J3MgdGhlIElPTU1VIG1hcHBp
bmcgYXJlbmEuCgpUaGF0IGJhc2ljYWxseSByZXF1aXJlcyBjaGFuZ2VzIHRvIGV2ZXJ5IElPTU1V
IGltcGxlbWVudGF0aW9uIGluCnRoZSB0cmVlLiAgTm90IHNheWluZyBpdCdzIGhhcmQgb3IgaW1w
b3NzaWJsZSwgYnV0IGl0IGlzIHJlYWwKbWV0aWN1bG91cyB3b3JrIHRoYXQgbmVlZHMgdG8gYmUg
ZG9uZSBpbiBvcmRlciB0byByZWFsaXplIHRoaXMuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==

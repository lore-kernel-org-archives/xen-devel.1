From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Wed, 29 May 2019 12:21:41 +0200
Message-ID: <55b35087-064d-8188-2373-0dd94ffef2b6__33117.8047157422$1559125358$gmane$org@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
 <5CEE57910200007800233571@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVviL-00042n-BV
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 10:21:45 +0000
In-Reply-To: <5CEE57910200007800233571@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDUvMjAxOSAxMTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDUuMTkg
YXQgMTE6MDQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtMzQ1LDggKzM0NiwxMSBA
QCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qg
c2l6ZSwgdm9pZCAqdmFkZHIsCj4+ICAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5fUEFHRV9T
SElGVCk7Cj4+ICAKPj4gIAlpZiAoIVdBUk5fT04oKGRldl9hZGRyICsgc2l6ZSAtIDEgPiBkbWFf
bWFzaykgfHwKPj4gLQkJICAgICByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBz
aXplKSkpCj4+ICsJCSAgICAgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6
ZSkpICYmCj4+ICsJICAgIFBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UodmFkZHIpKSkgewo+
PiAgCQl4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Cj4+ICsJCUNs
ZWFyUGFnZVhlblJlbWFwcGVkKHZpcnRfdG9fcGFnZSh2YWRkcikpOwo+PiArCX0KPiAKPiBUbyBi
ZSBzeW1tZXRyaWMgd2l0aCBzZXR0aW5nIHRoZSBmbGFnIG9ubHkgYWZ0ZXIgaGF2aW5nIG1hZGUg
dGhlIHJlZ2lvbgo+IGNvbnRpZ3VvdXMsIGFuZCB0byBhdm9pZCAocGVyaGFwcyBqdXN0IHRoZW9y
ZXRpY2FsKSByYWNlcywgd291bGRuJ3QgaXQgYmUKPiBiZXR0ZXIgdG8gY2xlYXIgdGhlIGZsYWcg
YmVmb3JlIGNhbGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKT8KPiBFdmVuIGJl
dHRlciB3b3VsZCBiZSBhIFRlc3RBbmRDbGVhci4uLigpIG9wZXJhdGlvbi4KCkkgbGlrZSB0aGF0
IGlkZWEuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

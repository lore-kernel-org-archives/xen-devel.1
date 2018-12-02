From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: Re: [PATCH 21/23] xen-swiotlb: remove the mapping_error
 dma_map_ops method
Date: Sun, 2 Dec 2018 07:42:42 -0500
Message-ID: <20181202124241.GB3166__34656.405208125$1543754514$gmane$org@localhost.localdomain>
References: <20181130132231.16512-1-hch@lst.de>
 <20181130132231.16512-22-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nepm=ol=gmail.com=konrad.r.wilk@srs-us1.protection.inumbo.net>)
 id 1gTR5E-0005fe-Rt
 for xen-devel@lists.xenproject.org; Sun, 02 Dec 2018 12:42:48 +0000
Received: by mail-qt1-x841.google.com with SMTP id l11so10900902qtp.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Dec 2018 04:42:47 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20181130132231.16512-22-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Jon Mason <jdmason@kudzu.us>, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDI6MjI6MjlQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gUmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SIGluc3RlYWQgb2YgMCBvbiBhIGRt
YSBtYXBwaW5nIGZhaWx1cmUgYW5kIGxldAo+IHRoZSBjb3JlIGRtYS1tYXBwaW5nIGNvZGUgaGFu
ZGxlIHRoZSByZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgoKUmV2aWV3ZWQtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkQGRhcm5v
ay5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCAxMiArKy0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCj4gaW5kZXggMmE3ZjU0NWJkMGI1Li42ZGM5NjlkNWVhMmYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMKPiBAQCAtNTMsOCArNTMsNiBAQAo+ICAgKiBBUEkuCj4gICAqLwo+ICAKPiAtI2Rl
ZmluZSBYRU5fU1dJT1RMQl9FUlJPUl9DT0RFCSh+KGRtYV9hZGRyX3QpMHgwKQo+IC0KPiAgc3Rh
dGljIGNoYXIgKnhlbl9pb190bGJfc3RhcnQsICp4ZW5faW9fdGxiX2VuZDsKPiAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgeGVuX2lvX3RsYl9uc2xhYnM7Cj4gIC8qCj4gQEAgLTQwNiw3ICs0MDQsNyBA
QCBzdGF0aWMgZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBwYWdlICpwYWdlLAo+ICAJbWFwID0gc3dpb3RsYl90YmxfbWFwX3NpbmdsZShk
ZXYsIHN0YXJ0X2RtYV9hZGRyLCBwaHlzLCBzaXplLCBkaXIsCj4gIAkJCQkgICAgIGF0dHJzKTsK
PiAgCWlmIChtYXAgPT0gU1dJT1RMQl9NQVBfRVJST1IpCj4gLQkJcmV0dXJuIFhFTl9TV0lPVExC
X0VSUk9SX0NPREU7Cj4gKwkJcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwo+ICAKPiAgCWRldl9h
ZGRyID0geGVuX3BoeXNfdG9fYnVzKG1hcCk7Cj4gIAl4ZW5fZG1hX21hcF9wYWdlKGRldiwgcGZu
X3RvX3BhZ2UobWFwID4+IFBBR0VfU0hJRlQpLAo+IEBAIC00MjEsNyArNDE5LDcgQEAgc3RhdGlj
IGRtYV9hZGRyX3QgeGVuX3N3aW90bGJfbWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgcGFnZSAqcGFnZSwKPiAgCWF0dHJzIHw9IERNQV9BVFRSX1NLSVBfQ1BVX1NZTkM7Cj4gIAlz
d2lvdGxiX3RibF91bm1hcF9zaW5nbGUoZGV2LCBtYXAsIHNpemUsIGRpciwgYXR0cnMpOwo+ICAK
PiAtCXJldHVybiBYRU5fU1dJT1RMQl9FUlJPUl9DT0RFOwo+ICsJcmV0dXJuIERNQV9NQVBQSU5H
X0VSUk9SOwo+ICB9Cj4gIAo+ICAvKgo+IEBAIC03MDAsMTEgKzY5OCw2IEBAIHhlbl9zd2lvdGxi
X2dldF9zZ3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNnX3RhYmxlICpzZ3QsCj4g
IAlyZXR1cm4gZG1hX2NvbW1vbl9nZXRfc2d0YWJsZShkZXYsIHNndCwgY3B1X2FkZHIsIGhhbmRs
ZSwgc2l6ZSwgYXR0cnMpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHhlbl9zd2lvdGxiX21hcHBp
bmdfZXJyb3Ioc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGRtYV9hZGRyKQo+IC17Cj4g
LQlyZXR1cm4gZG1hX2FkZHIgPT0gWEVOX1NXSU9UTEJfRVJST1JfQ09ERTsKPiAtfQo+IC0KPiAg
Y29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHhlbl9zd2lvdGxiX2RtYV9vcHMgPSB7Cj4gIAkuYWxs
b2MgPSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudCwKPiAgCS5mcmVlID0geGVuX3N3aW90bGJf
ZnJlZV9jb2hlcmVudCwKPiBAQCAtNzE5LDUgKzcxMiw0IEBAIGNvbnN0IHN0cnVjdCBkbWFfbWFw
X29wcyB4ZW5fc3dpb3RsYl9kbWFfb3BzID0gewo+ICAJLmRtYV9zdXBwb3J0ZWQgPSB4ZW5fc3dp
b3RsYl9kbWFfc3VwcG9ydGVkLAo+ICAJLm1tYXAgPSB4ZW5fc3dpb3RsYl9kbWFfbW1hcCwKPiAg
CS5nZXRfc2d0YWJsZSA9IHhlbl9zd2lvdGxiX2dldF9zZ3RhYmxlLAo+IC0JLm1hcHBpbmdfZXJy
b3IJPSB4ZW5fc3dpb3RsYl9tYXBwaW5nX2Vycm9yLAo+ICB9Owo+IC0tIAo+IDIuMTkuMQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

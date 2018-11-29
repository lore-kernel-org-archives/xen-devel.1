From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC 14/16] hack: arm/domain: simplify context
 restore from idle vcpu
Date: Thu, 29 Nov 2018 16:00:28 +0000
Message-ID: <20181129160028.edisych6wzoe7td4@zion.uk.xensource.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-15-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wph9=oi=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSOk3-0000KO-Pr
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:00:39 +0000
Content-Disposition: inline
In-Reply-To: <1543440731-21947-15-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RllJIHRoZSBUbzogZmllbGQgaXMgZW1wdHkgZm9yIHlvdXIgcGF0Y2guCgpPbiBXZWQsIE5vdiAy
OCwgMjAxOCBhdCAxMTozMjowOVBNICswMjAwLCBBbmRyaWkgQW5pc292IHdyb3RlOgpbLi4uXQo+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKPiBAQCAtMjcyLDYgKzI3Miw3IEBAIHN0cnVjdCB2Y3B1Cj4gICAgICBzdHJ1Y3QgdnBj
aV92Y3B1IHZwY2k7Cj4gIAo+ICAgICAgc3RydWN0IGFyY2hfdmNwdSBhcmNoOwo+ICsgICAgc3Ry
dWN0IHZjcHUgKnByZXY7CgpJIGd1ZXNzIHRoaXMgaXMgd2h5IEkgZ2V0IENDJ2VkIG9uIHRoaXMg
cGF0Y2guIEkgd291bGQgc3VnZ2VzdCB5b3UgcHV0Cml0IGludG8gYXJjaF92Y3B1IGlmIHRoaXMg
aXMgZ29pbmcgdG8gYmUgQVJNIHNwZWNpZmljLgoKKEkgaGF2ZSBza2lwcGVkIG90aGVyIHBhcnRz
IG9mIHRoaXMgZW1haWwpCgpXZWkuCgo+ICB9Owo+ICAKPiAgLyogUGVyLWRvbWFpbiBsb2NrIGNh
biBiZSByZWN1cnNpdmVseSBhY3F1aXJlZCBpbiBmYXVsdCBoYW5kbGVycy4gKi8KPiAtLSAKPiAy
LjcuNAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

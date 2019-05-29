From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Wed, 29 May 2019 03:57:37 -0600
Message-ID: <5CEE57910200007800233571__13776.9916023657$1559123925$gmane$org@prv1-mh.provo.novell.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVvL4-0001RJ-JO
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:57:42 +0000
In-Reply-To: <20190529090407.1225-4-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE5IGF0IDExOjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MzQ1LDggKzM0NiwxMSBAQCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2Ug
Kmh3ZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCj4gIAlzaXplID0gMVVMIDw8IChvcmRl
ciArIFhFTl9QQUdFX1NISUZUKTsKPiAgCj4gIAlpZiAoIVdBUk5fT04oKGRldl9hZGRyICsgc2l6
ZSAtIDEgPiBkbWFfbWFzaykgfHwKPiAtCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5k
YXJ5KHBoeXMsIHNpemUpKSkKPiArCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5
KHBoeXMsIHNpemUpKSAmJgo+ICsJICAgIFBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UodmFk
ZHIpKSkgewo+ICAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsK
PiArCQlDbGVhclBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UodmFkZHIpKTsKPiArCX0KClRv
IGJlIHN5bW1ldHJpYyB3aXRoIHNldHRpbmcgdGhlIGZsYWcgb25seSBhZnRlciBoYXZpbmcgbWFk
ZSB0aGUgcmVnaW9uCmNvbnRpZ3VvdXMsIGFuZCB0byBhdm9pZCAocGVyaGFwcyBqdXN0IHRoZW9y
ZXRpY2FsKSByYWNlcywgd291bGRuJ3QgaXQgYmUKYmV0dGVyIHRvIGNsZWFyIHRoZSBmbGFnIGJl
Zm9yZSBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCk/CkV2ZW4gYmV0dGVy
IHdvdWxkIGJlIGEgVGVzdEFuZENsZWFyLi4uKCkgb3BlcmF0aW9uLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

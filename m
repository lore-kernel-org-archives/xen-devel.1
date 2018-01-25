From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] MAINTAINERS: add the iommu list for swiotlb
 and xen-swiotlb
Date: Thu, 25 Jan 2018 09:26:18 -0500
Message-ID: <20180125142618.GB25449__7760.90872609547$1516890336$gmane$org@char.us.oracle.com>
References: <20180116075624.5191-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lkep=eu=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eeiU3-0002zv-0v
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 14:26:31 +0000
Content-Disposition: inline
In-Reply-To: <20180116075624.5191-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDg6NTY6MjRBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQWxsIG90aGVyIGRpc2N1c3Npb25zIHJlbGF0ZWQgdG8gdGhlIGRtYSBtYXBw
aW5nIGludGVyZmFjZXMgYXJlIG9uIHRoZQo+IGlvbW11IGxpc3QsIHNvIGxldCdzIG1ha2UgaXQg
dGhlIG9mZmljaWFsIGxpc3QgZm9yIHN3aW90bGIgYW5kIHRoZQo+IHNlY29uZCBsaXN0IGZvciB4
ZW4tc3dpb3RsYi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KCkkgYW0gc28gYmVoaW5kIGVtYWlscy4uIEkgYW0gbm90IHN1cmUgaWYgSSBoYWQgcmVw
bGllZCB0byB0aGlzLCBidXQganVzdAppbiBjYXNlIEkgaGFkbid0OgoKQWNrZWQtYnk6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KClAuUy4KSSBhbSBiZWhp
bmQgb24gdGhlIHJldmlldyBvZiB5b3VyIGRtYSByZXdvcmsgLSByZWFsbHkgc29ycnkgaXQgaXMg
dGFraW5nCnRoYXQgbG9uZy4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAzICsrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCAyZDU0ZTYzNmQ2MjUuLjMwZGNhZmQz
ODhhYyAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTEzMDM0LDcgKzEzMDM0LDcgQEAgRjoJYXJjaC94ODYvYm9vdC92aWRlbyoKPiAgCj4gIFNXSU9U
TEIgU1VCU1lTVEVNCj4gIE06CUtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiAtTDoJbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ICtMOglpb21tdUBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ICBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tvbnJhZC9zd2lvdGxiLmdpdAo+ICBTOglTdXBwb3J0
ZWQKPiAgRjoJbGliL3N3aW90bGIuYwo+IEBAIC0xNDk2OSw2ICsxNDk2OSw3IEBAIEY6CWluY2x1
ZGUveGVuL2ludGVyZmFjZS9pby92c2NzaWlmLmgKPiAgWEVOIFNXSU9UTEIgU1VCU1lTVEVNCj4g
IE06CUtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiAgTDoJ
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3Jp
YmVycykKPiArTDoJaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKPiAgUzoJU3VwcG9y
dGVkCj4gIEY6CWFyY2gveDg2L3hlbi8qc3dpb3RsYioKPiAgRjoJZHJpdmVycy94ZW4vKnN3aW90
bGIqCj4gLS0gCj4gMi4xNC4yCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

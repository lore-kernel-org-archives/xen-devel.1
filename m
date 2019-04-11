From: Christoph Hellwig <hch@lst.de>
Subject: a few xen swiotlb cleanups
Date: Thu, 11 Apr 2019 09:19:56 +0200
Message-ID: <20190411072000.4306-1-hch__25998.1595956319$1554967281$gmane$org@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9Ko=SN=bombadil.srs.infradead.org=batv+ae372c7294e1f5d16f45+5709+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hEU0a-0004pR-Sf
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 07:20:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKYmVsb3cgYXJlIGEgY291cGxlIG9mIGNsZWFudXBzIGZvciBzd2lvdGxiLXhlbi5j
LiAgVGhleSB3ZXJlIGRvbmUgaW4KcHJlcGFyYXRpb24gb2YgZXZlbnR1YWxseSB1c2luZyB0aGUg
ZG1hLW5vbmNvaGVyZW50LmggY2FjaGUgZmx1c2hpbmcKaG9va3MsIGJ1dCB0aGF0IGZpbmFsIGdv
YWwgd2lsbCBuZWVkIHNvbWUgbWFqb3Igd29yayB0byB0aGUgYXJtMzIgY29kZQpmaXJzdC4gIFVu
dGlsIHRoZW4gSSB0aGluayB0aGVzZSBwYXRjaGVzIG1pZ2h0IGJlIGJldHRlciBpbiBtYWlubGlu
ZQp0aGFuIGluIG15IGxvY2FsIHRyZWUgc28gdGhhdCB0aGV5IGRvbid0IGJpdHJvdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

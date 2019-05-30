From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Thu, 30 May 2019 02:04:09 -0700
Message-ID: <20190530090409.GB30428__3986.34224418259$1559207127$gmane$org@infradead.org>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TeU2=T6=bombadil.srs.infradead.org=batv+882e7947623448fb4484+5758+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hWGyz-00048T-Af
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:04:21 +0000
Content-Disposition: inline
In-Reply-To: <20190529090407.1225-4-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

UGxlYXNlIGRvbid0IGFkZCB5b3VyIHByaXZhdGUgZmxhZyB0byBwYWdlLWZsYWdzLmguICBUaGUg
d2hvbGUgcG9pbnQgb2YKdGhlIHByaXZhdGUgZmxhZyBpcyB0aGF0IHlvdSBjYW4gdXNlIGl0IGlu
IGFueSB3YXkgeW91IHdhbnQgd2l0aG91CnRvdWNoaW5nIHRoZSBjb21tb24gY29kZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

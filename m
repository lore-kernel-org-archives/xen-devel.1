From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V3
Date: Thu, 6 Dec 2018 15:57:58 +0100
Message-ID: <20181206145758.GA25666__44080.3256504752$1544108212$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=g4wo=op=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gUv6I-0001yw-G7
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 14:58:02 +0000
Content-Disposition: inline
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: iommu@lists.linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, Linus Torvalds <torvalds@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

SSd2ZSBwdWxsZWQgdGhpcyBpbnRvIHRoZSBkbWEtbWFwcGluZyBmb3ItbmV4dCB0cmVlLCB3aXRo
IHRoZSBzdWdnZXN0aW9uCmZyb20gUm9iaW4gdGhhdCBpbXByb3ZlcyBiaXNlY3RhYmlsaXR5LCBh
bmQgdHdvIHVudXNlZCB2YXJpYWJsZXMgZm91bmQKYnkgdGhlIGJ1aWxkIGJvdC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

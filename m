From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V3
Date: Mon, 3 Dec 2018 18:27:03 +0100
Message-ID: <20181203172703.GA8240__35278.2277194366$1543857955$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zwza=om=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gTrzv-00034I-6t
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 17:27:07 +0000
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

RG9lcyBhbnlvbmUgYnV0IExpbnVzIGFuZCBSdXNzZWxsIGhhdmUgY29tbWVudHMgb24gdGhpcyBz
ZXJpZXM/CgpJJ2QgbGlrZSB0byBwdWxsIGl0IGluIGZhaXJseSBxdWlja2x5IGFzIEkgaGF2ZSBh
IGZhaXIgYW1vdW50IG9mCndvcmsgb24gdG9wIG9mIGl0IHRoYXQgSSdkIGxpa2UgdG8gZ2V0IGlu
dG8gNC4yMSBhcyB3ZWxsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==

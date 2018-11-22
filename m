From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 22 Nov 2018 08:50:47 -0800
Message-ID: <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw__6301.77097996256$1542905836$gmane$org@mail.gmail.com>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g4n+=ob=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gPsJD-0007uQ-0p
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 16:58:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id g11-v6so8539122ljk.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 08:58:29 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id j138sm2234001lfg.64.2018.11.22.08.58.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Nov 2018 08:58:27 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id z80-v6so8514932ljb.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 08:58:27 -0800 (PST)
In-Reply-To: <20181122140320.24080-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, jdmason@kudzu.us, xen-devel@lists.xenproject.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgNjowMyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBUaGUgMCByZXR1cm4gZG9lc24ndCB3b3JrIGZvciBkaXJlY3QgbWFw
cGluZ3MgdGhhdCBoYXZlIHJhbSBhdCBhZGRyZXNzCj4gemVybyBhbmQgYSBsb3Qgb2YgSU9NTVVz
IHRoYXQgc3RhcnQgYWxsb2NhdGluZyBidXMgc3BhY2UgZnJvbSBhZGRyZXNzCj4gemVybywgc28g
d2UgY2FuJ3QgY29uc29saWRhdGUgb24gdGhhdCwgYnV0IEkgdGhpbmsgd2UgY2FuIG1vdmUgZXZl
cnlvbmUKPiB0byBhbGwtRnMsIHdoaWNoIHRoZSBwYXRjaCBoZXJlIGRvZXMuCgpIbW0uIE1heWJl
IG5vdCBsaW1pdCBpdCB0byBqdXN0IGFsbCBvbmVzLCBidXQgYWN0dWFsbHkgdXNlIHRoZQooc3Rh
bmRhcmQsIGZvciB0aGUga2VybmVsKSBJU19FUlJfVkFMVUUoKT8KClRoYXQgYmFzaWNhbGx5IHJl
c2VydmVzIHRoZSBsYXN0IDQwOTUgdmFsdWVzIGluIGFuIHVuc2lnbmVkIGxvbmcgZm9yCmVycm9y
IHZhbHVlcy4KClRoZW4gdGhvc2UgZnVuY3Rpb25zIGNvdWxkIGFjdHVhbGx5IHJldHVybiAqd2hh
dCogZXJyb3IgdGhleQplbmNvdW50ZXJlZCwgdXNpbmcganVzdCBwbGFpbgoKICAgICAgICByZXR1
cm4gLUVOT01FTTsKCm9yIHdoYXRldmVyPwoKICAgICAgICAgICAgICAgTGludXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

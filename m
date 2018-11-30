From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V3
Date: Fri, 30 Nov 2018 11:43:18 -0800
Message-ID: <CAHk-=wia7wykuDu-mzbhF+rL1M9FnJfnoidsvkz5TPMPHUep7g__34155.0888646909$1543606944$gmane$org@mail.gmail.com>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hr5v=oj=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gSohP-0006KT-Fo
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 19:43:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id s5-v6so5990789ljd.12
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 11:43:38 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id f20-v6sm953000ljk.33.2018.11.30.11.43.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 11:43:35 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id b20so4917085lfa.12
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 11:43:34 -0800 (PST)
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, jdmason@kudzu.us, xen-devel@lists.xenproject.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgNToyMyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBFcnJvciByZXBvcnRpbmcgZm9yIHRoZSBkbWFfbWFwX3NpbmdsZSBh
bmQgZG1hX21hcF9wYWdlIG9wZXJhdGlvbnMgaXMKPiBjdXJyZW50bHkgYSBtZXNzLiBbLi5dCgpJ
IGRvbid0IHNlZSBhbnl0aGluZyBvYmplY3Rpb25hYmxlIHRoZXJlLCBidXQgaXQncyBub3QgbGlr
ZSBJIGNoZWNrZWQKYW55IG9mIHRoZSBjb250ZXh0IG9mIHRoZSBwYXRjaGVzLiBGb3IgYWxsIEkg
a25vdyB0aGVyZSBhcmUgb2RkIGNvcm5lcgpjYXNlcyB3aGVyZSBzb21lIHplcm8gdnMgRE1BX01B
UFBJTkdfRVJST1IgY29uZnVzaW9uIGx1cmtzLCBidXQgSQpndWVzcyB3ZSdsbCBmaW5kIG91dC4u
CgpTbyB5b3UgY2FuIGFkZCBteSBhY2tlZC1ieSwgZndpdy4KCiAgICAgICAgICAgICAgICBMaW51
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

From: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 05/12] include/linux/dma-mapping:
	update usage	of address zone modifiers
Date: Mon, 21 May 2018 17:30:55 +0200
Message-ID: <20180521153055.GA18588__3263.943110551$1526916298$gmane$org@lst.de>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <1526916033-4877-6-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kkrt=ii=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1fKmh3-0006Gv-G6
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:25:49 +0000
Content-Disposition: inline
In-Reply-To: <1526916033-4877-6-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng Ye <yehs2007@gmail.com>
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, colyli@suse.de, mgorman@techsingularity.net, Christoph Hellwig <hch@lst.de>, vbabka@suse.cz, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjEsIDIwMTggYXQgMTE6MjA6MjZQTSArMDgwMCwgSHVhaXNoZW5nIFllIHdy
b3RlOgo+IEZyb206IEh1YWlzaGVuZyBZZSA8eWVoczFAbGVub3ZvLmNvbT4KPiAKPiBVc2UgX19H
RlBfWk9ORV9NQVNLIHRvIHJlcGxhY2UgKF9fR0ZQX0RNQSB8IF9fR0ZQX0hJR0hNRU0gfCBfX0dG
UF9ETUEzMikuCj4gCj4gX19fR0ZQX0RNQSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEz
MiBoYXZlIGJlZW4gZGVsZXRlZCBmcm9tIEdGUAo+IGJpdG1hc2tzLCB0aGUgYm90dG9tIHRocmVl
IGJpdHMgb2YgR0ZQIG1hc2sgaXMgcmVzZXJ2ZWQgZm9yIHN0b3JpbmcKPiBlbmNvZGVkIHpvbmUg
bnVtYmVyLgo+IF9fR0ZQX0RNQSwgX19HRlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxk
IG5vdCBiZSBvcGVyYXRlZCB3aXRoCj5lYWNoIG90aGVycyBieSBPUi4KCllvdSBoYXZlIHRvIGlu
Y2x1ZGUgbWUgZm9yIHRoZSB3aG9sZSBzZXJpZXMsIG90aGVyd2lzZSBJIGhhdmUgYWJzb2x1dGVs
eQpubyB3YXkgdG8gcHJvcGVybHkgcmV2aWV3IHlvdXIgcGF0Y2guCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

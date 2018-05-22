From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC PATCH v2 02/12] arch/x86/kernel/amd_gart_64:
 update usage of address zone modifiers
Date: Tue, 22 May 2018 02:38:06 -0700
Message-ID: <20180522093806.GA25671__11588.999865535$1526981831$gmane$org@infradead.org>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <1526916033-4877-3-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=al8k=ij=bombadil.srs.infradead.org=batv+a8c6d037863aa87ae187+5385+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1fL3kM-0007I5-8v
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 09:38:22 +0000
Content-Disposition: inline
In-Reply-To: <1526916033-4877-3-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng Ye <yehs2007@gmail.com>
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, colyli@suse.de, mgorman@techsingularity.net, Thomas Gleixner <tglx@linutronix.de>, vbabka@suse.cz, Robin Murphy <robin.murphy@arm.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjb2RlIGRvZXNuJ3QgZXhpc3QgaW4gY3VycmVudCBtYWlubGluZS4gIFdoYXQga2VybmVs
IHZlcnNpb24KaXMgeW91ciBwYXRjaCBhZ2FpbnN0PwoKT24gTW9uLCBNYXkgMjEsIDIwMTggYXQg
MTE6MjA6MjNQTSArMDgwMCwgSHVhaXNoZW5nIFllIHdyb3RlOgo+IEZyb206IEh1YWlzaGVuZyBZ
ZSA8eWVoczFAbGVub3ZvLmNvbT4KPiAKPiBVc2UgX19HRlBfWk9ORV9NQVNLIHRvIHJlcGxhY2Ug
KF9fR0ZQX0RNQSB8IF9fR0ZQX0hJR0hNRU0gfCBfX0dGUF9ETUEzMikuCj4gCj4gX19fR0ZQX0RN
QSwgX19fR0ZQX0hJR0hNRU0gYW5kIF9fX0dGUF9ETUEzMiBoYXZlIGJlZW4gZGVsZXRlZCBmcm9t
IEdGUAo+IGJpdG1hc2tzLCB0aGUgYm90dG9tIHRocmVlIGJpdHMgb2YgR0ZQIG1hc2sgaXMgcmVz
ZXJ2ZWQgZm9yIHN0b3JpbmcKPiBlbmNvZGVkIHpvbmUgbnVtYmVyLgo+IF9fR0ZQX0RNQSwgX19H
RlBfSElHSE1FTSBhbmQgX19HRlBfRE1BMzIgc2hvdWxkIG5vdCBiZSBvcGVyYXRlZCBieSBPUi4K
CklmIHRoZXkgaGF2ZSBhbHJlYWR5IGJlZW4gZGVsZXRlZCB0aGUgaWRlbnRpZmllciBzaG91bGQg
bm90IGV4aXN0CmFueW1vcmUsIHNvIGVpdGhlciB5b3VyIHBhdGNoIGhhcyBpc3N1ZXMsIG9yIGF0
IGxlYXN0IHRoZSBkZXNjcmlwdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=

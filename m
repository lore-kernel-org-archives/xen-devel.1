From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC PATCH v2 00/12] get rid of GFP_ZONE_TABLE/BAD
Date: Tue, 22 May 2018 02:40:35 -0700
Message-ID: <20180522094035.GB25671__32207.4010422968$1526981962$gmane$org@infradead.org>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=al8k=ij=bombadil.srs.infradead.org=batv+a8c6d037863aa87ae187+5385+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1fL3mc-0007tC-Qf
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 09:40:42 +0000
Content-Disposition: inline
In-Reply-To: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng Ye <yehs2007@gmail.com>
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, alexander.levin@verizon.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, akpm@linux-foundation.org, colyli@suse.de, mgorman@techsingularity.net, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZWVtcyB0byBiZSBtaXNzaW5nIHBhdGNoIDEgYW5kIGdlbmVyYWxseSBiZSBpbiBzb21l
d2hhdCBvZGQgZm9ybWF0LgpDYW4geW91IHRyeSB0byByZXNlbmQgaXQgd2l0aCBnaXQtc2VuZC1l
bWFpbCBhbmQgYWdhaW5zdCBjdXJyZW50IExpbnVzJwp0cmVlPwoKQWxzbyBJJ2Qgc3VnZ2VzdCB5
b3UgZG8gY2xlYW51cHMgbGlrZSBhZGRpbmcgYW5kIHVzaW5nIF9fR0ZQX1pPTkVfTUFTSwphdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMgYmVmb3JlIGRvaW5nIGFueSByZWFsIGNoYW5nZXMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

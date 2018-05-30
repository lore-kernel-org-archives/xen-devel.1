From: Christoph Hellwig <hch@lst.de>
Subject: Re: [External] Re: [RFC PATCH v2 00/12] get rid
	of	GFP_ZONE_TABLE/BAD
Date: Wed, 30 May 2018 11:11:19 +0200
Message-ID: <20180530091119.GA30154__9677.33180518753$1527671026$gmane$org@lst.de>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <20180522183728.GB20441@dhcp22.suse.cz>
 <HK2PR03MB16847646E90A10E2D48CEA8E926B0@HK2PR03MB1684.apcprd03.prod.outlook.com>
 <20180524121853.GG20441@dhcp22.suse.cz>
 <HK2PR03MB1684ED6EC6859A88A196DC0C92690@HK2PR03MB1684.apcprd03.prod.outlook.com>
 <20180528133733.GF27180@dhcp22.suse.cz>
 <HK2PR03MB1684C44F2408F3927B1A21BC926C0@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=woii=ir=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1fNx2V-0005kn-9l
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:05:03 +0000
Content-Disposition: inline
In-Reply-To: <HK2PR03MB1684C44F2408F3927B1A21BC926C0@HK2PR03MB1684.apcprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng HS1 Ye <yehs1@lenovo.com>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "colyli@suse.de" <colyli@suse.de>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, Christoph Hellwig <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMDk6MDI6MTNBTSArMDAwMCwgSHVhaXNoZW5nIEhTMSBZ
ZSB3cm90ZToKPiAKPiBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhhdC4gSSB0aGluayB0aG9z
ZSwgbW9zdGx5IGRyaXZlcnMsIG5lZWQgdG8KPiBnZXQgdGhlIGNvcnJlY3Qgem9uZSB0aGV5IHdh
bnQuIFpPTkVfRE1BMzIgaXMgYW4gZXhhbXBsZSwgaWYgZHJpdmVycyBjYW4gYmUKPiBzYXRpc2Zp
ZWQgd2l0aCBhIGxvdyBtZW0gem9uZSwgd2h5IHRoZXkgbWFyayB0aGUgZ2ZwIGZsYWdzIGFzCj4g
J0dGUF9LRVJORUx8X19HRlBfRE1BMzInPwoKRHJpdmVycyBzaG91bGQgbmV2ZXIgdXNlIEdGUF9E
TUEzMiBkaXJlY3RseS4gIFRoZSByaWdodCBhYnN0cmFjdGlvbiBpcwp0aGUgRE1BIEFQSSwgWk9O
RV9ETUEzMiBpcyBqdXN0IGEgaGVscGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

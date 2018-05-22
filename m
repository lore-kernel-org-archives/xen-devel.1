From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: Re: [RFC PATCH v2 00/12] get rid of GFP_ZONE_TABLE/BAD
Date: Tue, 22 May 2018 10:22:42 +0000
Message-ID: <HK2PR03MB168444ADEEFF5D6397FB94D992940__47658.0999129967$1526984510$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qcm/=ij=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fL4Ra-0003RB-9s
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:23:02 +0000
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "mhocko@suse.com" <mhocko@suse.com>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, "vbabka@suse.cz" <vbabka@suse.cz>, Huaisheng Ye <yehs2007@gmail.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogb3duZXItbGludXgtbW1Aa3ZhY2sub3JnIE9uIEJlaGFsZiBPZiBDaHJpc3RvcGggSGVs
bHdpZwo+IFRoaXMgc2VlbXMgdG8gYmUgbWlzc2luZyBwYXRjaCAxIGFuZCBnZW5lcmFsbHkgYmUg
aW4gc29tZXdoYXQgb2RkIGZvcm1hdC4KPiBDYW4geW91IHRyeSB0byByZXNlbmQgaXQgd2l0aCBn
aXQtc2VuZC1lbWFpbCBhbmQgYWdhaW5zdCBjdXJyZW50IExpbnVzJwo+IHRyZWU/Cj4gClN1cmUs
IEkgd2lsbCByZWJhc2UgdGhlbSB0byBjdXJyZW50IG1haW5saW5lIEFTQVAuCgo+IEFsc28gSSdk
IHN1Z2dlc3QgeW91IGRvIGNsZWFudXBzIGxpa2UgYWRkaW5nIGFuZCB1c2luZyBfX0dGUF9aT05F
X01BU0sKPiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBzZXJpZXMgYmVmb3JlIGRvaW5nIGFueSBy
ZWFsIGNoYW5nZXMuCgpPaywgdGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uCgpTaW5jZXJlbHks
Ckh1YWlzaGVuZyBZZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==

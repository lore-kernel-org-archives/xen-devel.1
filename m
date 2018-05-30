From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: Re: [External] Re: [RFC PATCH v2 00/12] get rid of
 GFP_ZONE_TABLE/BAD
Date: Wed, 30 May 2018 09:02:13 +0000
Message-ID: <HK2PR03MB1684C44F2408F3927B1A21BC926C0__16223.9757054069$1527670918$gmane$org@HK2PR03MB1684.apcprd03.prod.outlook.com>
References: <1526916033-4877-1-git-send-email-yehs2007@gmail.com>
 <20180522183728.GB20441@dhcp22.suse.cz>
 <HK2PR03MB16847646E90A10E2D48CEA8E926B0@HK2PR03MB1684.apcprd03.prod.outlook.com>
 <20180524121853.GG20441@dhcp22.suse.cz>
 <HK2PR03MB1684ED6EC6859A88A196DC0C92690@HK2PR03MB1684.apcprd03.prod.outlook.com>
 <20180528133733.GF27180@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eq2d=ir=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1fNx0c-0005dp-Ec
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:03:06 +0000
In-Reply-To: <20180528133733.GF27180@dhcp22.suse.cz>
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, Christoph Hellwig <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogb3duZXItbGludXgtbW1Aa3ZhY2sub3JnIFttYWlsdG86b3duZXItbGludXgtbW1Aa3Zh
Y2sub3JnXSBPbiBCZWhhbGYgT2YgTWljaGFsIEhvY2tvClNlbnQ6IE1vbmRheSwgTWF5IDI4LCAy
MDE4IDk6MzggUE0KPiA+IEluIG15IG9waW5pb24sIG9yaWdpbmFsbHkgdGhlcmUgc2hvdWxkbid0
IGJlIHN1Y2ggbWFueSB3cm9uZwo+ID4gY29tYmluYXRpb25zIG9mIHRoZXNlIGJvdHRvbSAzIGJp
dHMuIEZvciBhbnkgdXNlciwgd2hldGhlciBvcgo+ID4gZHJpdmVyIGFuZCBmcywgdGhleSBzaG91
bGQgbWFrZSBhIGRlY2lzaW9uIHRoYXQgd2hpY2ggem9uZSBpcyB0aGV5Cj4gPiBwcmVmZXJyZWQu
IE1hdHRoZXcncyBpZGVhIGlzIGdyZWF0LCBiZWNhdXNlIHdpdGggaXQgdGhlIHVzZXIgbXVzdAo+
ID4gb2ZmZXIgYW4gdW5hbWJpZ3VvdXMgZmxhZyB0byBnZnAgem9uZSBiaXRzLgo+IAo+IFdlbGws
IEkgd291bGQgYXJndWUgdGhhdCB0aG9zZSBzaG91bGRuJ3QgcmVhbGx5IGNhcmUgYWJvdXQgYW55
IHpvbmVzIGF0Cj4gYWxsLiBBbGwgdGhleSBzaG91bGQgY2FyZWEgYm91dCBpcyB3aGV0aGVyIHRo
ZXkgcmVhbGx5IG5lZWQgYSBsb3cgbWVtCj4gem9uZSAoYWthIGRpcmVjdGx5IGFjY2Vzc2libGUg
dG8gdGhlIGtlcm5lbCksIGhpZ2htZW0gb3IgdGhleSBhcmUgdGhlCj4gYWxsb2NhdGlvbiBpcyBn
ZW5lcmFsbHkgbW92YWJsZS4gTWl4aW5nIHpvbmVzIGludG8gdGhlIHBpY3R1cmUganVzdAo+IG1h
a2VzIHRoZSB3aG9sZSB0aGluZyBtb3JlIGNvbXBsaWNhdGVkIGFuZCBlcnJvciBwcm9uZS4KCkRl
YXIgTWljaGFsLAoKSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRoYXQuIEkgdGhpbmsgdGhvc2Us
IG1vc3RseSBkcml2ZXJzLCBuZWVkIHRvCmdldCB0aGUgY29ycmVjdCB6b25lIHRoZXkgd2FudC4g
Wk9ORV9ETUEzMiBpcyBhbiBleGFtcGxlLCBpZiBkcml2ZXJzIGNhbiBiZQpzYXRpc2ZpZWQgd2l0
aCBhIGxvdyBtZW0gem9uZSwgd2h5IHRoZXkgbWFyayB0aGUgZ2ZwIGZsYWdzIGFzCidHRlBfS0VS
TkVMfF9fR0ZQX0RNQTMyJz8KR0ZQX0tFUk5FTCBpcyBlbm91Z2ggdG8gbWFrZSBzdXJlIGEgZGly
ZWN0bHkgYWNjZXNzaWJsZSBsb3cgbWVtLCBidXQgaXQgaXMKb2J2aW91cyB0aGF0IHRoZXkgd2Fu
dCB0byBnZXQgYSBETUEgYWNjZXNzaWJsZSB6b25lIGJlbG93IDRHLgoKPiBUaGlzIHNob3VsZCBi
ZSBhIHBhcnQgb2YgdGhlIGNoYW5nZWxvZy4gUGxlYXNlIG5vdGUgdGhhdCB5b3Ugc2hvdWxkCj4g
cHJvdmlkZSBzb21lIG51bWJlciBpZiB5b3UgY2xhaW0gcGVyZm9ybWFuY2UgYmVuZWZpdHMuIFRo
ZSBjb21wbGV4aXR5Cj4gd2lsbCBhbHdheXMgYmUgc3ViamVjdGl2ZS4KClN1cmUsIEkgd2lsbCBw
b3N0IHRoZW0gdG8gY2hhbmdlbG9nIHdpdGggbmV4dCB2ZXJzaW9uIG9mIHBhdGNoZXMuCgpTaW5j
ZXJlbHksCkh1YWlzaGVuZyBZZQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

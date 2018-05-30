From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [External] Re: [RFC PATCH v2 00/12] get rid of
 GFP_ZONE_TABLE/BAD
Date: Wed, 30 May 2018 11:12:06 +0200
Message-ID: <20180530091206.GB27180__41827.7624449276$1527671456$gmane$org@dhcp22.suse.cz>
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
 (envelope-from <srs0=pumh=ir=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1fNx9N-0006ps-T5
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:12:09 +0000
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, Ocean HY1 He <hehy1@lenovo.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "alexander.levin@verizon.com" <alexander.levin@verizon.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, NingTing Cheng <chengnt@lenovo.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "colyli@suse.de" <colyli@suse.de>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>, Christoph Hellwig <hch@lst.de>, "vbabka@suse.cz" <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDMwLTA1LTE4IDA5OjAyOjEzLCBIdWFpc2hlbmcgSFMxIFllIHdyb3RlOgo+IEZyb206
IG93bmVyLWxpbnV4LW1tQGt2YWNrLm9yZyBbbWFpbHRvOm93bmVyLWxpbnV4LW1tQGt2YWNrLm9y
Z10gT24gQmVoYWxmIE9mIE1pY2hhbCBIb2Nrbwo+IFNlbnQ6IE1vbmRheSwgTWF5IDI4LCAyMDE4
IDk6MzggUE0KPiA+ID4gSW4gbXkgb3Bpbmlvbiwgb3JpZ2luYWxseSB0aGVyZSBzaG91bGRuJ3Qg
YmUgc3VjaCBtYW55IHdyb25nCj4gPiA+IGNvbWJpbmF0aW9ucyBvZiB0aGVzZSBib3R0b20gMyBi
aXRzLiBGb3IgYW55IHVzZXIsIHdoZXRoZXIgb3IKPiA+ID4gZHJpdmVyIGFuZCBmcywgdGhleSBz
aG91bGQgbWFrZSBhIGRlY2lzaW9uIHRoYXQgd2hpY2ggem9uZSBpcyB0aGV5Cj4gPiA+IHByZWZl
cnJlZC4gTWF0dGhldydzIGlkZWEgaXMgZ3JlYXQsIGJlY2F1c2Ugd2l0aCBpdCB0aGUgdXNlciBt
dXN0Cj4gPiA+IG9mZmVyIGFuIHVuYW1iaWd1b3VzIGZsYWcgdG8gZ2ZwIHpvbmUgYml0cy4KPiA+
IAo+ID4gV2VsbCwgSSB3b3VsZCBhcmd1ZSB0aGF0IHRob3NlIHNob3VsZG4ndCByZWFsbHkgY2Fy
ZSBhYm91dCBhbnkgem9uZXMgYXQKPiA+IGFsbC4gQWxsIHRoZXkgc2hvdWxkIGNhcmVhIGJvdXQg
aXMgd2hldGhlciB0aGV5IHJlYWxseSBuZWVkIGEgbG93IG1lbQo+ID4gem9uZSAoYWthIGRpcmVj
dGx5IGFjY2Vzc2libGUgdG8gdGhlIGtlcm5lbCksIGhpZ2htZW0gb3IgdGhleSBhcmUgdGhlCj4g
PiBhbGxvY2F0aW9uIGlzIGdlbmVyYWxseSBtb3ZhYmxlLiBNaXhpbmcgem9uZXMgaW50byB0aGUg
cGljdHVyZSBqdXN0Cj4gPiBtYWtlcyB0aGUgd2hvbGUgdGhpbmcgbW9yZSBjb21wbGljYXRlZCBh
bmQgZXJyb3IgcHJvbmUuCj4gCj4gRGVhciBNaWNoYWwsCj4gCj4gSSBkb24ndCBxdWl0ZSB1bmRl
cnN0YW5kIHRoYXQuIEkgdGhpbmsgdGhvc2UsIG1vc3RseSBkcml2ZXJzLCBuZWVkIHRvCj4gZ2V0
IHRoZSBjb3JyZWN0IHpvbmUgdGhleSB3YW50LiBaT05FX0RNQTMyIGlzIGFuIGV4YW1wbGUsIGlm
IGRyaXZlcnMgY2FuIGJlCj4gc2F0aXNmaWVkIHdpdGggYSBsb3cgbWVtIHpvbmUsIHdoeSB0aGV5
IG1hcmsgdGhlIGdmcCBmbGFncyBhcwo+ICdHRlBfS0VSTkVMfF9fR0ZQX0RNQTMyJz8KPiBHRlBf
S0VSTkVMIGlzIGVub3VnaCB0byBtYWtlIHN1cmUgYSBkaXJlY3RseSBhY2Nlc3NpYmxlIGxvdyBt
ZW0sIGJ1dCBpdCBpcwo+IG9idmlvdXMgdGhhdCB0aGV5IHdhbnQgdG8gZ2V0IGEgRE1BIGFjY2Vz
c2libGUgem9uZSBiZWxvdyA0Ry4KClRoZXkgd2FudCBhIHNwZWNpZmljIHBmbiByYW5nZS4gTm90
IGEgX3pvbmVfLiBab25lIGlzIGFuIE1NIGFic3RyYWN0aW9uCnRvIG1hbmFnZSBtZW1vcnkuIEFu
ZCBub3QgYSBncmVhdCBvbmUgYXMgdGhlIHRpbWUgaGFzIHNob3duLiBXZSBoYXZlCm1vdmVkIGF3
YXkgZnJvbSB0aGUgcGVyLXpvbmUgcmVjbGFpbSBiZWNhdXNlIGl0IGp1c3QgdHVybmVkIG91dCB0
byBiZQpwcm9ibGVtYXRpYy4gTGVha2luZyB0aGlzIGFic3RyYWN0aW9uIHRvIHVzZXJzIHdhcyBh
IG1pc3Rha2UgSU1ITy4gSXQKd2FzIHN1cmVseSBjb252ZW5pZW50IGJ1dCB3ZSBjYW4gY2xlYXJs
eSBzZWUgaXQgd2FzIGp1c3QgY29uZnVzaW5nIGFuZAptYW55IHVzZXJzIGp1c3QgZ290IGl0IHdy
b25nLgoKSSBkbyBhZ3JlZSB3aXRoIENocmlzdG9waCBpbiBvdGhlciBlbWFpbCB0aGF0IHRoZSBw
cm9wZXIgd2F5IGZvciBETUEKdXNlcnMgaXMgdG8gdXNlIHRoZSBleGlzdGluZyBETUEgQVBJIHdo
aWNoIGlzIG1vcmUgdG93YXJkcyB3aGF0IHRoZXkKbmVlZC4gU2V0IGEgcmVzdHJpY3Rpb24gb24g
ZG1hLWFibGUgbWVtb3J5IHJhbmdlcy4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

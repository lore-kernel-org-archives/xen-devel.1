From: "Woods, Brian" <Brian.Woods@amd.com>
Subject: Re: [PATCH v6 2/2] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Thu, 29 Nov 2018 15:12:57 +0000
Message-ID: <20181129151255.GC28624@amd.com>
References: <20181127152441.21194-1-roger.pau@citrix.com>
 <20181127152441.21194-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=slf6=oi=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1gSNzx-0004Xq-6S
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 15:13:01 +0000
In-Reply-To: <20181127152441.21194-3-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <E10422312A183D4098957CAEE660CAB4@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDQ6MjQ6NDFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEJyaWRnZXMgYXJlIG5vdCBiZWhpbmQgYW4gSU9NTVUsIGFuZCBhcmUgYWxyZWFk
eSBzcGVjaWFsIGNhc2VkIGFuZAo+IHNraXBwZWQgaW4gYW1kX2lvbW11X2FkZF9kZXZpY2UuIEFw
cGx5IHRoZSBzYW1lIHNwZWNpYWwgY2FzaW5nIHdoZW4KPiB1cGRhdGluZyBwYWdlIHRhYmxlcy4K
PiAKPiBUaGlzIGlzIHJlcXVpcmVkIG9yIGVsc2UgdXBkYXRlX3BhZ2luZ19tb2RlIHdpbGwgZmFp
bCBhbmQgcmV0dXJuIGFuCj4gZXJyb3IgdG8gdGhlIGNhbGxlciAoYW1kX2lvbW11X3t1bn1tYXBf
cGFnZSkgd2hpY2ggd2lsbCBkZXN0cm95IHRoZQo+IGRvbWFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBCcmlh
biBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
